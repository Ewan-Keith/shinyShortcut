# append creates files and dirs to .gitignore file
AppendGitIgnore <- function(shinyDirectory){
  cat(c("\n.shiny_run/", "\nshinyShortcut"), sep = "",
      file = file.path(shinyDirectory, ".gitignore"),
      append = TRUE)
  message("* Adding `.shiny_run/` and `shinyShortcut` to .gitignore")
}
