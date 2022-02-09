import sqlite3
import pandas as pd

# Connects to an existing database file in the current directory
# If the file does not exist, it creates it in the current directory
db_connect = sqlite3.connect('test.db')

# Instantiate cursor object for executing queries
cursor = db_connect.cursor()

# String variable for passing queries to cursor
query = """
    CREATE TABLE Students( 
    student_id int, 
    student_name varchar(255), 
    student_initial varchar(5), 
    event_name varchar(255) NOT NULL, 
    major_code varchar(3) NOT NULL, 
    PRIMARY KEY (student_id),
    CONSTRAINT FK_eventname FOREIGN KEY (event_name) REFERENCES Events(event_name),     
    CONSTRAINT FK_majorcode FOREIGN KEY (major_code) REFERENCES Majors(major_code), 
    CONSTRAINT CK_studentinitial CHECK (LENGTH(student_initial)>=2) 
    );
    """

# Execute query, the result is stored in cursor
cursor.execute(query)

# Insert row into table
query = """
    INSERT INTO Students 
    VALUES (12346,'Corinne Badeer','CB', 'Biology Job Fair','BIO');
    """
cursor.execute(query)

query = """
    INSERT INTO Students 
    VALUES (12349,'Jess Tatz','JT', 'STEM Expo','MTH');
    """
cursor.execute(query)

query = """
    INSERT INTO Students 
    VALUES (12348,'Benjamin Essenfeld','BE', 'STEM Expo','CHM');
    """
cursor.execute(query)

query = """
    INSERT INTO Students  
    VALUES (123457,'Oliveah Hope','OH','Engineering Seminar','PHY');
    """
cursor.execute(query)

query = """
    INSERT INTO Students 
    VALUES (12345,'Lindsay Cruz','LC', 'Biology Job Fair','BIO');
    """
cursor.execute(query)

# Select data
query = """
    SELECT *
    FROM Students;
    """
cursor.execute(query)


# Extract column names from cursor
column_names = [row[0] for row in cursor.description]

# Fetch data and load into a pandas dataframe
table_data = cursor.fetchall()
df = pd.DataFrame(table_data, columns=column_names)

# Examine dataframe
print(df)
print(df.columns)

# Example to extract a specific column
# print(df['name'])


# Commit any changes to the database
db_connect.commit()

# Close the connection if we are done with it.
# Just be sure any changes have been committed or they will be lost.
db_connect.close()
