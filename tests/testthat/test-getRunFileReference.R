context("getRunFileReference returns correct String reference")

test_that("getRunFileReference returns the correct reference on a windows system", {
  expect_equal(getRunFileReference("C:/shiny_dir", "windows"),
               "C:/shiny_dir/.shiny_run/shinyShortcut.cmd")
})

test_that("getRunFileReference returns the correct reference on a unix system", {
  expect_equal(getRunFileReference("/home/user/shiny_dir", "unix"),
               "/home/user/shiny_dir/.shiny_run/shinyShortcut.r")
})

test_that("getRunFileReference returns the correct message on an unidentified os", {
  expect_equal(getRunFileReference("C:/shiny_dir", "test_os"),
               "unidentified operating system provided to getRunFileReference(): test_os")
})
