.First <- function(){
}

.Last <- function(){
}

local({r <- getOption("repos")
      r["CRAN"] <- "http://cran.revolutionanalytics.com"
      options(repos=r)})

options(max.print       = 500)
options(scipen          = 10)
options(editor          = "vim")
options(menu.graphics   = FALSE)
options(prompt          = "> ")
options(continue        = "... ")
options(width           = 120)
options(defaultPackages = c(getOption("defaultPackages"), "tidyverse"))

utils::rc.settings(ipck = TRUE)

q <- function (save="no", ...) {
  quit(save=save, ...)
}

if(Sys.getenv("TERM") == "xterm-256color")
message("\n # Successfully loaded .Rprofile -----------------------------------------------\n")
