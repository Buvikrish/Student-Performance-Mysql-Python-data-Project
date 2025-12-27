# Student-Performance-Mysql-Python-data-Project
Student Performance Data Analysis Project
**Project Overview**

This project analyzes a student performance dataset using Python (Pandas) and MySQL.
It calculates each student’s total marks, percentage, result (Pass/Fail), and grade, then stores the data in a MySQL database for easy access and reporting.

**Technologies Used**

**Python 3 / pycharm**

pandas – for data analysis and manipulation

mysql.connector – for connecting and inserting data into MySQL

**MySQL**

Database: student_mark_data

Table: student_performance

**CSV Dataset**

Final_Marks_Dataset.csv

**Features**

Load student data from CSV file
Clean and process dataset
Calculate:

Total Marks

Percentage

Pass/Fail Result

Grade (A+, A, B, C, D, F)
Insert processed data into MySQL table
Remove duplicate entries before uploading
Display dataset info and summary

**Python Scripts**
student.py

Reads student data using Pandas

**Adds new columns:**

Total_Marks

Percentage

Result

Grade

Exports processed data to a new CSV:

students_marks_data.csv

**studentsql.py**

Reads the processed dataset

Connects to a MySQL database

Inserts data into the student_performance table

Removes duplicates and prevents redundant entries

Truncates table before inserting new data

**Grading Logic**
Percentage Range	Grade
90–100	A+
80–89	A
70–79	B
60–69	C
50–59	D
Below 50	F
**Sample Output**
Student_ID	Final Exam Marks	Total_Marks	Percentage	Result	Grade
S1001	85	178	93.7%	Pass	A+
S1002	45	110	57.9%	Pass	D
S1003	30	78	41.0%	Fail	F
**How to Run**

Install dependencies

pip install pandas mysql-connector-python


Update file paths and MySQL credentials inside both scripts.

**Run the Python scripts**

python student.py
python studentsql.py


**Check the MySQL database**

Database: student_mark_data

Table: student_performance

Future Enhancements

Add department/course-level analysis

Build a Power BI dashboard from MySQL data

Automate grading and report generation

Create a web interface to visualize student performance

**Conclusion**

This project demonstrates how Python and MySQL can work together to automate and analyze student academic data efficiently.
It can be extended for educational institutions to monitor performance trends and improve learning outcomes.
