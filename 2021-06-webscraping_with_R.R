if(!("rvest" %in% installed.packages())) {
    install.packages("rvest")
}
if(!("dplyr" %in% installed.packages())) {
    install.packages("dplyr")
}

library(rvest)
library(dplyr)