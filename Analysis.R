library(dplyr)
library(ggplot2)
library(readr)

# Import data
df <- read.delim("Mental_Health_after_Tableau.csv",
                 fileEncoding = "UTF-16LE",
                 sep = "\t",
                 header = TRUE,
                 stringsAsFactors = FALSE)

# Check the structure of the data
print(head(df))

# Question 1. Analyze burnout by age group
burnout_by_age <- df %>%
  group_by(Age.Group) %>%
  summarise(
    total = n(),
    burnout_count = sum(Mental.Health.Condition == "Burnout"),
    burnout_percent = round((burnout_count / total) * 100, 1)
  ) %>%
  arrange(Age.Group)

print(burnout_by_age)
print(table(df$Age.Group, df$Mental.Health.Condition == "Burnout"))

# Chi-squared test for Question 1
print(chisq.test(table(df$Age.Group, df$Mental.Health.Condition == "Burnout")))

# Question 2.1. Analyze access to mental health resources by region
print(chisq.test(table(df$Region, df$Access.to.Mental.Health.Resources)))

# Question 2.2. Analyze company support for mental health by region
print(chisq.test(table(df$Region, df$Company.Support)))

# Question 2.3. Analyze company support for remote work by region
print(summary(aov(Company.Support.for.Remote.Work ~ Region, data = df)))

# Question 3. Analyze burnout by work location
# Burnout. Remote vs Onsite
print(table(df$Work.Location == "Remote", df$Mental.Health.Condition == "Burnout"))
print(chisq.test(table(df$Work.Location == "Remote", df$Mental.Health.Condition == "Burnout")))
print(table(df$Work.Location == "Onsite", df$Mental.Health.Condition == "Burnout"))
print(chisq.test(table(df$Work.Location == "Onsite", df$Mental.Health.Condition == "Burnout")))

# Social Isolation. Remote vs Onsite
print(t.test(df$Social.Isolation.Rating[df$Work.Location == "Remote"], df$Social.Isolation.Rating[df$Work.Location == "Onsite"]))

# Question 4. Analyze stress levels by HWPW groups
print(table(df$HWPW.Groups, df$Stress.Level))
print(chisq.test(table(df$HWPW.Groups, df$Stress.Level)))

# Question 5. Analyze burnout by HWPW groups
print(table(df$HWPW.Groups, df$Mental.Health.Condition == "Burnout"))
print(chisq.test(table(df$HWPW.Groups, df$Mental.Health.Condition == "Burnout")))

# Question 6. Analyze physical activity by mental health condition
print(table(df$Physical.Activity, df$Mental.Health.Condition %in% c("Depression", "Anxiety")))
print(chisq.test(table(df$Physical.Activity, df$Mental.Health.Condition %in% c("Depression", "Anxiety"))))

# Question 7. Analyze productivity change by work location
print(table(df$Work.Location == "Remote", df$Productivity.Change == "Increase"))
print(chisq.test(table(df$Work.Location == "Remote", df$Productivity.Change == "Increase")))

#Question 8.  Analyze productivity change by company support for remote work
print(table(df$Productivity.Change == "Increase", df$Company.Support.for.Remote.Work))
print(chisq.test(table(df$Productivity.Change == "Increase", df$Company.Support.for.Remote.Work)))

# Question 9. Analyze sleep quality by mental health condition
burnout_model <- glm(I(Mental.Health.Condition == "Burnout") ~ Age.Group + Work.Location + HWPW.Groups + Physical.Activity + Sleep.Quality, data = df, family = binomial)
print(summary(burnout_model))