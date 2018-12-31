#' Create Shiny App Shortcut
#'
#' Creates an executable file that, when ran, will open the co-located shiny
#' app using the user's default internet browser.
#'
#' @param shinyDirectory The top-level directory containing the code and
#' materials for the shiny application. Also where the
#' final shortcut file will be saved.
#' @param OS The operating system that R is being ran on. Must be one of
#' \code{"windows"} or \code{"unix"}.
#' @param gitIgnore If True then all produced files will be added to a
#' \code{.gitignore} file in the specified directory (if there is no
#' such file it will be created).
#'
#' @details Calling \code{shinyShortcut} will write an executable file
#' that will run the shiny app in the user's default browser.
#' This executable is stored in a created folder named  .shiny_run'
#' whilst a shortcut that will silently run the executable
#' is saved in the home directory as 'shinyShortcut' (this will
#' be a .vbs script on windows or a .desktop file on unix systems).
#' These files can then be linked to from other locations such as the
#' user's desktop.
#'
#' @examples
#' shinyShortcut()
#' @export
shinyShortcut <- function(shinyDirectory = getwd(), OS = .Platform$OS.type,
                          gitIgnore = FALSE) {

  # ensure that a valid OS has been provided, else terminate
  if (!is.element(OS, c("windows", "unix")))
    stop("OS must be one of \"windows\" or \"unix\"")

  # if relevant files exist delete them first
  removeDirectories(shinyDirectory)

  # create shiny_run directory
  dir.create(file.path(shinyDirectory, ".shiny_run"))

  # get the R executable location
  rScriptLocation <- getRscriptLocation(R.home(), OS)

  # define the R command to run the shiny application in browser
  shinyCommand <-
    paste0("shiny::runApp('", shinyDirectory, "',"," launch.browser = TRUE)")

  # get the location for the low level execution file
  runFileReference <- getRunFileReference(shinyDirectory, OS)

  # get the execution code for the low level execution file
  runFileCode <-getRunFileCode(rScriptLocation, shinyCommand, OS)

  # get the run code for the shortcut file
  shortcutCode <- getShortcutFileCode(runFileReference, OS)

  # get the location for the shortcut file
  shortcutReference <- getShortcutFileReference(shinyDirectory, OS)

  # write execution file to .shiny_run and print message for user
  writeToFile(runFileCode, runFileReference, OS)

  # write shortcut file to the home directory and print message for user
  writeToFile(shortcutCode, shortcutReference, OS)

  # if specified, add files and folder to local .gitignore file
  if (gitIgnore) AppendGitIgnore(shinyDirectory)
}
