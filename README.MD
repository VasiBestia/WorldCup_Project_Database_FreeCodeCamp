# 🏆 World Cup Database

![PostgreSQL](https://img.shields.io/badge/PostgreSQL-316192?style=for-the-badge&logo=postgresql&logoColor=white)
![Bash](https://img.shields.io/badge/Shell_Script-121011?style=for-the-badge&logo=gnu-bash&logoColor=white)
![Linux](https://img.shields.io/badge/Linux-FCC624?style=for-the-badge&logo=linux&logoColor=black)

A relational database project that analyzes FIFA World Cup data. This project involves building a PostgreSQL database from scratch, designing the schema, and automating the data insertion process using a Bash script that parses a CSV file.

## 📋 Project Overview

This project is part of the **freeCodeCamp Relational Database Certification**. The goal was to create a database to store information about World Cup matches, teams, and results, and then query that data to extract meaningful statistics.

### Key Features
* **Relational Database Design:** Two related tables (`teams` and `games`) connected via Foreign Keys.
* **Automated ETL Pipeline:** A Bash script (`insert_data.sh`) that extracts data from a CSV, transforms it (handling existing vs. new records), and loads it into PostgreSQL.
* **Data Integrity:** implementation of `Primary Keys`, `Foreign Keys`, and `UNIQUE` constraints to prevent duplicate entries.
* **Complex Querying:** A reporting script (`queries.sh`) that answers questions like "Total goals scored" or "List of winning teams" using `JOIN`, `GROUP BY`, `ORDER BY`, and `UNION`.

## 🗄️ Database Schema

The database consists of two main tables with a **One-to-Many** relationship pattern.

### 1. `teams` Table
| Column | Type | Constraints | Description |
| :--- | :--- | :--- | :--- |
| `team_id` | SERIAL | PRIMARY KEY | Unique identifier for each team |
| `name` | VARCHAR | UNIQUE, NOT NULL | The name of the country |

### 2. `games` Table
| Column | Type | Constraints | Description |
| :--- | :--- | :--- | :--- |
| `game_id` | SERIAL | PRIMARY KEY | Unique identifier for the match |
| `year` | INT | NOT NULL | Year of the World Cup |
| `round` | VARCHAR | NOT NULL | Stage of the tournament (e.g., Final) |
| `winner_id` | INT | FOREIGN KEY | References `teams(team_id)` |
| `opponent_id` | INT | FOREIGN KEY | References `teams(team_id)` |
| `winner_goals`| INT | NOT NULL | Goals scored by the winner |
| `opponent_goals`| INT | NOT NULL | Goals scored by the opponent |

## 📂 File Structure

* **`games.csv`**: The source dataset containing raw match data.
* **`insert_data.sh`**: Bash script responsible for reading the CSV and inserting data into the database. It handles logic to dynamically look up `team_id` based on team names.
* **`queries.sh`**: Bash script that executes SQL queries against the database to generate reports.
* **`worldcup.sql`**: A dump file of the database structure (optional, if you exported it).

## 🚀 How to Run

1.  **Prerequisites:** Ensure you have PostgreSQL and Bash installed.
2.  **Create the Database:**
    ```sql
    CREATE DATABASE worldcup;
    ```
3.  **Permissions:** Make the scripts executable.
    ```bash
    chmod +x insert_data.sh queries.sh
    ```
4.  **Insert Data:** Run the insertion script.
    ```bash
    ./insert_data.sh
    ```
5.  **Run Queries:** Generate the statistics report.
    ```bash
    ./queries.sh
    ```

## 🧠 What I Learned

* **Bash Scripting:** How to loop through CSV files using `cat` and `read`, and how to interface Bash variables with SQL commands (`psql`).
* **SQL Logic:** Advanced use of `INSERT INTO ... ON CONFLICT DO NOTHING` to handle duplicate data efficiently.
* **Foreign Keys:** Understanding how to link tables and ensure referential integrity (e.g., linking a game's winner to a specific ID in the teams table).
* **Optimization:** Using `UNION` instead of multiple `JOIN` statements to filter distinct lists of teams efficiently.

##[Author] Vasilescu Alexandru Gabriel Fac Automation and Computer Science
---
*This project was built for the freeCodeCamp Relational Database Certification.*
