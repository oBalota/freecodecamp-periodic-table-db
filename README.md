# Periodic Table Database & Script

This repository contains my solution for the **Periodic Table Database** project, which is part of the **Relational Database Certification** on freeCodeCamp.

The project involves fixing an existing PostgreSQL database filled with chemical elements data, creating a clean relational schema, structuring version history with Git, and building a Bash script that queries the database dynamically based on user input.

---

## 🚀 Features

*   **Database Normalization & Cleanup:** 
    *   Renamed columns for consistency (`atomic_mass`, `melting_point_celsius`, `boiling_point_celsius`).
    *   Enforced `NOT NULL` and `UNIQUE` constraints across tables.
    *   Created a new `types` table to normalize data and linked it via Foreign Keys.
    *   Cleaned trailing zeros from decimals in the `atomic_mass` column.
*   **Dynamic Bash Script (`element.sh`):** Accepts an atomic number, symbol, or element name as an argument and outputs a formatted string with its full properties.
*   **Conventional Commits:** Maintained strict adherence to standard commit message prefixes (`feat:`, `fix:`, `refactor:`, `chore:`).

---

## 🛠️ Tech Stack & Concepts

*   **Database:** PostgreSQL (SQL)
*   **Scripting:** Bash / Shell
*   **Version Control:** Git
*   **Concepts:** Data Definition Language (DDL), Foreign Keys, Table Joins, Regular Expressions (`REGEXP_REPLACE`)

---

## 💻 How to Run the Script

Ensure you have PostgreSQL running with the `periodic_table` database imported from the provided `.sql` dump file.

1. Give execution permissions to the script:
   ```bash
   chmod +x element.sh
