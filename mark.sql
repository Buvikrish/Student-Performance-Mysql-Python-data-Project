create database student_mark_data
use student_mark_data
CREATE TABLE student_performance (
    Student_ID INT PRIMARY KEY AUTO_INCREMENT,
    `Attendance (%)` DECIMAL(5,2),
    `Internal Test 1 (out of 40)` INT,
    `Internal Test 2 (out of 40)` INT,
    `Assignment Score (out of 10)` INT,
    `Daily Study Hours` DECIMAL(4,2),
    `Final Exam Marks (out of 100)` INT,
    Total_Marks DECIMAL(6,2),
    Percentage DECIMAL(5,2),
    Result VARCHAR(10),
    Grade CHAR(2)
);


ALTER TABLE student_performance 
MODIFY COLUMN Student_ID VARCHAR(10);

DESCRIBE student_performance;

select * from student_performance;
select Result,grade from student_performance

# Check top scorers by total marks
SELECT Student_ID, Total_Marks, Percentage, Grade
FROM student_performance
ORDER BY Total_Marks DESC
LIMIT 10;

# Count of students by result (Pass/Fail)
SELECT Result, COUNT(*) AS Total_Students
FROM student_performance
GROUP BY Result;

# Average marks for each exam
SELECT
    AVG(`Internal Test 1 (out of 40)`) AS Avg_Test1,
    AVG(`Internal Test 2 (out of 40)`) AS Avg_Test2,
    AVG(`Assignment Score (out of 10)`) AS Avg_Assignment,
    AVG(`Final Exam Marks (out of 100)`) AS Avg_Final
FROM student_performance;

# Students with low attendance (<75%)
SELECT Student_ID, `Attendance (%)`
FROM student_performance
WHERE `Attendance (%)` < 75;

# Students with grade A+
SELECT Student_ID, Total_Marks, Percentage
FROM student_performance
WHERE Grade = 'A+';

# Number of students in each grade
SELECT Grade, COUNT(*) AS Total_Students
FROM student_performance
GROUP BY Grade
ORDER BY Grade DESC;

# Average daily study hours by result
SELECT Result, AVG(`Daily Study Hours`) AS Avg_Study_Hours
FROM student_performance
GROUP BY Result;

# Top 5 students with highest percentage
SELECT Student_ID, Percentage, Grade
FROM student_performance
ORDER BY Percentage DESC
LIMIT 5;

# Failing students (Percentage < 40%)
SELECT Student_ID, Total_Marks, Percentage, Result
FROM student_performance
WHERE Percentage < 40;


# View only top 5 scorers
SELECT Student_ID, Total_Marks, Percentage, Grade
FROM student_performance
ORDER BY Total_Marks DESC
LIMIT 5;

# Count students by pass/fail
SELECT Result, COUNT(*) AS Total_Students
FROM student_performance
GROUP BY Result;

# Students with attendance less than 75%
SELECT Student_ID, `Attendance (%)`
FROM student_performance
WHERE `Attendance (%)` < 75;

# Students who scored A+ grade
SELECT Student_ID, Total_Marks, Percentage
FROM student_performance
WHERE Grade = 'A+';


# Average marks per exam
SELECT
    AVG(`Internal Test 1 (out of 40)`) AS Avg_Test1,
    AVG(`Internal Test 2 (out of 40)`) AS Avg_Test2,
    AVG(`Assignment Score (out of 10)`) AS Avg_Assignment,
    AVG(`Final Exam Marks (out of 100)`) AS Avg_Final
FROM student_performance;

# Average daily study hours by result
SELECT Result, AVG(`Daily Study Hours`) AS Avg_Study_Hours
FROM student_performance
GROUP BY Result;

# Count of students in each grade
SELECT Grade, COUNT(*) AS Total_Students
FROM student_performance
GROUP BY Grade
ORDER BY Grade DESC;

# Students who failed any test (score < 40 in any test)
SELECT Student_ID, `Internal Test 1 (out of 40)`, `Internal Test 2 (out of 40)`, `Final Exam Marks (out of 100)`
FROM student_performance
WHERE `Internal Test 1 (out of 40)` < 40
   OR `Internal Test 2 (out of 40)` < 40
   OR `Final Exam Marks (out of 100)` < 40;


# Top 3 students per percentage
SELECT Student_ID, Percentage, Grade
FROM student_performance
ORDER BY Percentage DESC
LIMIT 3;

# Percentage range analysis
SELECT
    CASE
        WHEN Percentage >= 90 THEN '90-100'
        WHEN Percentage >= 80 THEN '80-89'
        WHEN Percentage >= 70 THEN '70-79'
        WHEN Percentage >= 60 THEN '60-69'
        WHEN Percentage >= 50 THEN '50-59'
        ELSE 'Below 50'
    END AS Percentage_Range,
    COUNT(*) AS Total_Students
FROM student_performance
GROUP BY Percentage_Range
ORDER BY Percentage_Range DESC;

# Correlation between Attendance and Percentage (approximation)
SELECT AVG(`Percentage`) AS Avg_Percentage, 
       FLOOR(`Attendance (%)`/10)*10 AS Attendance_Range
FROM student_performance
GROUP BY Attendance_Range
ORDER BY Attendance_Range DESC;

# Students who scored higher than class average
SELECT Student_ID, Total_Marks, Percentage
FROM student_performance
WHERE Total_Marks > (SELECT AVG(Total_Marks) FROM student_performance)
ORDER BY Total_Marks DESC;

# Students sorted by Total_Marks within each Grade
SELECT *
FROM student_performance
ORDER BY Grade DESC, Total_Marks DESC;

