CREATE TABLE Case_Status_History (
    id NUMBER GENERATED ALWAYS AS IDENTITY,
    case_number INT,
    old_status VARCHAR2(20),
    new_status VARCHAR2(20),
    changed_on DATE DEFAULT SYSDATE,
    changed_by VARCHAR2(50)
);

CREATE OR REPLACE TRIGGER trg_case_status_change
AFTER UPDATE OF Status ON Cases
FOR EACH ROW
WHEN (OLD.Status IS DISTINCT FROM NEW.Status)
BEGIN
    INSERT INTO Case_Status_History (case_number, old_status, new_status, changed_by)
    VALUES (:OLD.CaseNumber, :OLD.Status, :NEW.Status, USER);
END;
/