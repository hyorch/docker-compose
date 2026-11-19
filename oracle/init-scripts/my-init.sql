/* Oracle. Create a database, create a table and insert some data */

CREATE TABLE test_table (id NUMBER, name VARCHAR2(200));
INSERT INTO test_table VALUES (1, 'test');
INSERT INTO test_table VALUES (2, 'prueba');
INSERT INTO test_table VALUES (3, 'intento');

/* grant privileges to my_user on test_table */
GRANT SELECT, INSERT, UPDATE, DELETE ON test_table TO my_user;

COMMIT;


CREATE TABLE table_money ( id NUMBER GENERATED ALWAYS as IDENTITY(START with 1 INCREMENT by 1), name VARCHAR2(200), amount NUMBER(10, 2) );

GRANT SELECT, INSERT, UPDATE, DELETE ON table_money TO my_user;


INSERT INTO table_money (name, amount) VALUES ('miguel',14);
INSERT INTO table_money (name, amount) VALUES ('pepe',2);
INSERT INTO table_money (name, amount) VALUES ('juan',5);
INSERT INTO table_money (name, amount) VALUES ('paco',-6);
INSERT INTO table_money (name, amount) VALUES ('pepe',2);
INSERT INTO table_money (name, amount) VALUES ('juan',-4);

/* grant privileges to my_user on test_table */


select sum(amount) as total, name from table_money.free group by name;

COMMIT;