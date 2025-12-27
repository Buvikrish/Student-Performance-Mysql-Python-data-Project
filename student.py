import pandas as pd

File_path = r"D:\student\Final_Marks_Data.csv"
df = pd.read_csv(File_path)
print(df.head())
print(df.tail())
print(df.columns)
print(df.describe())
print(df.info())
print(df.shape)
print(df.dtypes)

print(df.isnull().sum())

df["Total_Marks"] = 100

print(df.head())


df["Percentage"] = (df["Final Exam Marks (out of 100)"] / df["Total_Marks"]) * 100
df["Percentage"] = df["Percentage"].round(2)
print(df[["Final Exam Marks (out of 100)", "Total_Marks", "Percentage"]].head())

df["Result"] = df["Percentage"].apply(lambda x: "Pass" if x >= 40 else "Fail")

print(df[["Final Exam Marks (out of 100)", "Percentage", "Result"]].head())

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

print(df[["Final Exam Marks (out of 100)", "Percentage", "Result", "Grade"]].head())

print(df.columns)


df.to_csv("students_marks_data.csv", index=False)
print(" File updated with Total_Marks, Percentage, Pass/Fail, Grade!")

