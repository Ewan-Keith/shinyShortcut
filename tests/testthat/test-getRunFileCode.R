context("getRunFileCode returns correct String command")

test_that("getRunFileCode returns the correct command on a windows system", {
  expect_equal(getRunFileCode("C:\\Program Files\\R\\R-3.5.2\\bin\\Rscript.exe",
                              "shiny::runApp('C:/shiny_dir', launch.browser = TRUE)",
                              "windows"),
               "\"C:\\Program Files\\R\\R-3.5.2\\bin\\Rscript.exe\" -e \"shiny::runApp('C:/shiny_dir', launch.browser = TRUE)\"")
})

test_that("getRunFileCode returns the correct command on a unix system", {
  expect_equal(getRunFileCode("/usr/lib64/R",
                              "shiny::runApp('/home/user/shiny_dir', launch.browser = TRUE)",
                              "unix"),
               "/usr/lib64/R\n\nshiny::runApp('/home/user/shiny_dir', launch.browser = TRUE)")
})

test_that("getRunFileCode returns the correct message on an unidentified os", {
  expect_equal(getRunFileCode("ignored", "ignored", "test_os"),
               "unidentified operating system provided to getRunFileCode(): test_os")
})
