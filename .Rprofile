## Rprofile
# ------------------------------------------------------------------------------
# Title:        R Profile
# Filename:     .Rprofile
# Description:  R environment customization
# Version:      0.0.0.005
# Created:      2016-11-05 17:13:28
# Modified:     2021-08-11 12:04:42
# Author:       Mickael Temporão < m dot temporao at sciencespobordeaux dot fr >
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

options(max.print       = 200)
options(scipen          = 10)
options(editor          = "nvim")
options(menu.graphics   = FALSE)
options(prompt          = "> ")
options(continue        = "... ")
options(browser         = "qutebrowser")

q <- function (save = "no", ...) {
  quit(save = save, ...)
}

exit <- function (save = "no", ...) {
  q(save = save, ...)
}

if(Sys.getenv("TERM") == "xterm-256color")
message("\n # Successfully loaded .Rprofile --------------------------------\n")

