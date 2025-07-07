CREATE OR REPLACE TRIGGER trg_generate_invoice
AFTER UPDATE OF Status ON Cases
FOR EACH ROW
WHEN (NEW.Status = 'Closed' AND OLD.Status != 'Closed')
DECLARE
    v_legal_fees NUMBER;
    v_court_fees NUMBER := 500; -- Default court fees
BEGIN
    -- Calculate legal fees based on case type
    SELECT 
        CASE 
            WHEN :NEW.Type = 'criminal' THEN 2000
            WHEN :NEW.Type = 'corporate' THEN 3000
            ELSE 1500
        END
    INTO v_legal_fees FROM dual;
    
    INSERT INTO Invoices (
        CaseNumber, ClientID, TotalAmount, PaymentStatus, 
        ServiceBreakdown, DateIssued
    ) VALUES (
        :NEW.CaseNumber, 
        :NEW.ClientID, 
        v_legal_fees + v_court_fees,
        'Pending',
        'Legal fees: $' || v_legal_fees || ', Court fees: $' || v_court_fees,
        SYSDATE
    );
END;
/