# Rebounding and Defensive Performance (Member 2)

library(dplyr)
library(here)
library(tidyverse)
library(ggplot2)
library(tidyr)
nba_data <- read.table(here("data", "nba_2025-03-07"), sep = ",", header = TRUE, quote = "\"", fill = TRUE)
#------------------------------------------------------------------------
#TASK1 Analyze total rebounds, offensive rebounds, and defensive rebounds.
#------------------------------------------------------------------------
# 1 Compute summary statistics for rebounds
#  Mean, SD, Min, Max, Median for ORB, DRB, and TRB
rebound_stats <- nba_data %>%
  summarise(
    mean_orb = mean(ORB, na.rm = TRUE),
    sd_orb = sd(ORB, na.rm = TRUE),
    min_orb = min(ORB, na.rm = TRUE),
    max_orb = max(ORB, na.rm = TRUE),
    median_orb = median(ORB, na.rm = TRUE),

    mean_drb = mean(DRB, na.rm = TRUE),
    sd_drb = sd(DRB, na.rm = TRUE),
    min_drb = min(DRB, na.rm = TRUE),
    max_drb = max(DRB, na.rm = TRUE),
    median_drb = median(DRB, na.rm = TRUE),

    mean_trb = mean(TRB, na.rm = TRUE),
    sd_trb = sd(TRB, na.rm = TRUE),
    min_trb = min(TRB, na.rm = TRUE),
    max_trb = max(TRB, na.rm = TRUE),
    median_trb = median(TRB, na.rm = TRUE)
  )

print(rebound_stats)


# 2 Top 10 players by Total Rebounds
top_trb <- nba_data %>%
  arrange(desc(TRB)) %>%
  select(Player, Pos, Team, ORB, DRB, TRB) %>%
  slice(1:10)

cat("\nTop 10 Players by Total Rebounds:\n")
print(top_trb)


# 3 Visualize the distribution of Rebounds by  a boxplot
library(ggplot2)

#TRB
ggplot(nba_data, aes(x = Pos, y = TRB)) +
  geom_boxplot(fill = "skyblue") +
  labs(title = "Total Rebounds by Position", x = "Position", y = "Total Rebounds")

# ORB
ggplot(nba_data, aes(x = Pos, y = ORB)) +
  geom_boxplot(fill = "orange") +
  labs(title = "Offensive Rebounds by Position", x = "Position", y = "Offensive Rebounds")

# DRB
ggplot(nba_data, aes(x = Pos, y = DRB)) +
  geom_boxplot(fill = "lightgreen") +
  labs(title = "Defensive Rebounds by Position", x = "Position", y = "Defensive Rebounds")

# ------------------------------------------------------------
# TASK2 Defensive Performance Analysis: Blocks and Steals 
# --------------------------------------------------------------
# Summary statistics for blocks and steals
defense_summary <- nba_data %>%
  summarise(
    mean_blk = mean(BLK, na.rm = TRUE),
    sd_blk = sd(BLK, na.rm = TRUE),
    mean_stl = mean(STL, na.rm = TRUE),
    sd_stl = sd(STL, na.rm = TRUE)
  )

print(defense_summary)

# Summary position by mean
defense_by_position <- nba_data %>%
  filter(Pos != "") %>%       
  group_by(Pos) %>%
  summarise(
    avg_blk = mean(BLK, na.rm = TRUE),
    avg_stl = mean(STL, na.rm = TRUE),
    .groups = 'drop'
  )
print(defense_by_position)

# Visualize the distribution of Blocks and Steals by position
# Block by Position
ggplot(nba_data, aes(x = Pos, y = BLK)) +
  geom_boxplot(fill = "lightblue") +
  labs(title = "Blocks by Position", x = "Position", y = "Blocks per Game")

# Steal by Position
ggplot(nba_data, aes(x = Pos, y = STL)) +
  geom_boxplot(fill = "lightcoral") +
  labs(title = "Steals by Position", x = "Position", y = "Steals per Game")

