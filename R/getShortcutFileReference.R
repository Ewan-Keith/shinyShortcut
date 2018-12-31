# get the file reference for the shortcut file
getShortcutFileReference <- function(shinyDirectory, OS){
  if (OS == "windows"){
    file.path(shinyDirectory, "shinyShortcut.vbs")
  } else if (OS == "unix"){
    file.path(shinyDirectory, "shinyShortcut.desktop")
  } else {
    paste("unidentified operating system provided to getShortcutFileReference():", OS)
  }
}
