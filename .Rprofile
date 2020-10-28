#
# .Rprofile
# Mickael Temporão < m dot temporao at sciencespobordeaux dot fr >
#

.First <- function(){
}

.Last <- function(){
}

options(max.print       = 500)
options(scipen          = 10)
options(editor          = "nvim")
options(menu.graphics   = FALSE)
options(prompt          = "> ")
options(continue        = "... ")
options(width           = 120)
options(defaultPackages = c(getOption("defaultPackages"), "tidyverse"))
options(browser         = "qutebrowser")

utils::rc.settings(ipck = TRUE)

q <- function (save = "no", ...) {
  quit(save = save, ...)
}

exit <- function (save = "no", ...) {
  q(save = save, ...)
}

if(Sys.getenv("TERM") == "xterm-256color")
message("\n === Successfully loaded .Rprofile === \n")

