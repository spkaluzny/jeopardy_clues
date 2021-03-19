Answers (clues) and questions from 36 seasons of the game show Jeopardy.
The data was announced on
[r/datatsets](https://old.reddit.com/r/datasets/comments/cj3ipd/jeopardy_dataset_with_349000_clues)
and downloaded from
[github](https://github.com/jwolle1/jeopardy_clue_dataset).  
Variables include:
- round -- 1 for Single Jeopardy, 2 for Double, 3 for Final
- value -- 200, 400, 600, 800, 1000, etc.
- daily_double -- yes or no
- category
- comments -- about the category
- answer -- the clue
- question - the correct response
- air_date
- notes -- specifies if it was a tournament match, etc.

The R script file `scripts/get_data.R` will download the zipped data
from Github, read it into R and then save the R object (a tibble) under
`tools::R_user_dir("jeopardy_clue_dataset", "data")` for use in
subsequent R sessions.
