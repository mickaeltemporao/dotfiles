# Rprofile
# ------------------------------------------------------------------------------
# Title:        R Profile
# Filename:     .Rprofile
# Description:  R environment customization
# Version:      0.0.0.005
# Created:      2016-11-05 17:13:28
# Modified:     2017-06-17 21:52:47
# Author:       Mickael Temporão < mickael.temporao.1 at ulaval.ca >
# ------------------------------------------------------------------------------
# Copyright (C) 2016 Mickael Temporão
# Licensed under the GPL-2 < https://www.gnu.org/licenses/gpl-2.0.txt >
# ------------------------------------------------------------------------------


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
options(browser = "/usr/bin/open -a '/Applications/Google Chrome Canary.app'")

utils::rc.settings(ipck = TRUE)

q <- function (save="no", ...) {
  quit(save=save, ...)
}

if(Sys.getenv("TERM") == "xterm-256color")
message("\n # Successfully loaded .Rprofile --------------------------------\n")
