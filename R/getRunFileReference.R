# return the file location for the low level execution file
getRunFileReference <- function(shinyDirectory, OS){
  if (OS == "windows"){
    file.path(shinyDirectory, ".shiny_run", "shinyShortcut.cmd")
  } else if (OS == "unix"){
    file.path(shinyDirectory, ".shiny_run", "shinyShortcut.r")
  } else {
    paste("unidentified operating system provided to getRunFileReference():", OS)
  }
}
