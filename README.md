
<!-- README.md is generated from README.Rmd. Please edit that file -->

# shinyShortcut

[![Travis Build
Status](https://travis-ci.org/Ewan-Keith/shinyShortcut.svg?branch=master)](https://travis-ci.org/Ewan-Keith/shinyShortcut)
[![AppVeyor Build
Status](https://ci.appveyor.com/api/projects/status/github/Ewan-Keith/shinyShortcut?branch=master&svg=true)](https://ci.appveyor.com/project/Ewan-Keith/shinyShortcut)
[![codecov](https://codecov.io/gh/Ewan-Keith/shinyShortcut/branch/master/graph/badge.svg)](https://codecov.io/gh/Ewan-Keith/shinyShortcut)
[![CRAN\_Status\_Badge](https://www.r-pkg.org/badges/version/shinyShortcut)](https://cran.r-project.org/package=shinyShortcut)

## Overview

This package creates a shortcut for a shiny app that, when run, will
launch the app directly in the user’s default browser. This makes it
easy to run shiny apps locally without having to manually run the R
project (good for local demos or small, personal applications). Simply
run the shortcut and the app will fire up.

Supported for both windows and linux systems (reports on macOS behaviour
are welcome from anyone running shinyShortuct on an apple system).

Inspired by [this blog
post](https://www.mango-solutions.com/blog/shiny-based-tablet-desktop-app)
by Mark Sellors at Mango Solutions.

IMPORTANT: The solution in this package results in orphaned Rscript.exe
instances when ran on windows machines (not yet tested on unix operating
systems). This is unlikely to cause major issues unless many instances
of resource heavy applications are opened during a single session, but
it should be kept in mind and means this package should only be used for
small scale demos.

## Installation

``` r
# Install from CRAN
install.packages("shinyShortcut")

# Install from Github
# install.packages("devtools")
devtools::install_github("ewan-keith/shinyShortcut")
```

## Usage

The package loads just a single function, also named `shinyShortcut()`.

The function writes an exectuable script (.vbs on windows and .desktop
on unix) into the app’s home directory. Shortcuts to this file can then
be created elsewhere on the user’s system. The function also creates a
new directory `/.shiny_run` into which is written the raw batch or bash
script (Windows and unix respectively) that runs the shiny app.

When the current working directory is the home directory of the shiny
app, then the default arguments should be sufficient.

``` r
library(shinyShortcut)

shinyShortcut()
```

`shinyShortcut()` accepts a number of arguments to control it’s
behaviour, these are fully documented in the function documentation.
