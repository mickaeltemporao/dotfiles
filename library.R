#!/usr/bin/env Rscript
# ------------------------------------------------------------------------------
# Title:        R Packages
# Filename:     R_libs.R
# Description:  List of R Packages mostly used for Data Science Tasks
# Version:      0.0.0.001
# Created:      2016-05-12 07:08:19
# Modified:     2017-06-01 09:36:59
# Author:       Mickael Temporão < mickael.temporao.1 at ulaval.ca >
# ------------------------------------------------------------------------------
# Copyright (C) 2016 Mickael Temporão
# Licensed under the GPL-2 < https://www.gnu.org/licenses/gpl-2.0.txt >
# ------------------------------------------------------------------------------

# CRAN PACKAGES ----------------------------------------------------------------
cran_packages <- c(
  "arm",
  "devtools",
  "SnowballC",
  "car",
  "e1071",
  "glmnet",
  "kernlab",
  "nnet",
  "party",
  "psych",
  "randomForest",
  "survival",
  "xgboost"
)

# GITHUB PACKAGES -------------------------------------------------------------
git_packages <- c(
  "RcppCore/Rcpp",
  "RcppCore/RcppEigen",
  "Rdatatable/data.table",
  "cran/setwidth",
  "gaborcsardi/pkgconfig",
  "hadley/tidyverse",
  "harrysouthworth/gbm",
  "igraph/rigraph",
  "IQSS/Zelig",
  "jalvesaq/colorout",
  "jrnold/ggthemes"
  "kbenoit/quanteda",
  "robjhyndman/forecast",
  "rstudio/rmarkdown",
  "stefvanbuuren/mice",
  "topepo/caret/pkg/caret",
)

# CRAN INSTALL ----------------------------------------------------------------
cran_install <- cran_packages[!(cran_packages %in% installed.packages()[,"Package"])]
if(length(cran_install)) install.packages(cran_install)

# GITHUB INSTAL ---------------------------------------------------------------
git_install <- git_packages[!(git_packages %in% installed.packages()[,"Package"])]
if(length(git_install)) devtools::install_github(git_install)
