library(targets)
library(tarchetypes)
purrr::walk(fs::dir_ls("R"), source)
tar_option_set(packages = "tidyverse")
list(
  tar_file(dir_data, fs::path("data")),
  tar_target(results, analyze_nback(path = dir_data)),
  tar_file(
    file_output, {
      file <- "results.csv"
      write_excel_csv(results, file)
      file
    }
  )
)
