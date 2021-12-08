create or replace procedure get_phone_number
   (emp_last_name in varchar2, emp_phone_number out varchar2)
is
begin
    select phone_number into emp_phone_number
    from employees
    where last_name=emp_last_name;
    
    dbms_output.put_line('Found that employee. Here is the phone number ' || emp_phone_number);
exception
    when no_data_found then
        dbms_output.put_line('No employee with the given surname');
        raise;
    when too_many_rows then
        dbms_output.put_line('There are more than one employee with the given surname');
        raise;
    when others then
        dbms_output.put_line('Something bad happened. Time to crash. Code: ' || SQLCODE || ' Message: ' || SQLERRM );
        raise;
end;

declare
    phone varchar2(32);
begin
    get_phone_number('dfg', phone);

    dbms_output.put_line(phone);
exception
    when no_data_found then
        dbms_output.put_line('No employee with the given surname. Please enter another surname or add the first name.');
end;