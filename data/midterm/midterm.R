library(dplyr)
library(ggplot2)
library(readr)
setwd("/Users/reina/Desktop/midterm")
nba_data <- read.csv("nba_2025-03-07.csv")
team_stats <- nba_data %>%
  group_by(Team) %>%
  summarise(
    Avg_PTS = mean(PTS, na.rm = TRUE),
    Avg_AST = mean(AST, na.rm = TRUE),
    Avg_REB = mean(TRB, na.rm = TRUE),
    Avg_STL = mean(STL, na.rm = TRUE),
    Avg_BLK = mean(BLK, na.rm = TRUE),
    Avg_TOV = mean(TOV, na.rm = TRUE),
    Avg_PF  = mean(PF, na.rm = TRUE)
  ) %>%
  arrange(desc(Avg_PTS))


ggplot(team_stats, aes(x = reorder(Team, Avg_PTS), y = Avg_PTS)) +
  geom_bar(stat = "identity", fill = "steelblue") +
  coord_flip() +
  labs(title = "Average Points per Team",
       x = "Team", y = "Avg Points") +
  theme_minimal()


top_scoring_teams <- team_stats %>%
  top_n(5, Avg_PTS)

best_defensive_teams <- team_stats %>%
  mutate(DefenseScore = Avg_STL + Avg_BLK) %>%
  arrange(desc(DefenseScore)) %>%
  head(5)

if (!dir.exists("output")) {
  dir.create("output")
}


write.csv(team_stats, "output/team_summary_stats.csv", row.names = FALSE)
write.csv(top_scoring_teams, "output/top_scoring_teams.csv", row.names = FALSE)
write.csv(best_defensive_teams, "output/best_defensive_teams.csv", row.names = FALSE)
