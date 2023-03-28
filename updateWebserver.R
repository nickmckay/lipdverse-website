
unlink("~/GitHub/lipdverse-website/public/",recursive = TRUE)
setwd("~/GitHub/lipdverse-website")
blogdown::build_site()
system("cp -r ~/GitHub/lipdverse-website/public/ ~/Dropbox/lipdverse/html")
Sys.sleep(3)
#replace blogs with articles
bi <- readr::read_file("~/Dropbox/lipdverse/html/blog/index.html")

bir <- stringr::str_replace_all(bi,"Blogs","Articles")
readr::write_file(bir,"~/Dropbox/lipdverse/html/blog/index.html")

# upload root level files:
system("rsync -vd --delete /Users/nicholas/Dropbox/lipdverse/html/ npm4@linux.cefns.nau.edu:/www/cefns.nau.edu/seses/lipdverse")


shortnames <- list.dirs("~/GitHub/lipdverse-website/public/",recursive = FALSE,full.names = FALSE)
for(shortname in shortnames){
cmd <- glue::glue("rsync -rvauz --delete /Users/nicholas/Dropbox/lipdverse/html/{shortname}/ npm4@linux.cefns.nau.edu:/www/cefns.nau.edu/seses/lipdverse/{shortname}")
system(cmd)
}

