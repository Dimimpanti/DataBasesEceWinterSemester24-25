#Find roles (role_id) that control all devices (device_id)
SELECT mydb.commands.role_id
FROM mydb.commands 
GROUP BY mydb.commands.role_id
HAVING COUNT(DISTINCT mydb.commands.device_id) = (SELECT COUNT(mydb.device.device_id) FROM mydb.device);