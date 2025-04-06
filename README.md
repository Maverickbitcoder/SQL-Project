# 🎬 Movie Database SQL Project

## 📖 Overview

This project implements a comprehensive **Movie Database System** using SQL. It is designed to store, manage, and analyze movie-related data, including details such as genre, release date, ratings, box office collection, budget, streaming availability, and more.

Ideal for:
- Film rental services
- Streaming platforms
- Data analysts
- Developers and students interested in database design

---

## 🛠️ Technologies Used

- **SQL** – Structured Query Language  
- **Database Engine** – Oracle / MySQL / PostgreSQL  
- **Tools** – Oracle SQL Developer / MySQL Workbench / DBeaver  

---

## 🗃️ Database Schema

### Table: `Movies`

| Column Name              | Data Type     | Description                               |
|--------------------------|---------------|-------------------------------------------|
| `movie_name`             | VARCHAR       | Name of the movie                         |
| `release_date`           | DATE          | Official release date                     |
| `genre`                  | VARCHAR       | Genre of the movie                        |
| `rating`                 | FLOAT         | IMDb/user rating                          |
| `box_collection`         | NUMBER        | Global box office collection (in ₹ Cr)    |
| `budget`                 | NUMBER        | Movie budget (in ₹ Cr)                    |
| `language`               | VARCHAR       | Language of the movie                     |
| `director`               | VARCHAR       | Director's name                           |
| `country_of_origin`      | VARCHAR       | Country where movie was produced          |
| `subtitle_availability`  | VARCHAR(3)    | Subtitle available (Yes/No)               |
| `streaming_availability` | VARCHAR       | Platforms available (e.g., Netflix, Prime)|
| `awards`                 | VARCHAR       | Awards won                                |
| `duration`               | NUMBER        | Duration in minutes                       |
| `star_actor`             | VARCHAR       | Lead actor                                |
| `release_format`         | VARCHAR       | Theater, OTT, DVD, etc.                   |

---

## 💡 Features and Functionalities

- Efficient storage and querying of movie data
- Filtering by genre, director, streaming platform, etc.
- Aggregate functions (SUM, AVG, COUNT) for analysis
- Profit calculation (box collection - budget)
- Advanced queries using window functions (ROW_NUMBER, RANK)
- Support for multi-platform streaming info

---

## 📊 SQL Queries Used

| # | Description | SQL Snippet |
|---|-------------|-------------|
| 1 | Movies with rating > 8 | `SELECT movie_name, rating FROM Movies WHERE rating > 8 ORDER BY rating DESC;` |
| 2 | Movies released in 2020 | `SELECT movie_name, release_date FROM Movies WHERE EXTRACT(YEAR FROM release_date) = 2020;` |
| 3 | Avg. collection (Action) | `SELECT genre, AVG(box_collection) FROM Movies WHERE genre = 'Action' GROUP BY genre;` |
| 4 | Top 5 collections | `SELECT movie_name, box_collection FROM Movies ORDER BY box_collection DESC FETCH FIRST 5 ROWS ONLY;` |
| 5 | Subtitled movies count | `SELECT COUNT(*) FROM Movies WHERE subtitle_availability = 'yes';` |
| 6 | Netflix movies | `SELECT movie_name FROM Movies WHERE streaming_availability LIKE '%Netflix%';` |
| 7 | Profit (collection - budget) | `SELECT movie_name, box_collection - budget AS profit FROM Movies ORDER BY profit DESC;` |
| 8 | Unique genres | `SELECT DISTINCT genre FROM Movies WHERE genre IS NOT NULL;` |
| 9 | Highest rated per genre | Use subqueries or `RANK()`/`ROW_NUMBER()` window functions |
| 10 | Post-2015 releases by earnings | `SELECT movie_name, release_date, box_collection FROM Movies WHERE release_date > TO_DATE('2015-01-01','YYYY-MM-DD') ORDER BY box_collection DESC;` |
| 11 | Top 3 expensive per language | Use `ROW_NUMBER() OVER (PARTITION BY language ORDER BY budget DESC)` |
| 12 | Total collection by director | `SELECT director, SUM(box_collection) FROM Movies GROUP BY director ORDER BY SUM(box_collection) DESC;` |
| 13 | Academy Award winners | `SELECT movie_name FROM Movies WHERE awards LIKE '%Academy%';` |

---

## 🚀 Getting Started

1. Clone the repository:
   ```bash
   git clone https://github.com/your-username/movie-database-sql.git
