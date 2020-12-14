create database xyz;
create user 'abc'@'%' identified by 'abc';
grant
SELECT, INSERT, UPDATE,
DELETE, CREATE, DROP,
    REFERENCES, INDEX,
ALTER,
CREATE TEMPORARY TABLES,
LOCK TABLES, EXECUTE,
CREATE VIEW, SHOW VIEW,
CREATE ROUTINE, ALTER ROUTINE,
EVENT, TRIGGER
on xyz.* to 'abc'@'%' with grant option;
flush privileges ;
