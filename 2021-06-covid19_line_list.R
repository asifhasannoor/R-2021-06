rm(list=ls()) # Removes all lists stored previously

library(Hmisc) #import

data <- read.csv("~/R_CODE/2021-06_covid_19_list/COVID19_line_list_data.csv") #load the dataset

describe(data) #Hmisc command

# cleaned up death column
data$death_dummy <- as.integer(data$death != 0)
# death rate
sum(data$death_dummy)


# Age
# claim : people who die are older
dead = subset(data, death_dummy == 1)
alive = subset(data, death_dummy ==0)
mean(dead$age, na.rm = TRUE)
mean(alive$age, na.rm = TRUE)

# is this statistically significant?
t.test(alive$age, dead$age, alternative = "two.sided", conf.level = 0.99)

# normally if p-value < 0.05, we reject the null hypothesis
# here, p-value ~ 0, so we reject the null hypothesis
# conclude that this is statistically significant

# GENDER
# claim: gender has no effect
men = subset(data, gender == "male")
women = subset(data, gender == "women")
