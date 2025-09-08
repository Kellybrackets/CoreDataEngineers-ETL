#!/bin/bash
#---------------------------------
# ETL Pipeline Script - CoreDataEngineers
# Author: Keletso Ntseno
# Date: 2025-09-05
#
# Description:
#   This script performs a simple ETL pipeline:
#   1. Extract - Copy CSV from Downloads into raw/
#   2. Transform - Clean and select needed columns
#   3. Load - Save final version into gold/

#---------------
# SetUp Environment

# Location of the CSV file
CSV_FILE="/Users/keletsontseno/Downloads/annual-enterprise-survey-2023-financial-year-provisional.csv"

#define folders
RAW_DIRECTORY="raw"
TRANSFORMED_DIRECTORY="Transformed"
GOLD_DIRECTORY="Gold"

#Creating the directories
mkdir -p "$RAW_DIRECTORY" "$TRANSFORMED_DIRECTORY" "$GOLD_DIRECTORY"

echo "directories are created: raw/, Transformed/ Gold/"

#------------
#Extracting
if [ -f "$CSV_FILE" ]; then
  cp "$CSV_FILE" "$RAW_DIRECTORY/csv_data.csv"
  echo "file has been saved in the $RAW_DIRECTORY/"
else
  echo "the file is not in the downloads"
  exit 1
fi

#----------
#Transforming
#"|" the pipe sends the header line to sed, then sed substitutes Variable_code with variable_code
# > pipes or redirects the output to a new file
head -n 1 "$RAW_DIRECTORY/csv_data.csv" | sed 's/Variable_code/variable_code/' > "$TRANSFORMED_DIRECTORY/2023_year_finance.csv"

#awk -F, tells awk that the file is Comma-seperated
#NR>1 skips the first row then prints only the first 4 colums with "{print $1 "," $2 "," $3 "," $4}"
#>> This adds/appends all the filtered rows right below the header we wrote earlier.
awk -F, 'NR>1 {print $1 "," $2 "," $3 "," $4}' "$RAW_DIRECTORY/csv_data.csv" >> "$TRANSFORMED_DIRECTORY/2023_year_finance.csv"

#confirm the transformation
if [ -f "$TRANSFORMED_DIRECTORY/2023_year_finance.csv" ]; then
   echo "Transformed file has been created in $TRANSFORMED_DIRECTORY/"
else
   echo "Transformation failed."
   exit 1
fi

#----------
#Load

cp "$TRANSFORMED_DIRECTORY/2023_year_finance.csv" "$GOLD_DIRECTORY/"
  
#Confirming if the tranformed file was copied

if [ -f "$GOLD_DIRECTORY/2023_year_finance.csv" ]; then
   echo "The file was loaded to $GOLD_DIRECTORY/"
else
   echo "Load failed"
   exit 1
fi

echo "ETL process completed successfully!"
