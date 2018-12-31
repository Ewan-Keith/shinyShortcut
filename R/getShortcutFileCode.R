# get the code for the shortcut files
getShortcutFileCode <- function(runFileReference, OS){
  if (OS == "windows"){
    paste0(
      "Set objShell = WScript.CreateObject(\"WScript.Shell\")",
      "\n",
      "objShell.Run(\"",
      gsub("/", "\\\\", runFileReference),
      "\"), 0, True")
  } else if (OS == "unix"){
    paste0(
      "[Desktop Entry]\n",
      "Name=shinyShortcut\n",
      "Comment=Run Shiny App\n",
      "Exec=", runFileReference, "\n",
      "Terminal=false\n",
      "Type=Application")
  } else {
    paste("unidentified operating system provided to getShortcutFileCode():", OS)
  }
}
