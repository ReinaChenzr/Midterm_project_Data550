# Foul & Free Throw Analysis for NBA Player Stats
# here::i_am("src/free_throw.R")

# Load required libraries
library(tidyverse)
library(here)

# Read the dataset (assuming it's a comma-separated file without an extension)
nba_data <- read.table(here("data", "nba_2025-03-07"), sep = ",", header = TRUE, quote = "\"", fill = TRUE)

# Clean and preprocess data (remove duplicates if any, e.g., players on multiple teams)
nba_data <- nba_data %>% 
  filter(!grepl("TM", Team)) %>%  # Exclude multi-team summary rows
  distinct(Player, .keep_all = TRUE)

# 1. Summarize Free Throw Stats
free_throw_summary <- nba_data %>%
  summarise(
    Avg_FT_Pct = mean(FT., na.rm = TRUE),
    Median_FT_Pct = median(FT., na.rm = TRUE),
    Avg_FT_Attempts = mean(FTA, na.rm = TRUE),
    Avg_Fouls = mean(PF, na.rm = TRUE)
  )

# 2. Top Free Throw Shooters (minimum 1 attempt per 36 minutes)
top_ft_shooters <- nba_data %>%
  filter(FTA >= 1) %>%
  arrange(desc(FT.)) %>%
  select(Player, Pos, Team, FT., FTA) %>%
  head(10)

# 3. Correlation between Fouls and Efficiency
foul_efficiency_cor <- cor(nba_data$PF, nba_data$PTS, use = "complete.obs")
foul_efg_cor <- cor(nba_data$PF, nba_data$eFG., use = "complete.obs")

# 4. Visualization: Fouls vs Points
foul_pts_plot <- ggplot(nba_data, aes(x = PF, y = PTS)) +
  geom_point(alpha = 0.5) +
  geom_smooth(method = "lm", color = "blue") +
  labs(title = "Personal Fouls vs Points Per 36 Minutes",
       x = "Fouls Per 36 Min", y = "Points Per 36 Min") +
  theme_minimal()

# Save outputs
saveRDS(
  free_throw_summary,
  file = here::here("output/free_throw_summary.rds")
)
saveRDS(
  top_ft_shooters,
  file = here::here("output/top_ft_shooters.rds")
)
ggsave(
  here::here("output/foul_pts_plot.png"),
  plot = foul_pts_plot,
  device = "png"
)

# Print results
cat("\nFree Throw Summary:\n")
print(free_throw_summary)

cat("\nTop Free Throw Shooters (min 3 FTA/36min):\n")
print(top_ft_shooters)

cat("\nCorrelations:\n",
    "Fouls vs Points:", round(foul_efficiency_cor, 3), "\n",
    "Fouls vs eFG%:", round(foul_efg_cor, 3), "\n")
