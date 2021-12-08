declare
  v_last_name varchar2(64);
begin
  select last_name into v_last_name 
  from employees 
  where employee_id = 100;
  
  dbms_output.put_line('Found: ' || v_last_name);
end;

--will raise an exception
declare
  v_last_name varchar2(64);
begin
  select last_name into v_last_name 
  from employees 
  where employee_id = 99;
  
  dbms_output.put_line('Found: ' || v_last_name);
end;

