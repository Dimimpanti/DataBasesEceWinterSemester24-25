#Find the activities that last more than 60 minutes (activities,duration)
SELECT mydb.activities.activities , mydb.does.duration
FROM mydb.does JOIN mydb.activities ON mydb.does.activity_id = mydb.activities.activitiy_id
WHERE mydb.does.duration > 60 ;