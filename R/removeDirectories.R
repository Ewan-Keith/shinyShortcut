
#' remove any existing shinyShortcut files/directories
#'
#' Cleans out all file system artifacts for the shinyShortcut package.
#'
removeDirectories <- function(homeDirectory) {
  unlink(file.path(shinyDirectory, ".shiny_run"),
         recursive = TRUE, force = TRUE)
  unlink(file.path(shinyDirectory, "shiny_run.desktop"),
         recursive = FALSE, force = TRUE)
  unlink(file.path(shinyDirectory, "shinyShortcut.vbs"),
         recursive = FALSE, force = TRUE)
  unlink(file.path(shinyDirectory, "shinyShortcut.cmd"),
         recursive = FALSE, force = TRUE)
}
