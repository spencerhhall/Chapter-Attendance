# This file will be used to clean the raw .csv file

# Load necessary packages
library("dplyr")

attendance_data <- read.csv("../data/W19 - W19.csv", stringsAsFactors = FALSE)

# Isolates the second to last 3 rows containing the numerical data for each week
attendance_data <- filter(attendance_data, Week.1..1.7. != 'x') %>%
  filter(Last.Name != "Sum Check") %>%
  select(Week.1..1.7.:Week.10..3.11.)

rownames(attendance_data) <- c("Absences", "Excused", "Present")

colnames(attendance_data) <- c("Week 1", "Week 2", "Week 3", "Week 4", "Week 5",
                               "Week 6", "Week 7", "Week 8", "Week 9", "Week 10")

write.csv(attendance_data, "clean_W19.csv", row.names = FALSE)