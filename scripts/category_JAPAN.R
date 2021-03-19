# Sample script to select Jeopardy answers and questions related to Japan
# Requires packages: dplyr, lubridate
#
stopifnot(getRversion() >= 4.0)  # for tools::R_user_dir
suppressPackageStartupMessages(library("dplyr"))
#
# Read the previously downloaded Jeopardy clues data:
jdata_file <- file.path(tools::R_user_dir("jeopardy_clue_dataset", "data"),
  "jdata.rds")
stopifnot(file.exists(jdata_file))  # run get_data.R to get the data
jdata <- readRDS(jdata_file)
#
names(jdata)
#> [1] "round"        "value"        "daily_double" "category"     "comments"   
#> [6] "answer"       "question"     "air_date"     "notes"
#
# Extract all the categories:
categories <- names(table(jdata[["category"]]))
length(categories)
#> [1] 44854
#
# Find categories related to Japan:
indxJAPAN <- grep("JAPAN", categories, ignore.case=TRUE)
length(indxJAPAN)
#> [1] 33
categories[indxJAPAN]  # Look at Japan related categories, select some
#
# Japan categories to consider:
indx01 <- which(jdata[["category"]] == "JAPANESE CITIES")
indx02 <- which(jdata[["category"]] == "JAPANESE CUISINE")
indx03 <- which(jdata[["category"]] == "JAPANESE GEOGRAPHY")
indx04 <- which(jdata[["category"]] == "JAPANESE POP CULTURE")
indxAll <- c(indx01, indx02, indx03, indx04)
length(indxAll)
#> 22
#
# Optional mix up of the answer/questions:
# indxAll <- sample(indxAll, length(indxAll))
#
# Write out tab-delimited file with selected columns:
out_file <- "ycqa.tsv"
jdata[indxAll, ] %>%
  mutate(year = lubridate::year(air_date)) %>%
  select(year, category, answer, question) %>%
  write.table(file=out_file, sep="\t", row.names=FALSE)
