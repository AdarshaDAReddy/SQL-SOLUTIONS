--to print output in console
set serveroutput on 

-- to see the conections
show con_name

-- to see the servives
select * from v$services

-- to see the user name 
show user

-- to alter the connection from common database (cdb) to plugable DATABASE (pdb)
alter session set container = 'data base name'

--to create USER
create user 'user name' identified by 'password'

-- to grant access to user
grant all privileges to 'user name'

-- describes USER
decs user_tables
