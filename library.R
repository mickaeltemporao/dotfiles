#!/usr/bin/env Rscript
# ------------------------------------------------------------------------------
# Title:        R Packages
# Filename:     R_libs.R
# Description:  List of R Packages mostly used for Data Science Tasks
# Version:      0.0.0.001
# Created:      2016-05-12 07:08:19
# Modified:     2017-03-11 10:35:08
# Author:       Mickael Temporão < mickael.temporao.1 at ulaval.ca >
# ------------------------------------------------------------------------------
# Copyright (C) 2016 Mickael Temporão
# Licensed under the GPL-2 < https://www.gnu.org/licenses/gpl-2.0.txt >
# ------------------------------------------------------------------------------

# CRAN PACKAGES ----------------------------------------------------------------
cran_packages <- c(
  "devtools",
  "SnowballC",
  "car",
  "caTools",
  "e1071",
  "flexclust",
  "glmnet",
  "kernlab",
  "minqa",
  "nnet",
  "party",
  "psych",
  "randomForest",
  "survival",
  "xgboost"
)

# GITHUB PACKAGES -------------------------------------------------------------
git_packages <- c(
  "bhklab/mRMRe",
  "gaborcsardi/pkgconfig",
  "hadley/tidyverse",
  "hadley/haven",
  "hadley/readxl",
  "hadley/rvest",
  "harrysouthworth/gbm",
  "igraph/rigraph",
  "jrnold/ggthemes"
  "kbenoit/quanteda",
  "RcppCore/Rcpp",
  "RcppCore/RcppEigen",
  "Rdatatable/data.table",
  "rstudio/rmarkdown",
  "robjhyndman/forecast",
  "stefvanbuuren/mice",
  "topepo/caret/pkg/caret"
)

# CRAN INSTALL ----------------------------------------------------------------
cran_install <- cran_packages[!(cran_packages %in% installed.packages()[,"Package"])]
if(length(cran_install)) install.packages(cran_install)

# GITHUB INSTAL ---------------------------------------------------------------
git_install <- git_packages[!(git_packages %in% installed.packages()[,"Package"])]
if(length(git_install)) devtools::install_github(git_install)
