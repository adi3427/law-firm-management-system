CREATE OR REPLACE TRIGGER trg_lawyer_case_protection
BEFORE UPDATE ON Cases
FOR EACH ROW
DECLARE
    v_current_user VARCHAR2(50) := USER;
    v_is_lawyer_owner NUMBER;
BEGIN
    -- Check if current user is the assigned lawyer
    SELECT COUNT(*) INTO v_is_lawyer_owner 
    FROM Lawyers 
    WHERE LawyerID = :OLD.LawyerID 
    AND Name = v_current_user; -- Assuming Name matches DB username
    
    IF v_is_lawyer_owner = 0 THEN
        RAISE_APPLICATION_ERROR(-20003, 'Unauthorized: You can only update your assigned cases.');
    END IF;
END;
/