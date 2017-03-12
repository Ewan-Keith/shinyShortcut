context("shinyShortcut returns correct output")

test_that("ShinyShorcut returns the correct files", {
  ## test windows code
  with_mock(

    # turn off any functions that would make changes to the
    # directory. They're not what is being tested
    `unlink` = function(...){},
    `dir.create` = function(...){},
    `system` = function(...){},
    `write` = function(code, reference){
      return(c(code, reference))
    },

    expect_equal(shinyShortcut(shinyDirectory = "C:/shiny_dir",
                               OS = "windows")[1],
                 paste0("Set objShell = WScript.CreateObject",
                        "(\"WScript.Shell\")\nobjShell.Run",
                        "(\"C:\\shiny_dir\\.shiny_run\\shinyShortcut.cmd\")",
                        ", 0, True")),

    expect_error(shinyShortcut(shinyDirectory = "C:/shiny_dir",
                               OS = "testing"),
                 "OS must be one of \"windows\" or \"unix\"")
  )

  ## test unix code
  with_mock(
    # turn off any functions that would make changes to the
    # directory. They're not what is being tested
    `unlink` = function(...){},
    `dir.create` = function(...){},
    `system` = function(...){},
    `write` = function(code, reference){
      linux_code <<- code
    },

    shinyShortcut(shinyDirectory = "C:/shiny_dir",
                  OS = "unix"),

    expect_equal(linux_code,
                 paste0("[Desktop Entry]\nName=shinyShortcut\nComment=Run ",
                        "Shiny App\nExec=C:/shiny_dir/.shiny_run/",
                        "shinyShortcut.r\nTerminal=false\nType=Application")),

    expect_error(shinyShortcut(shinyDirectory = "C:/shiny_dir",
                               OS = "testing"),
                 "OS must be one of \"windows\" or \"unix\"")

  )
})
