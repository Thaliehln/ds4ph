# R packages to install to generate dynamic reports using R and Stata

install.packages("rmarkdown")
install.packages("RStata")
install.packages("usethis")

# Configure the RStata

library(RStata)
RStata::chooseStataBin()

# You should get something
[1] "\"C:\\Program Files\\Stata16\\StataIC-64\""

# Open configuration file
usethis::edit_r_profile("user")
