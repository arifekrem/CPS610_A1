-- Attempt to automate synchronization (failed due to privileges)
GRANT CREATE JOB TO studentid;
GRANT MANAGE SCHEDULER TO studentid;

BEGIN
    DBMS_SCHEDULER.create_job (
        job_name        => 'SYNC_EMPLOYEES_JOB',
        job_type        => 'PLSQL_BLOCK',
        job_action      => 'BEGIN sync_employees_to_db2; END;',
        start_date      => SYSTIMESTAMP,
        repeat_interval => 'FREQ=MINUTELY; INTERVAL=5',
        enabled         => TRUE,
        comments        => 'Job to synchronize EMPLOYEES table every 5 minutes.'
    );
END;
/

-- Error messages encountered
/*
ORA-01031: insufficient privileges (for GRANT)
ORA-27486: insufficient privileges (for DBMS_SCHEDULER)
*/