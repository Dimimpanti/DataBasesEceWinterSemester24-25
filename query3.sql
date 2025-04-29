#Find all roles (role_id) with permissions : 'controlLights' or 'controlHeating'
SELECT mydb.haspermission.role_id 
FROM mydb.haspermission JOIN mydb.permission ON mydb.haspermission.permission_id = mydb.permission.permission_id
WHERE mydb.permission.permission_name = 'controlLights'
UNION
SELECT mydb.haspermission.role_id 
FROM mydb.haspermission JOIN mydb.permission ON mydb.haspermission.permission_id = mydb.permission.permission_id
WHERE mydb.permission.permission_name = 'controlHeating' ;