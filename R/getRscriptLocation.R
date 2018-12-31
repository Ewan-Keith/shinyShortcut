#' Fetch and format the location of the R executable, depending on OS
getRscriptLocation <- function(rHome, os) {
  if (os == "windows") {
    gsub("/", "\\\\", file.path(rHome, "bin", "Rscript.exe"))
  } else if (os == "unix") {
    paste("#!", file.path(rHome, "bin", "Rscript"))
  }else {
    paste("unidentified operating system provided to getRscriptLocation():", os)
  }
}
