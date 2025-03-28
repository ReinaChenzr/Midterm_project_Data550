## **1. Team Designations**

- **Team Lead:** Ruilong Chen
- **Coders:**
    - Lejun Shen
    - Xian Wu
    - Zirui Chen
    - Ziqi Guo
    - Feiran Zhang

---

## **2. Data Set**

- **Selected Dataset:** NBA Player Stats (as of March 7, 2025)
- **Source:** NBA 2025
- **Data File:** `nba_2025-03-07.csv`
- **Data Dictionary:** `nba_codebook.xlsx`

---

## **3. Coding Elements and Responsibilities**

Each coder is responsible for summarizing different aspects of the dataset. Below are the assigned tasks:

1. **Overall Player Rankings & Performance Metrics (Ruilong Chen)**
    - Summarize the top-ranked players based on points per 36 minutes.
    - Compare different positions (e.g., guards vs. forwards vs. centers) based on performance.
2. **Shooting Efficiency Analysis(member 1)**
    - Examine field goal percentage, three-point percentage, and effective field goal percentage.
    - Identify trends in shooting efficiency among different player positions.
3. **Rebounding and Defensive Performance(member 2)**
    - Analyze total rebounds, offensive rebounds, and defensive rebounds.
    - Compare defensive contributions using blocks and steals.
4. **Playmaking & Turnovers(member 3)**
    - Evaluate assists per 36 minutes.
    - Analyze turnover rates and their correlation with assists.
5. **Foul & Free Throw Analysis(member 4)**
    - Assess the free throw percentage and attempts per player.
    - Study the impact of personal fouls on player efficiency.
6. **Comparing Team Contributions(member 5)**
    - Group players by team and analyze each team’s statistical strengths.
    - Identify teams with the highest-scoring or best-defensive players.
7. **Report Compilation & Automation** (Ruilong Chen)
    - Compile all outputs into a final report.
    - Ensure the report is generated automatically with the `make` command.

---

## **4. Project Organizational Structure**

The project will be structured as follows:

```
NBA_Project/
│── data/                    # Raw dataset and dictionary
│   ├── nba_2025-03-07.csv
│   ├── nba_codebook.xlsx
│
│── src/                     # Source code directory
│   ├── overall_performance.R  
│   ├── shooting efficiency.R      
│   ├── rebounding&defence.R    
│   ├── turnovers.R     
│   ├── free_throw.R   
│   ├── Team_contributions.R  
│
│── output/                   # Generated tables and figures
│
│── report/                   # Final report
│   ├── nba_analysis_report.Rmd
│   ├── nba_analysis_report.html
│
│── config.yaml                # Configuration file for customization
│── Makefile                    # Automation script to build the report
│── README.md                   # Project description and instructions

```

---

## **5. Customization Elements**

The project will be parameterized to allow users to customize their reports:

- The project will include a **config file** that allows customization of:
    - Player positions to focus on (e.g., guards, forwards, centers)
    - Time range for filtering player statistics (e.g., different dataset, age range)
    - Specific metrics to highlight in visualizations
- **Implementation:**
    - A `config.yaml` file will store user preferences.
    - R scripts will read parameters from `config.yaml` to adjust analysis dynamically.
    - The report will be regenerated automatically using `make` when parameters are changed.

---

## **6. Group Ground Rules**

To ensure smooth collaboration, our team agrees to the following ground rules:

1. **Respect and Communication:**
    - All team members will respect each other’s ideas and contributions.
    - Weekly check-ins via WeChat to discuss progress and roadblocks.
2. **Code Submission and Review:**
    - All coders will submit their scripts **at least one week before the final deadline**.
    - Pull requests should include meaningful descriptions.
    - Code should be reviewed by at least one other member before merging.
3. **Version Control and Repository Management:**
    - The project will be managed on GitHub.
    - The team lead (Ruilong Chen) will handle merges and resolve conflicts.
    - Each coder will create branches for their tasks and submit pull requests.
4. **Final Report Compilation:**
    - The team lead is responsible for integrating all code outputs into the final report.
    - All members will review the final report before submission.

---
