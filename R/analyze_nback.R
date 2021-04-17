##' Load all the data
##'
##' Only files starting with "TwoBack" character are included.
##'
##' @title
##' @param path The directory contains all the data files.
analyze_nback <- function(path) {
  files <- fs::dir_ls(path, regexp = "TwoBack")
  vroom::vroom(files, id = "path") %>%
    mutate(path = fs::path_ext_remove(path)) %>%
    separate(path, c(NA, "subj_id", "task", "part"), sep = "-\\w+_") %>%
    mutate(rt = 1000 * rt) %>%
    dataproc.iquizoo::preproc_data(nback, by = c("subj_id", "task", "part"))
}
