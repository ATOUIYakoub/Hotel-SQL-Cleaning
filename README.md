# DATACAMP-SQL-ASSOCIATE-CERTIFICATE-PRACTICAL-EXAM

## 🏨 Practical Exam: Hotel Operations
LuxurStay Hotels is an international chain of hotels offering services for both business and leisure travelers. The company prioritizes excellent customer service. However, recent complaints about slow room service have led to a decline in customer satisfaction, dropping below the expected 4.5 rating.

Your task is to analyze the data and identify branches with the worst performance.

---

## 📊 Data Overview
The following schema represents the available tables. The dataset contains only data where customers provided a feedback rating.

| Column Name    | Criteria |
|---------------|------------------------------------------------|
| `id`          | Unique identifier of the hotel. No missing values. |
| `location`    | One of: 'EMEA', 'NA', 'LATAM', 'APAC'. Missing values → "Unknown". |
| `total_rooms` | Integer (1-400). Missing values → Default 100. |
| `staff_count` | Integer. Missing values → `total_rooms * 1.5`. |
| `opening_date`| Year (2000-2023). Missing values → 2023. |
| `target_guests` | 'Leisure' or 'Business'. Missing values → 'Leisure'. |

---

## 🛠️ Tasks and Solutions

### ✅ Task 1: Data Cleaning
- **Fix missing values** using predefined criteria.
- **Convert data types** (e.g., ensure numerical values are correct).
- **Clean categorical and text data** (trim spaces, capitalize names, validate values).

💾 **Solution:** Implemented in [`sql/clean_branch_data.sql`](sql/clean_branch_data.sql)

---

### ✅ Task 2: Response Time Analysis
- Calculate **average** and **maximum** time taken per service and branch.
- Round results to **two decimal places**.

💾 **Solution:** Implemented in [`sql/response_time_analysis.sql`](sql/response_time_analysis.sql)

---

### ✅ Task 3: Targeting Improvements in Meal & Laundry Services
- Filter services in **EMEA and LATAM** regions.
- Retrieve **service description, branch ID, request ID, and rating**.

💾 **Solution:** Implemented in [`sql/targeted_improvements.sql`](sql/targeted_improvements.sql)

---

### ✅ Task 4: Identify Low-Performing Hotels
- Retrieve **services and branches where the average rating < 4.5**.
- Round **average rating to two decimal places**.

💾 **Solution:** Implemented in [`sql/low_performing_hotels.sql`](sql/low_performing_hotels.sql)

---

## 🏗️ Project Setup
### 📥 Prerequisites
- PostgreSQL installed
- Basic knowledge of SQL

### 🚀 How to Run the Queries
1. Clone the repository:
   ```bash
   git clone https://github.com/ATOUIYakoub/Hotel-SQL-Cleaning.git
   cd Hotel-SQL-Cleaning
   ```
2. Import your dataset into PostgreSQL:
   ```sql
   CREATE TABLE branch (
       id SERIAL PRIMARY KEY,
       location TEXT,
       total_rooms INTEGER,
       staff_count INTEGER,
       opening_date TEXT,
       target_guests TEXT
   );

   COPY branch FROM 'data/raw_branch_data.csv' DELIMITER ',' CSV HEADER;
   ```
3. Run the SQL scripts in order:
   ```sql
   \i sql/clean_branch_data.sql
   \i sql/response_time_analysis.sql
   \i sql/targeted_improvements.sql
   \i sql/low_performing_hotels.sql
   ```
4. Export cleaned data (optional):
   ```sql
   COPY branch TO 'data/cleaned_branch_data.csv' DELIMITER ',' CSV HEADER;
   ```

---
