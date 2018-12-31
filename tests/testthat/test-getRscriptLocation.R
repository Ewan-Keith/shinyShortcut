context("getRscriptLocation returns correct String locations")

test_that("getRscriptLocation returns the correct location on a windows system", {
  expect_equal(getRscriptLocation("C:/Program Files/R/R-3.5.2", "windows"),
               "C:\\Program Files\\R\\R-3.5.2\\bin\\Rscript.exe")
})

test_that("getRscriptLocation returns the correct location on a unix system", {
  expect_equal(getRscriptLocation("/usr/lib64/R", "unix"),
               "#! /usr/lib64/R/bin/Rscript")
})

test_that("getRscriptLocation returns the correct message on an unidentified os", {
  expect_equal(getRscriptLocation("home", "test_os"),
               "unidentified operating system provided to getRscriptLocation(): test_os")
})
