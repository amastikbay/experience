# Experience as a data analyst role (in process of update)

## 📌 Overview

This project is a summary of a real-world analytics task done on the job with clients, specifically football clubs such as **Venezia and Palermo**.  

The focus is on **corner kick analysis** using SQL (Redash), Python (Jupyter Notebooks), and BI tool (Tableau).  

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
4. corners_analysis.csv # Full info on corners
5. match_events.csv # events that happened in matches
6. players.csv # players of the league

**notebooks**
1. experience.ipynb # notebook on outputs of the sql queries and visulisations
2. experience_sql.sql # Detailed sql queries to get the necessary data
3. README.md # Project documentation

---

## 🗄 Data Description

### **teams.csv**

![teams table](/Users/amastikbayev/Desktop/temp/experience/images/teams.png)

### **matches.csv**

![matches table](/Users/amastikbayev/Desktop/temp/experience/images/matches.png)

### **players.csv**

![players table](/Users/amastikbayev/Desktop/temp/experience/images/players.png)

### **corners.csv**

![corners table](/Users/amastikbayev/Desktop/temp/experience/images/corners.png)

### **corners_analysis.csv**

![corners_analysis table](/Users/amastikbayev/Desktop/temp/experience/images/corners_analysis.png)

### **match_events.csv**

![match_events table](/Users/amastikbayev/Desktop/temp/experience/images/match_events.png)


---

## 🔍 Step by step

P.S. in general in a work environment, this process involves extracting data from the cloud, querying using SQL, and analyzing in Python or BI tools. In this notebook, the workflow is demonstrated with CSV files for reproducibility: 

1. **Data Loading & Cleaning** – Load CSV files Pandas DataFrames.
2. **Exploratory Data Analysis** – Use SQL & Python to:
   - Calculate the average number of corners per match.
   - Identify peak minutes for corner kicks.
   - Analyze the distribution of corner deliveries by pitch zone.
3. **Visualization**
4. **Business Insights**

---

## 🛠 Tools & Technologies
- **SQL (Redash)** – Querying and aggregating match event data.
- **Python (Pandas, Matplotlib, Seaborn)** – Data wrangling and visualization.
- **Tableau**

---

## 📈 Example Dashboard

*(Tableau/Redash dashboard link will be placed here)*

---

## 📜 License

This project uses **synthetic data** for demonstation purposes. All data is fictional and does not represent actual match statistics.

