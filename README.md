# Friedman <br>
Tools for Exploring the Birth Weight Dataset

The **Friedman** package is designed to make it easy for beginners to explore the
`birthwt` dataset from the MASS package. My goal was to create simple,
beginner-friendly functions that help users clean the data, summarize variables,
and create quick visualizations without needing to write everything from scratch.

This package was developed as part of my final project for LIS 4370. It focuses on clarity, 
accessibility, and giving new R users a smooth introduction to data exploration, 
including explanatory responses to common user errors.

## Features
The package currently includes three main functions:

### `bw_data()`
Returns a cleaned version of the birth weight dataset with readable variable
names and proper factor labels.

### `bw_summary(group)`
Provides a summary table showing the number of observations, mean birth weight,
and standard deviation by a selected grouping variable  
(e.g., `"smoke"`, `"race"`, `"ht"`).

### `bw_plot(x, trend = TRUE)`
Creates a scatterplot comparing predictors to birth weight, with an optional
trend line. A simple and flexible plotting tool built for beginners.

## Installation
Install with GitHub: install_github("agl100/Friedman")
