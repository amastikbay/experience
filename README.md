# Experience as a data analyst role (in process of update)

## 📌 Overview

This project is a summary of a real-world analytics task done on the job with clients, specifically football clubs such as **Serie A/B FC**.  

The focus is on **corner kick analysis** using SQL (Redash), Python (Jupyter Notebooks), and BI (Tableau).  

The goal is to provide actionable insights to account manager & staff based on match events data.

---

## 🎯 Objectives

- Store and query football match data using SQL.
- Analyze **corner kick patterns**: timing, location, and outcomes.
- Identify tactical insights to improve set-piece performance.
- Present results in a **business-friendly report** and dashboard.

---

## 📂 Project Structure

football_corner_analysis/

**data**
1. matches.csv # Matches with date, teams, score
2. corners.csv # Corner kick events with coordinates
3. teams.csv # Team list with league info

**sql**
queries.sql # Main SQL queries for analysis

**notebooks**
1. data_exploration.ipynb # Initial data exploration
2. corners_analysis.ipynb # Detailed corner kick analysis
3. reporting.ipynb # Report generation

**reports**
1. corner_insights.pdf # Final business report
2. dashboard.png # Screenshot of Tableau/Redash dashboard

**README.md** # Project documentation

---

## 🗄 Data Description

### **matches.csv**
| Column        | Description                         |
|---------------|-------------------------------------|
| match_id      | Unique match identifier             |
| date          | Date of the match                   |
| home_team     | Home team name                      |
| away_team     | Away team name                      |
| score_home    | Final score of home team            |
| score_away    | Final score of away team            |

### **corners.csv**
| Column        | Description                                     |
|---------------|-------------------------------------------------|
| match_id      | Match reference                                 |
| minute        | Minute of the corner kick                       |
| team          | Team that took the corner                       |
| x_coord       | X coordinate of the ball destination (0–100)    |
| y_coord       | Y coordinate of the ball destination (0–100)    |
| side          | Side of the pitch where the corner was taken    |

### **teams.csv**
| Column        | Description                         |
|---------------|-------------------------------------|
| team_id       | Unique team identifier              |
| team_name     | Name of the football team           |
| league        | League name                         |

---

## 🔍 Step by step

1. **Data Loading & Cleaning** – Load CSV files into SQL database and Pandas DataFrames.
2. **Exploratory Data Analysis** – Use SQL & Python to:
   - Calculate average number of corners per match.
   - Identify peak minutes for corners.
   - Analyze distribution of corner deliveries by pitch zone.
3. **Visualization** – Create:
   - Heatmaps of delivery zones.
   - Time-based distribution charts.
4. **Business Insights** – Examples:
   - Venezia FC had **65%** of corners in the last 10 matches delivered into the near-post zone.
   - Corners from the right side resulted in more shots on goal than left-side deliveries.

---

## 🛠 Tools & Technologies
- **SQL (Redash)** – Querying and aggregating match event data.
- **Python (Pandas, Matplotlib, Seaborn)** – Data wrangling and visualization.
- **Excel** – Quick pivot table analysis for non-technical staff.
- **Tableau / Power BI** – Interactive dashboard for coaches.

---

## 📊 Example Insights
> In matches where Venezia FC had more than **8 corners**, win probability increased by **17%**.  
> Most dangerous deliveries came from the right-side near-post area.

---

## 📈 Example Dashboard

*(Tableau/Redash dashboard link will be placed here)*

---

## 📜 License

This project uses **synthetic data** for demonstation purposes. All data is fictional and does not represent actual match statistics.

