-- =============================================
-- Title: EC_IT143_W5.2_Fitness_AF.sql
-- Author: [ANTHONY FLOMO]
-- Date: 2025-06-04
-- Description: Answer-focused queries for Fitness dataset
-- =============================================
-- Question 1: What are the most popular fitness classes by attendance?
-- Author: ANTHONY FLOMO

SELECT ClassName, COUNT(*) AS TotalAttendees
FROM ClassAttendance
GROUP BY ClassName
ORDER BY TotalAttendees DESC;

-- Question 1: What are the most popular fitness classes by attendance?
-- Author: ANTHONY FLOMO

SELECT ClassName, COUNT(*) AS TotalAttendees
FROM ClassAttendance
GROUP BY ClassName
ORDER BY TotalAttendees DESC;

-- Question 1: What are the most popular fitness classes by attendance?
-- Author: ANTHONY FLOMO

SELECT ClassName, COUNT(*) AS TotalAttendees
FROM ClassAttendance
GROUP BY ClassName
ORDER BY TotalAttendees DESC;

-- Question 1: What are the most popular fitness classes by attendance?
-- Author: ANTHONY FLOMO

SELECT ClassName, COUNT(*) AS TotalAttendees
FROM ClassAttendance
GROUP BY ClassName
ORDER BY TotalAttendees DESC;

-- Question 1: What are the most popular fitness classes by attendance?
-- Author: ANTHONY FLOMO

SELECT ClassName, COUNT(*) AS TotalAttendees
FROM ClassAttendance
GROUP BY ClassName
ORDER BY TotalAttendees DESC;

-- Question 2: How many members have attended more than 10 classes total?
-- Author: OPPONG

SELECT MemberID, COUNT(*) AS AttendanceCount
FROM ClassAttendance
GROUP BY MemberID
HAVING COUNT(*) > 10;

-- Question 2: How many members have attended more than 10 classes total?
-- Author: OPPONG

SELECT MemberID, COUNT(*) AS AttendanceCount
FROM ClassAttendance
GROUP BY MemberID
HAVING COUNT(*) > 10;

-- Question 2: How many members have attended more than 10 classes total?
-- Author: OPPONG

SELECT MemberID, COUNT(*) AS AttendanceCount
FROM ClassAttendance
GROUP BY MemberID
HAVING COUNT(*) > 10;

-- Question 2: How many members have attended more than 10 classes total?
-- Author: OPPONG

SELECT MemberID, COUNT(*) AS AttendanceCount
FROM ClassAttendance
GROUP BY MemberID
HAVING COUNT(*) > 10;

-- =============================================
-- Title: EC_IT143_W5.2_DiabetesSupportDB_AF.sql
-- Author: [ANTHONY FLOMO]
-- Date: 2025-06-04
-- Description: Answer-focused queries for DiabetesSupportDB dataset
-- =============================================

-- Question 1: What is the average blood sugar level for participants over age 50?
-- Author: ANTHONY FLOMO
SELECT AVG(BloodSugarLevel) AS AvgBloodSugar
FROM Participants
WHERE Age > 50;

-- Question 2: How many participants reported exercising regularly?
-- Author: OPPONG
SELECT COUNT(*) AS RegularExercisers
FROM SurveyResponses
WHERE ExerciseFrequency = 'Regular';

-- Question 3: Which cities have the most diabetes support group members?
-- Author: ANTHONY FLOMO
SELECT City, COUNT(*) AS MemberCount
FROM Participants
GROUP BY City
ORDER BY MemberCount DESC;

-- Question 4: What is the average A1C level by gender?
-- Author: ANTHONY FLOMO
SELECT Gender, AVG(A1CLevel) AS AvgA1C
FROM HealthMetrics
GROUP BY Gender;

