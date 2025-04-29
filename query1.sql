#Find which smartwatches' battery_level is less than 20% (sw_id , battery_level) 
SELECT mydb.smartwatch.sw_id , mydb.smartwatch.battery_level
FROM mydb.smartwatch
WHERE mydb.smartwatch.battery_level <20 ; 