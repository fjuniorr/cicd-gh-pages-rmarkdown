arg <- commandArgs(trailingOnly = TRUE)

rmarkdown::render("index.Rmd", output_dir = arg)