select * from jobs;

create or replace procedure insert_job(job_id in varchar2, job_title in varchar2, min_salary in number, max_salary in number)
as
begin
    insert into jobs
    values(job_id, job_title, min_salary, max_salary);
end;

begin
    insert_job('adv_man', 'adveertisement manager', 20000, 10000);
end;

--
select *
from jobs
where job_id = 'adv_man';

declare
    invalid_salary_boundaries exception;
    
    procedure insert_job(job_id in varchar2, job_title in varchar2, min_salary in number, max_salary in number)
    AS
    BEGIN
        if min_salary > max_salary then
            raise invalid_salary_boundaries;
        end if;
        insert into jobs
        values(job_id, job_title, min_salary, max_salary);
    END;
begin
    insert_job('adv_man', 'adveertisement manager', 20000, 10000);
end;

--
create or replace procedure insert_job(job_id in varchar2, job_title in varchar2, min_salary in number, max_salary in number)
as    
begin
    if min_salary > max_salary then
        raise_application_error(-20101, 'Min salary > Max salary');
    end if;
    insert into jobs
    values(job_id, job_title, min_salary, max_salary);
end;

declare
    invalid_salary_boundaries exception;
    PRAGMA EXCEPTION_INIT(invalid_salary_boundaries, -20101);
begin
    insert_job('adv_man', 'adveertisement manager', 20000, 10000);
exception 
    when invalid_salary_boundaries then
        dbms_output.put_line('Change the salaries');
end;