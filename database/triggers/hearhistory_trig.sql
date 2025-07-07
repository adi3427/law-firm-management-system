CREATE TABLE Hearing_History (
    id NUMBER GENERATED ALWAYS AS IDENTITY,
    hearing_id INT,
    old_date DATE,
    new_date DATE,
    old_outcome VARCHAR2(100),
    new_outcome VARCHAR2(100),
    changed_on DATE DEFAULT SYSDATE,
    changed_by VARCHAR2(50)
);

CREATE OR REPLACE TRIGGER trg_hearing_change
AFTER UPDATE ON Hearings
FOR EACH ROW
WHEN (
    OLD.ScheduledDate IS DISTINCT FROM NEW.ScheduledDate OR
    OLD.Outcome IS DISTINCT FROM NEW.Outcome
)
BEGIN
    INSERT INTO Hearing_History (
        hearing_id, old_date, new_date,
        old_outcome, new_outcome, changed_by
    ) VALUES (
        :NEW.HearingID,
        :OLD.ScheduledDate,
        :NEW.ScheduledDate,
        :OLD.Outcome,
        :NEW.Outcome,
        USER
    );
END;
/