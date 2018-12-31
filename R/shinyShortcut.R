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
#' @param testing If True then a number of file system actions will not be taken
#' to allow for cleaner testing of code with minimal mocking, defaults to FALSE
#' and will rarely need changed to otherwise.
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
                          gitIgnore = FALSE, testing = FALSE) {

  # if relevant files exist, and not testing, delete them first
  if (!testing) removeDirectories(shinyDirectory)

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

  # write execution file to .shiny_run and print message for user
  writeToFile(runFileCode, runFileReference, OS)

  if (OS == "windows") {

    # write vbs file to home directory
    runFileReferenceBackDash <- gsub("/", "\\\\", runFileReference)

    vbsCode <- paste0(
      "Set objShell = WScript.CreateObject(\"WScript.Shell\")",
      "\n",
      "objShell.Run(\"",
      runFileReferenceBackDash,
      "\"), 0, True")

    vbsReference <-
      file.path(shinyDirectory, "shinyShortcut.vbs")

    writeToFile(vbsCode, vbsReference, OS)

  } else if (OS == "unix"){

    # add shortuct in home directory
    shortcutCode <- paste0(
      "[Desktop Entry]\n",
      "Name=shinyShortcut\n",
      "Comment=Run Shiny App\n",
      "Exec=", runFileReference, "\n",
      "Terminal=false\n",
      "Type=Application")

    shortcutReference <-
      file.path(shinyDirectory, "shinyShortcut.desktop")

    writeToFile(shortcutCode, shortcutReference, OS)

  } else stop("OS must be one of \"windows\" or \"unix\"")

  # if specified, add files and folder to local .gitignore file
  if (gitIgnore){
    cat(c("\n.shiny_run/", "\nshinyShortcut"), sep = "",
        file = file.path(shinyDirectory, ".gitignore"),
        append = TRUE)
    message("* Adding `.shiny_run/` and `shinyShortcut` to .gitignore")
  }
}
