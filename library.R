#!/usr/bin/env Rscript
# ------------------------------------------------------------------------------
# Title:        R Packages
# Filename:     R_libs.R
# Description:  List of R Packages mostly used for Data Science Tasks
# Version:      0.0.0.001
# Created:      2016-05-12 07:08:19
# Modified:     2016-09-12 11:18:41
# Author:       Mickael Temporão < mickael.temporao.1 at ulaval.ca >
# ------------------------------------------------------------------------------
# Copyright (C) 2016 Mickael Temporão
# Licensed under the GPL-2 < https://www.gnu.org/licenses/gpl-2.0.txt >
# ------------------------------------------------------------------------------

# CRAN PACKAGES ----------------------------------------------------------------
cran_packages <- c(
  "devtools"
)

# GITHUB PACKAGES -------------------------------------------------------------
git_packages <- c(
  "bhklab/mRMRe",
  "cran/SnowballC",
  "cran/car",
  "cran/caTools",
  "cran/e1071",
  "cran/flexclust",
  "cran/glmnet",
  "cran/kernlab",
  "cran/minqa",
  "cran/nnet",
  "cran/party",
  "cran/psych",
  "cran/randomForest",
  "cran/ROCR",
  "cran/rpart",
  "cran/rpart.plot",
  "cran/survival",
  "cran/xgboost",
  "gaborcsardi/pkgconfig",
  "hadley/dplyr",
  "hadley/ggplot2",
  "hadley/haven",
  "hadley/readxl",
  "hadley/rvest",
  "hadley/tidyr",
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
