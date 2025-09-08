# CoreDataEngineers ETL Project

## Overview
This project demonstrates the implementation of a basic ETL (Extract, Transform, Load) pipeline using Bash scripts. It also includes automation tasks using `cron` and additional file handling scripts to manage CSV and JSON files.  

All scripts are stored inside the `Scripts` folder, organized into subfolders for Bash and SQL.

---

## Project Structure

---

## Tasks and Solutions

### 1. ETL Pipeline Script
**File:** `Scripts/Bash/ETL_Pipeline.sh`  

This script performs a simple ETL process:

- **Extract:** Copies a CSV file from the Downloads folder into a `raw/` directory.  
- **Transform:**  
  - Modifies the header (`Variable_code` → `variable_code`).  
  - Selects the first four columns.  
  - Saves the transformed file into the `Transformed/` directory.  
- **Load:** Copies the transformed file into the `Gold/` directory.  

**Execution Example:**
```bash
./ETL_Pipeline.sh
```

**Execution Example:**
```bash
directories are created: raw/, Transformed/, Gold/
file has been saved in the raw/
Transformed file has been created in Transformed/
The file was loaded to Gold/
ETL process completed successfully!
```

2. Scheduling the Script with Cron

The ETL pipeline was scheduled to run daily at 12:00 AM using a cron job.

**Cron Command:**
```bash
crontab -e
```

**Add the following line:**
```bash
0 0 * * * /Users/keletsontseno/ETL_Pipeline.sh >> /path/to/etl_log.txt 2>&1
```
    •    0 0 * * * → Runs every day at midnight.
    •    /Users/keletsontseno/ETL_Pipeline.sh → Full path to the script.

### 3. Moving CSV and JSON Files

File: Scripts/Bash/Move_Files.sh

This script moves all .csv and .json files from the current directory into a folder named json_and_CSV.


### 4. SQL Scripts
    •    Create Tables Script: SQL commands to create target tables for storing transformed data.
    •    Insert Data Script: SQL statements to load the transformed CSV data into PostgreSQL.
    •    Query Script: Sample queries for analyzing and validating the loaded data.

