# 01. Getting start with R Markdown
# Install the rmarkdown package
# Check if the package `rmarkdown` is already installed.

rmarkdown_is_installed <- ("rmarkdown" %in% installed.packages())

# If the package `rmarkdown` is not already installed, download and install it.

if (!rmarkdown_is_installed){
  install.packages("rmarkdown")
}
