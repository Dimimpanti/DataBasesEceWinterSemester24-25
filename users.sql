CREATE USER 'admin'@'localhost' IDENTIFIED BY 'adminpassword';
GRANT ALL PRIVILEGES ON mydb.* TO 'admin'@'localhost' ;

CREATE USER 'familyMember'@'localhost' IDENTIFIED BY 'famMembpassword';
CREATE USER 'familyMember'@'%' IDENTIFIED BY 'famMembpassword';
GRANT SELECT, INSERT , UPDATE ON mydb.* TO 'familyMember'@'localhost' ;
GRANT SELECT ON mydb.* TO 'familyMember'@'%' ;

CREATE USER 'child'@'localhost' IDENTIFIED BY 'childpassword';
CREATE USER 'child'@'%' IDENTIFIED BY 'childpassword';
GRANT SELECT ON mydb.* TO 'child'@'localhost' ;
GRANT SELECT ON mydb.* TO 'child'@'%' ;

CREATE USER 'guest'@'localhost' IDENTIFIED BY 'guestpassword';
CREATE USER 'guest'@'%' IDENTIFIED BY 'guestpassword';
GRANT SELECT ON mydb.* TO 'guest'@'localhost' ;
GRANT SELECT ON mydb.* TO 'guest'@'%' ;