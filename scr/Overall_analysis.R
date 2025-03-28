# Load required libraries
library(dplyr)
library(ggplot2)
library(here)

# Read the dataset (assuming it's a comma-separated file without an extension)
nba_data <- read.table(here("data", "nba_2025-03-07"), sep = ",", header = TRUE, quote = "\"", fill = TRUE)

# Exclude players with zero minutes played
nba_data <- nba_data %>% filter(MP > 0)

# ======================== Overall Performance (Ruilong Chen) ========================
# Calculate Points Per 36 Minutes (pts is already per 36 minutes)
nba_data <- nba_data %>%
  mutate(PP36 = PTS)

# Top 10 players by PP36
top_players <- nba_data %>%
  arrange(desc(PP36)) %>%
  select(Player, Pos, Team, PP36) %>%
  head(10)

# Print top 10 players based on PP36
print(top_players)

# Average PP36 by position
position_performance <- nba_data %>%
  group_by(Pos) %>%
  summarise(Average_PP36 = mean(PP36, na.rm = TRUE)) %>%
  arrange(desc(Average_PP36))

# Print average PP36 by position
print(position_performance)

# Visualization of PP36 by position
ggplot(position_performance, aes(x = reorder(Pos, -Average_PP36), y = Average_PP36, fill = Pos)) +
  geom_bar(stat = "identity") +
  labs(title = "Average Points Per 36 Minutes by Position", x = "Position", y = "PP36") +
  theme_minimal()

# Save the results
write.csv(top_players, here("output", "top_players.csv"), row.names = FALSE)
write.csv(position_performance, here("output", "position_performance.csv"), row.names = FALSE)

print("Overall player performance analysis completed successfully!")