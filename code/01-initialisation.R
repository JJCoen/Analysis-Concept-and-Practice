# define knitr options
knitr::opts_chunk$set(echo = TRUE)
knitr::opts_chunk$set(warning = FALSE)
knitr::opts_chunk$set(message = FALSE)
knitr::opts_chunk$set(fig.width = "center", fig.width = 10)

# set any missing NAs in table to blank
options(knitr.kable.NA='')

# set 2 decimal places on digits
# Register an inline hook:
knitr::knit_hooks$set(inline = function(x) {
  x <- sprintf("%1.2f", x)
  paste(x, collapse = ", ")
})
# Thanks to RLesur on StackOverflow
# https://stackoverflow.com/questions/48199137/set-number-of-decimal-places-to-show-in-output

# load R packages
# Function to Install and Load R Packages
# thanks to Pratik Patil
# https://stackoverflow.com/questions/9341635/check-for-installed-packages-before-running-install-packages

Install_And_Load <- function(Required_Packages)
{
  Remaining_Packages <- Required_Packages[!(Required_Packages %in% installed.packages()[,"Package"])];

  if(length(Remaining_Packages))
  {
    install.packages(Remaining_Packages);
  }
  for(package_name in Required_Packages)
  {
    library(package_name,character.only=TRUE,quietly=TRUE);
  }
}

# Specify the list of required packages to be installed and load
Required_Packages=c("data.table", "ggplot2", "ggthemes", "knitr", "kableExtra",
                    "latexpdf", "magrittr", "purrr", "psych", # contains peas data
                    "psychTools", "tibble");

# Call the Function
Install_And_Load(Required_Packages)

cat("The following packages have been loaded\n")
cat(Required_Packages)

# clean up the environment
rm(Install_And_Load)

