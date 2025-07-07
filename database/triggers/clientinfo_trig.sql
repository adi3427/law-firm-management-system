CREATE TABLE Client_History (
    id NUMBER GENERATED ALWAYS AS IDENTITY,
    client_id INT,
    field_changed VARCHAR2(50),
    old_value VARCHAR2(200),
    new_value VARCHAR2(200),
    changed_on DATE DEFAULT SYSDATE,
    changed_by VARCHAR2(50)
);

CREATE OR REPLACE TRIGGER trg_client_info_update
AFTER UPDATE ON Clients
FOR EACH ROW
BEGIN
    IF :OLD.Name IS DISTINCT FROM :NEW.Name THEN
        INSERT INTO Client_History (client_id, field_changed, old_value, new_value, changed_by)
        VALUES (:NEW.ClientID, 'Name', :OLD.Name, :NEW.Name, USER);
    END IF;
    
    IF :OLD.Address IS DISTINCT FROM :NEW.Address THEN
        INSERT INTO Client_History (client_id, field_changed, old_value, new_value, changed_by)
        VALUES (:NEW.ClientID, 'Address', :OLD.Address, :NEW.Address, USER);
    END IF;
    
    IF :OLD.ContactInfo IS DISTINCT FROM :NEW.ContactInfo THEN
        INSERT INTO Client_History (client_id, field_changed, old_value, new_value, changed_by)
        VALUES (:NEW.ClientID, 'ContactInfo', :OLD.ContactInfo, :NEW.ContactInfo, USER);
    END IF;
END;
/