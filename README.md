# 🎬 Movie Database Project

A structured SQL-based movie database system designed to manage detailed information about various films. This project is ideal for learning database creation, SQL syntax, and understanding how to model real-world data.

## 📁 Project Overview

This project includes:

- SQL script to create a comprehensive `Movies` table
- Sample records for popular movies
- Well-organized schema covering production, ratings, cast, and streaming details

## 🛠️ Technologies Used

- **SQL**
- Compatible with any relational database (e.g., MySQL, PostgreSQL, Oracle)

## 🧱 Table Schema

The `Movies` table contains the following fields:

| Column Name            | Data Type         | Description                                 |
|------------------------|-------------------|---------------------------------------------|
| `movie_id`             | NUMBER (Primary Key) | Unique movie ID (auto-generated)           |
| `movie_name`           | VARCHAR2(50)      | Title of the movie                          |
| `release_date`         | DATE              | Date the movie was released                 |
| `genre`                | VARCHAR2(50)      | Genre (e.g., Action, Drama, Sci-Fi)         |
| `duration`             | NUMBER            | Duration in minutes                         |
| `language`             | VARCHAR2(30)      | Language of the movie                       |
| `rated`                | VARCHAR2(10)      | Rating category (e.g., PG-13, R)            |
| `rating`               | NUMBER            | IMDb-style viewer rating                    |
| `country_of_origin`    | VARCHAR2(30)      | Country where the movie was produced        |
| `director`             | VARCHAR2(30)      | Name of the director                        |
| `star_actor`           | VARCHAR2(30)      | Leading actor/actress                       |
| `box_collection`       | NUMBER            | Total box office earnings                   |
| `budget`               | NUMBER            | Budget used to make the film                |
| `awards`               | VARCHAR2(100)     | Awards won                                  |
| `release_format`       | VARCHAR2(20)      | Format (Theatrical, Streaming, etc.)        |
| `subtitle_availability`| VARCHAR2(10)      | Subtitle availability (`Yes` or `No`)       |
| `streaming_availability`| VARCHAR2(50)     | Platforms where it's available (e.g., Netflix) |

## 📝 Sample Data

Here are some of the movies included in the initial data:

- **Shutter Island**
- **Gladiator**
- **Black Panther**
- **Inglourious Basterds**

Each entry contains comprehensive metadata.

## 🚀 How to Use

1. Clone the repository
2. Open your SQL client (like Oracle SQL Developer or MySQL Workbench)
3. Connect to your local database
4. Run the script `Movie Data base.sql`
5. Use `SELECT * FROM Movies;` to view the data
