#Find all roles (role_id) that have access on device categories : 'Heating' AND ' Lights'
SELECT DISTINCT mydb.commands.role_id 
FROM mydb.commands JOIN mydb.device ON mydb.commands.device_id = mydb.device.device_id
WHERE mydb.device.device_category='Lights'
AND mydb.commands.role_id IN (
SELECT DISTINCT mydb.commands.role_id 
FROM mydb.commands JOIN mydb.device ON mydb.commands.device_id = mydb.device.device_id
WHERE mydb.device.device_category='Heating' ); 