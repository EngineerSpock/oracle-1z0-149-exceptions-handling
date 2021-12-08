declare
    ex1 exception;
    pragma exception_init (ex1, -20001);
    ex2 exception;
    pragma exception_init (ex2, -20002);
    ex3 exception;
    pragma exception_init (ex3, -20003);
    choice number := &input;
begin    
	dbms_output.put_line('Entered outer block');
    begin
        dbms_output.put_line('Entered inner block');
        if choice = 1 then
            raise_application_error(-20001, 'Raising ex1');
        elsif choice = 2 then
            raise_application_error(-20002, 'Raising ex2');
        else
            raise_application_error(-20003, 'Raising ex3');
        end if;
            
        exception
            when ex1 then 
                dbms_output.put_line('Handling ex1');
        dbms_output.put_line('End of inner block');
    end;
    
	dbms_output.put_line('Got back to outer block');
    exception 
        when ex2 then
            dbms_output.put_line('Handling ex2');
    dbms_output.put_line('End of outer block');
end;