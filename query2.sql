#Find all notifications(notification_id,sw_id) sent when pulses are greater than 90 
SELECT mydb.notifies.notification_id , mydb.smartwatch.sw_id
FROM mydb.smartwatch JOIN mydb.notifies ON mydb.smartwatch.sw_id = mydb.notifies.sw_id 
WHERE mydb.smartwatch.pulses >90 ;