create or replace procedure create_table(table_name in varchar2)
is   
begin
    execute immediate 'create table ' || table_name || ' (n number)';
end;

create or replace procedure create_table1(table_name in varchar2)
is
    table_exists exception;
    pragma exception_init(table_exists, -955);
begin
    execute immediate 'create table ' || table_name || ' (n number)';
exception
    when table_exists then
        dbms_output.put_line('Table name is already in use.');
    when others then
        dbms_output.put_line('Unknown exception. Code: ' || SQLCODE || ' Message: ' || SQLERRM );
        raise;
end;

create or replace procedure create_table2(table_name in varchar2)
is
begin
    execute immediate 'create table ' || table_name || ' (n number)';
exception
    when others then
        if sqlcode = -955 then
            dbms_output.put_line('Table name is already in use.');
        else
            raise;
        end if;        
end;

begin
    create_table1('invalid_name');
end;

begin
    create_table1('employees');
end;