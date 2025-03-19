-- Test the stored procedure
BEGIN
    sync_employees_to_db2;
END;
/

-- Verify synchronization and logs
SELECT * FROM EMPLOYEES; 
SELECT * FROM EMPLOYEES@db2; 
SELECT * FROM SYNC_LOG; 