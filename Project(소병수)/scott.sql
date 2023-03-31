select 'drop table '||TABLE_NAME||' cascade constraints;' from USER_TABLEs;
select 'drop view '||VIEW_NAME||' cascade constraints;' from USER_VIEWS;
select 'drop sequence '||SEQUENCE_NAME||';' from USER_SEQUENCES;
select 'drop function '||object_NAME||';' from USER_PROCEDURES;
