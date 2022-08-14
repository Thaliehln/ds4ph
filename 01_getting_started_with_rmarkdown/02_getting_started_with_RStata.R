# Find your Stata binary path
library(RStata)
stata_bin_path <- RStata::chooseStataBin()
print(stata_bin_path)
