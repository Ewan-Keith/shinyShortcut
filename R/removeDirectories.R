
#' remove any existing shinyShortcut files/directories
#'
#' Cleans out all file system artifacts for the shinyShortcut package.
#'
removeDirectories <- function(homeDirectory) {
  unlink(paste0(homeDirectory, "/.shiny_run"),
         recursive = TRUE, force = TRUE)
  unlink(paste0(homeDirectory, "/shiny_run.desktop"),
         recursive = FALSE, force = TRUE)
  unlink(paste0(homeDirectory, "/shinyShortcut.vbs"),
         recursive = FALSE, force = TRUE)
  unlink(paste0(homeDirectory, "/shinyShortcut.cmd"),
         recursive = FALSE, force = TRUE)
}
