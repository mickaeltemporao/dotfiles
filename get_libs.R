#!/usr/bin/env Rscript
# ------------------------------------------------------------------------------
# Title:        Get Library
# Filename:     get_libs.R
# Description:  Get and install all your old R libraries
# Version:      0.0.0.000
# Created:      2017-07-30 15:56:12
# Modified:     2017-07-30 16:10:58
# Source:       Mickael Temporão < mickael.temporao.1 at ulaval.ca >
# ------------------------------------------------------------------------------
# Copyright (C) 2017 Mickael Temporão
# Licensed under the GPL-2 < https://www.gnu.org/licenses/gpl-2.0.txt >
# ------------------------------------------------------------------------------
# Highly inspired by :
# https://pythonandr.com/2017/07/27/quick-way-of-installing-all-your-old-r-libraries-on-a-new-device/?utm_source=feedburner&utm_medium=feed&utm_campaign=Feed%3A+RDiscoveringPythonR+%28R+%E2%80%93+Discovering+Python+%26+R%29

#TODO: Set whole thing as a function that can be called
# Read or create package backup file
libs_df <- try(read.csv('r_package_list.csv'), silent = TRUE)

if(class(libs_df) == "try-error") {
  libs_df <- as.data.frame(installed.packages())
  write.csv(libs_df, 'r_package_list.csv')
}

# Create a data frame with missing packages compared to backup file
current_libs <- as.data.frame(installed.packages())
to_install   <- setdiff(libs_df, current_libs)

# Download and install the remaining packages
install.packages(to_install)
