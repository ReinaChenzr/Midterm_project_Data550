# Load necessary libraries
library(dplyr)
library(here)
library(ggplot2)
# Read the data
data <- read.table(here("data", "nba_2025-03-07"), sep = ",", header = TRUE, quote = "\"", fill = TRUE)
# Exclude players with zero minutes played
data <- data %>% filter(MP > 0)


# Select relevant columns and remove missing values
shooting_data <- data %>%
  select(Pos,FG., X3P., eFG.) %>%
  na.omit()

# Convert to numeric
shooting_data$FG. <- as.numeric(shooting_data$FG.)
shooting_data$X3P. <- as.numeric(shooting_data$X3P.)
shooting_data$eFG. <- as.numeric(shooting_data$eFG.)

# Summary statistics by position
summary_stats <- shooting_data %>%
  group_by(Pos) %>%
  summarise(
    FG_Mean = mean(FG., na.rm = TRUE),
    FG_SD = sd(FG., na.rm = TRUE),
    ThreeP_Mean = mean(X3P., na.rm = TRUE),
    ThreeP_SD = sd(X3P., na.rm = TRUE),
    eFG_Mean = mean(eFG., na.rm = TRUE),
    eFG_SD = sd(eFG., na.rm = TRUE),
    Count = n()
  )

#save table
write.csv(summary_stats, "output/shooting efficiency.csv", row.names = FALSE)

# Plot Field Goal Percentage by Position
ggplot(shooting_data, aes(x = Pos, y = FG.)) +
  geom_boxplot() +
  labs(title = "Field Goal Percentage by Position", x = "Position", y = "Field Goal Percentage") +
  theme_minimal()
ggsave("output/field_goal_percentage.png", width = 8, height = 6)

# Plot Three-Point Percentage by Position
ggplot(shooting_data, aes(x = Pos, y = X3P.)) +
  geom_boxplot() +
  labs(title = "Three-Point Percentage by Position", x = "Position", y = "Three-Point Percentage") +
  theme_minimal()
ggsave("output/three_point_percentage.png", width = 8, height = 6)

# Plot Effective Field Goal Percentage by Position
ggplot(shooting_data, aes(x = Pos, y = eFG.)) +
  geom_boxplot() +
  labs(title = "Effective Field Goal Percentage by Position", x = "Position", y = "Effective Field Goal Percentage") +
  theme_minimal()
ggsave("output/effective_field_goal_percentage.png", width = 8, height = 6)