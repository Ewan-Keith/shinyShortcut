# utility function for writing shinyShortuct files and messaging the user
writeToFile <- function(fileContents, fileReference, OS){
  write(fileContents, fileReference)
  message(paste("* Writing", fileReference))
  if (OS == "unix") system(paste0("chmod +x ", fileReference))
}
