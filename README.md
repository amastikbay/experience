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


<img width="430" height="111" alt="Image" src="https://github.com/user-attachments/assets/2e14043e-4f8c-4cfb-8486-0e4820088881" />
<img width="1020" height="112" alt="Image" src="https://github.com/user-attachments/assets/23d09767-b39d-4a08-94d8-3e0cc9665682" />
<img width="782" height="113" alt="Image" src="https://github.com/user-attachments/assets/0768102a-de5d-4a99-bea6-fe24922a0269" />
<img width="442" height="114" alt="Image" src="https://github.com/user-attachments/assets/67d8f5dd-541d-4737-84d3-154a57617b25" />
<img width="285" height="105" alt="Image" src="https://github.com/user-attachments/assets/28fe5075-38ff-4724-838e-3fed95244fe6" />
<img width="351" height="110" alt="Image" src="https://github.com/user-attachments/assets/f1f77d57-487a-4042-85f5-321e32d62951" />


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

