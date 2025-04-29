#Find the total energy consumed from actuators
SELECT SUM(mydb.actuators.energy_consumed) AS total_energy
FROM mydb.actuators ; 
