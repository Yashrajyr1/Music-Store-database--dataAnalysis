# 🎵 Music Store Database Analysis using SQL
⬇️⬇️
This project showcases SQL-based data analysis on a fictional Music Store database. 
The goal is to extract meaningful business insights from relational data involving music tracks, genres, customers, invoices, employees, and sales data.

---

## 🧠 Objectives
- Analyze music sales by genre, track, artist, and album
- Identify top customers and their buying patterns
- Evaluate employee sales performance
- Understand geographical trends in music sales
- Use SQL to write complex analytical queries

---

## 🗃️ Dataset Overview
This project uses a normalized SQLite/PostgreSQL music store database with the following tables:
- **Customers** – ID, Name, Country, City, Email
- **Invoices** – Invoice ID, Date, Billing Country, Total
- **Invoice_Items** – Invoice Line ID, Invoice ID, Track ID, Unit Price, Quantity
- **Tracks** – Track ID, Name, Album ID, Genre ID, Media Type ID, Composer, Duration
- **Albums** – Album ID, Title, Artist ID
- **Artists** – Artist ID, Name
- **Genres** – Genre ID, Name
- **Employees** – Employee ID, Title, Reports To
- **Media_Types** – Media Type ID, Name

---

## 🛠️ Tools Used
- SQL (PostgreSQL / SQLite)
- DB Browser for SQLite or pgAdmin
- (optional visualizations)

---

## 📊 Key Analyses Performed
- 🔝 Top 10 selling tracks by revenue
- 🎸 Most popular genres by total sales and quantity
- 🧍 Highest spending customers with contact details
- 🌍 Country-wise revenue and top cities
- 👨‍💼 Sales comparison between employees
- 📀 Most revenue-generating artists and albums
- 📈 Monthly sales trends using date functions

---

## 🔮 Possible Extensions
- Recommend genres/artists to customers based on history
- Customer churn prediction using spending drop-offs
- Monthly sales forecasting using SQL + Python

## 👨‍💻 Author
**Yashraj Singh**
- 📧 [yashrajsingh2288@gmail.com]
- 🔗 GitHub **|** [https://github.com/Yashrajyr1]
- 🔗 LinkedIn **|** [https://www.linkedin.com/in/yashrajsingh-/]


