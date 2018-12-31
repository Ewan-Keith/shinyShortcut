# returns a string representation of the low level execution script code
getRunFileCode <- function(rScriptLocation, shinyCommand, OS){
  if (OS == "windows"){
    paste0("\"", rScriptLocation, "\"", " -e ", "\"", shinyCommand, "\"")
  } else if (OS == "unix"){
    paste0(rScriptLocation, "\n\n", shinyCommand)
  } else {
    paste("unidentified operating system provided to getRunFileCode():", OS)
  }
}
