import pandas as pd
import mysql.connector

# 1. Load CSV file
file_path = r"C:\Users\admin\PyCharmMiscProject\Final_Marks_Dataset.csv"
df = pd.read_csv(file_path)

# 2. Add missing columns
df["Total_Marks"] = (
        df["Internal Test 1 (out of 40)"]
        + df["Internal Test 2 (out of 40)"]
        + df["Assignment Score (out of 10)"]
        + df["Final Exam Marks (out of 100)"]
)
df["Percentage"] = (df["Total_Marks"] / 190) * 100
df["Result"] = df["Percentage"].apply(lambda x: "Pass" if x >= 40 else "Fail")


def get_grade(p):
    if p >= 90:
        return "A+"
    elif p >= 80:
        return "A"
    elif p >= 70:
        return "B"
    elif p >= 60:
        return "C"
    elif p >= 50:
        return "D"
    else:
        return "F"


df["Grade"] = df["Percentage"].apply(get_grade)

# 3. Connect to MySQL
connection = mysql.connector.connect(
    host="localhost",
    user="root",
    password="Buvi@123",
    database="student_mark_data"
)
cursor = connection.cursor()

# 4. Clear table before inserting to avoid duplicates
cursor.execute("TRUNCATE TABLE student_performance")

# 5. Insert data into MySQL
for _, row in df.iterrows():
    # Convert Student_ID like 'S1001' -> 1001
    row["Student_ID"] = int(str(row["Student_ID"]).replace("S", ""))

    cursor.execute("""
                   INSERT INTO student_performance (Student_ID, `Attendance (%)`, `Internal Test 1 (out of 40)`,
                                                    `Internal Test 2 (out of 40)`, `Assignment Score (out of 10)`,
                                                    `Daily Study Hours`, `Final Exam Marks (out of 100)`,
                                                    Total_Marks, Percentage, Result, Grade)
                   VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s)
                   """, (
                       row["Student_ID"], row["Attendance (%)"], row["Internal Test 1 (out of 40)"],
                       row["Internal Test 2 (out of 40)"], row["Assignment Score (out of 10)"],
                       row["Daily Study Hours"], row["Final Exam Marks (out of 100)"],
                       row["Total_Marks"], row["Percentage"], row["Result"], row["Grade"]
                   ))

df.drop_duplicates(subset=["Student_ID"], inplace=True)

# 6. Commit and close connection
connection.commit()
cursor.close()
connection.close()

print("✅ Data inserted successfully!")
