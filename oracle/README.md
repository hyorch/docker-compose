# Oracle

Oracle Free Docker Setup

https://www.atlassian.com/data/admin/how-to-create-a-user-and-grant-permissions-in-oracle

```sql
SELECT NAME FROM v$database;
SELECT owner, table_name FROM dba_tables;
SELECT * FROM user_tables;
SELECT table_name, tablespace_name FROM user_tables;
select * from dba_users;
select username from dba_users;

show con_name;
ALTER SESSION SET CONTAINER=FREEPDB1;
show conn nets;
SELECT NAME FROM v$database;
```


Conexión con usuario
```sql
sqlplus my_user@FREEPDB1
create table....
SELECT table_name, tablespace_name FROM user_tables;
```

