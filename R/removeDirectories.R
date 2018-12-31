#' remove any existing shinyShortcut files/directories
#'
#' Cleans out all file system artifacts for the shinyShortcut package.
#'
removeDirectories <- function(homeDirectory) {
  unlink(file.path(homeDirectory, ".shiny_run"),
         recursive = TRUE, force = TRUE)
  unlink(file.path(homeDirectory, "shiny_run.desktop"),
         recursive = FALSE, force = TRUE)
  unlink(file.path(homeDirectory, "shinyShortcut.vbs"),
         recursive = FALSE, force = TRUE)
  unlink(file.path(homeDirectory, "shinyShortcut.cmd"),
         recursive = FALSE, force = TRUE)
}
