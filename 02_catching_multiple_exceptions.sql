declare
    v_phone_number varchar2(20);
begin
    select phone_number into v_phone_number
    from employees
    where last_name=&lastname;
    
    dbms_output.put_line('Found that employee. Here is the phone number ' || v_phone_number);
exception
    when no_data_found then
        dbms_output.put_line('No employee with the given surname');
    when too_many_rows then
        dbms_output.put_line('There are more than one employee with the given surname');
    when others then
        dbms_output.put_line('Something bad happened. Time to crash.');
end;

-- 1 write this and enter 'Carlsen' _> NO_DATA_FOUND
declare
    v_phone_number varchar2(20);
begin
    select phone_number into v_phone_number
    from employees
    where last_name=&lastname;
    
    dbms_output.put_line('Found that employee. Here is the phone number ' || v_phone_number);
end;

-- 2 write this, enter 'Carlsen' and then enter 'Olsen' _> TOO_MANY_ROWS
declare
    v_phone_number varchar2(20);
begin
    select phone_number into v_phone_number
    from employees
    where last_name=&lastname;
    
    dbms_output.put_line('Found that employee. Here is the phone number ' || v_phone_number);
exception
    when no_data_found then
        dbms_output.put_line('No employee with the given surname');   
end;

-- 3 write this, enter enter 'Olsen', then enter 1 -> OTHERS
declare
    v_phone_number varchar2(20);
begin
    select phone_number into v_phone_number
    from employees
    where last_name=&lastname;
    
    dbms_output.put_line('Found that employee. Here is the phone number ' || v_phone_number);
exception
    when no_data_found then
        dbms_output.put_line('No employee with the given surname');
    when too_many_rows then
        dbms_output.put_line('There are more than one employee with the given surname');
end;

-- 4 write this, enter 1, then enter valid name 'Patel'
declare
    v_phone_number varchar2(20);
begin
    select phone_number into v_phone_number
    from employees
    where last_name=&lastname;
    
    dbms_output.put_line('Found that employee. Here is the phone number ' || v_phone_number);
exception
    when no_data_found then
        dbms_output.put_line('No employee with the given surname');
    when too_many_rows then
        dbms_output.put_line('There are more than one employee with the given surname');
    when others then
        dbms_output.put_line('Something bad happened. Time to crash.');
end;