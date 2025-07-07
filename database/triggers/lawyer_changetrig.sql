CREATE TABLE Lawyer_Firm_History (
    id NUMBER GENERATED ALWAYS AS IDENTITY,
    lawyer_id INT,
    old_firm_id INT,
    new_firm_id INT,
    changed_on DATE DEFAULT SYSDATE,
    changed_by VARCHAR2(50)
);

CREATE OR REPLACE TRIGGER trg_lawyer_firm_change
AFTER UPDATE OF LawFirmID ON Lawyers
FOR EACH ROW
WHEN (OLD.LawFirmID IS DISTINCT FROM NEW.LawFirmID)
BEGIN
    INSERT INTO Lawyer_Firm_History (
        lawyer_id, old_firm_id, new_firm_id, changed_by
    ) VALUES (
        :NEW.LawyerID, :OLD.LawFirmID, :NEW.LawFirmID, USER
    );
END;
/