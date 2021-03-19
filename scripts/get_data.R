# Download jeopardy clues dataset from Github, unzip, read in and
#  save as an R object under path specified by tools::R_user_dir 
stopifnot(getRversion() >= 4.0)  # for tools::R_user_dir
url_data <- "https://github.com/jwolle1/jeopardy_clue_dataset/raw/master/master_season1-36.tsv.zip"
zip_data_path <- file.path(tempdir(), "master_season1-36.tsv.zip")
trydownload <- try(
  download.file(url_data, destfile=zip_data_path, quiet=TRUE),
  silent=TRUE
)
stopifnot(trydownload == 0)
jdata <- readr::read_tsv(zip_data_path, progress=FALSE)
jdata_dir <- tools::R_user_dir("jeopardy_clue_dataset", "data")
if(!dir.exists(jdata_dir)) {
  dir.create(jdata_dir, recursive = TRUE)
}
saveRDS(jdata, file.path(jdata_dir, "jdata.rds"))
