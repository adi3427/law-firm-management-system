-- inserting values into lawfirms
INSERT INTO LawFirms VALUES (1, 'alpha law group', '123 main st, cityville', '123-456-7890', 'www.alphalaw.com');
INSERT INTO LawFirms VALUES (2, 'beta legal solutions', '456 oak rd, townsville', '987-654-3210', 'www.betalaw.com');
INSERT INTO LawFirms VALUES (3, 'gamma legal associates', '789 pine ave, villagetown', '555-123-4567', 'www.gammaassociates.com');
INSERT INTO LawFirms VALUES (4, 'delta &  law firm', '321 elm st, suburbia', '333-444-5555', 'www.deltaco.com');
INSERT INTO LawFirms VALUES (5, 'epsilon legal experts', '654 maple dr, citycentral', '666-777-8888', 'www.epsilonexperts.com');
INSERT INTO LawFirms VALUES (6, 'zeta law services', '987 birch ln, hometown', '222-333-4444', 'www.zetalaw.com');
INSERT INTO LawFirms VALUES (7, 'omega law firm', '246 cedar blvd, metropolis', '888-999-0000', 'www.omega.com');
INSERT INTO LawFirms VALUES (8, 'sigma law group', '135 redwood st, bigcity', '555-555-5555', 'www.sigmalegal.com');
INSERT INTO LawFirms VALUES (9, 'lambda legal consultants', '159 birch st, downtown', '123-123-1234', 'www.lambdalaw.com');
INSERT INTO LawFirms VALUES (10, 'kappa legal partners', '753 oak blvd, uptown', '444-555-6666', 'www.kappalegal.com');
-- inserting values into lawyers

INSERT INTO Lawyers VALUES (1, 'john doe', 'criminal law', 5, 'john.doe@alphalaw.com', 1);
INSERT INTO Lawyers VALUES (2, 'jane smith', 'family law', 8, 'jane.smith@betalaw.com', 2);
INSERT INTO Lawyers VALUES (3, 'mark johnson', 'corporate law', 12, 'mark.johnson@gammaassociates.com', 3);
INSERT INTO Lawyers VALUES (4, 'emily davis', 'intellectual property', 6, 'emily.davis@deltaco.com', 4);
INSERT INTO Lawyers VALUES (5, 'michael brown', 'civil litigation', 10, 'michael.brown@epsilonexperts.com', 5);
INSERT INTO Lawyers VALUES (6, 'sarah wilson', 'real estate law', 3, 'sarah.wilson@zetalaw.com', 6);
INSERT INTO Lawyers VALUES (7, 'david miller', 'contract law', 7, 'david.miller@omega.com', 7);
INSERT INTO Lawyers VALUES (8, 'olivia taylor', 'tax law', 9, 'olivia.taylor@sigmalegal.com', 8);
INSERT INTO Lawyers VALUES (9, 'james anderson', 'personal injury', 11, 'james.anderson@lambdalaw.com', 9);
INSERT INTO Lawyers VALUES (10, 'sophia thomas', 'employment law', 4, 'sophia.thomas@kappalegal.com', 10);

-- inserting values into clients

INSERT INTO Clients VALUES (1, 'alice cooper', '234 oak st, cityville', 'alice.cooper@email.com');
INSERT INTO Clients VALUES (2, 'bob martin', '567 pine rd, townsville', 'bob.martin@email.com');
INSERT INTO Clients VALUES (3, 'charlie king', '890 cedar ave, villagetown', 'charlie.king@email.com');
INSERT INTO Clients VALUES (4, 'diana moore', '123 maple ln, suburbia', 'diana.moore@email.com');
INSERT INTO Clients VALUES (5, 'eve adams', '456 elm dr, citycentral', 'eve.adams@email.com');
INSERT INTO Clients VALUES (6, 'frank young', '789 birch blvd, hometown', 'frank.young@email.com');
INSERT INTO Clients VALUES (7, 'grace lee', '321 redwood st, metropolis', 'grace.lee@email.com');
INSERT INTO Clients VALUES (8, 'henry clark', '654 oak blvd, bigcity', 'henry.clark@email.com');
INSERT INTO Clients VALUES (9, 'ivy scott', '987 pine ln, downtown', 'ivy.scott@email.com');
INSERT INTO Clients VALUES (10, 'jack harris', '321 birch ave, uptown', 'jack.harris@email.com');

-- inserting values into cases

INSERT INTO Cases VALUES (101, 'criminal', to_date('2025-01-10', 'yyyy-mm-dd'), 'open', 1, 1);
INSERT INTO Cases VALUES (102, 'family', to_date('2025-02-14', 'yyyy-mm-dd'), 'closed', 2, 2);
INSERT INTO Cases VALUES (103, 'corporate', to_date('2025-03-01', 'yyyy-mm-dd'), 'open', 3, 3);
INSERT INTO Cases VALUES (104, 'ip', to_date('2025-04-01', 'yyyy-mm-dd'), 'pending', 4, 4);
INSERT INTO Cases VALUES (105, 'civil', to_date('2025-05-15', 'yyyy-mm-dd'), 'open', 5, 5);
INSERT INTO Cases VALUES (106, 'real estate', to_date('2025-06-20', 'yyyy-mm-dd'), 'closed', 6, 6);
INSERT INTO Cases VALUES (107, 'contract', to_date('2025-07-01', 'yyyy-mm-dd'), 'pending', 7, 7);
INSERT INTO Cases VALUES (108, 'tax', to_date('2025-08-10', 'yyyy-mm-dd'), 'open', 8, 8);
INSERT INTO Cases VALUES (109, 'personal injury', to_date('2025-09-10', 'yyyy-mm-dd'), 'closed', 9, 9);
INSERT INTO Cases VALUES (110, 'employment', to_date('2025-10-20', 'yyyy-mm-dd'), 'open', 10, 10);


-- inserting values into courts

INSERT INTO Courts VALUES (1, 'superior court', 'criminal', 'cityville');
INSERT INTO Courts VALUES (2, 'family court', 'family', 'townsville');
INSERT INTO Courts VALUES (3, 'corporate court', 'corporate', 'villagetown');
INSERT INTO Courts VALUES (4, 'intellectual property court', 'ip', 'suburbia');
INSERT INTO Courts VALUES (5, 'civil court', 'civil', 'citycentral');
INSERT INTO Courts VALUES (6, 'real estate court', 'real estate', 'hometown');
INSERT INTO Courts VALUES (7, 'contract court', 'contract', 'metropolis');
INSERT INTO Courts VALUES (8, 'tax court', 'tax', 'bigcity');
INSERT INTO Courts VALUES (9, 'personal injury court', 'personal injury', 'downtown');
INSERT INTO Courts VALUES (10, 'employment court', 'employment', 'uptown');


-- inserting values into hearings with only date

INSERT INTO Hearings VALUES (1, to_date('2025-06-15', 'yyyy-mm-dd'), 'cityville', 101, 'pending');
INSERT INTO Hearings VALUES (2, to_date('2025-07-01', 'yyyy-mm-dd'), 'townsville', 102, 'completed');
INSERT INTO Hearings VALUES (3, to_date('2025-08-05', 'yyyy-mm-dd'), 'villagetown', 103, 'pending');
INSERT INTO Hearings VALUES (4, to_date('2025-09-10', 'yyyy-mm-dd'), 'suburbia', 104, 'pending');
INSERT INTO Hearings VALUES (5, to_date('2025-10-15', 'yyyy-mm-dd'), 'citycentral', 105, 'completed');
INSERT INTO Hearings VALUES (6, to_date('2025-11-20', 'yyyy-mm-dd'), 'hometown', 106, 'completed');
INSERT INTO Hearings VALUES (7, to_date('2025-12-01', 'yyyy-mm-dd'), 'metropolis', 107, 'pending');
INSERT INTO Hearings VALUES (8, to_date('2025-12-15', 'yyyy-mm-dd'), 'bigcity', 108, 'pending');
INSERT INTO Hearings VALUES (9, to_date('2025-12-25', 'yyyy-mm-dd'), 'downtown', 109, 'completed');
INSERT INTO Hearings VALUES (10, to_date('2025-12-30', 'yyyy-mm-dd'), 'uptown', 110, 'pending');

-- inserting values into invoices

INSERT INTO Invoices VALUES (1, 101, 1, 1500.00, 'pending', 'consultation, court appearance', to_date('2025-01-15', 'yyyy-mm-dd'));
INSERT INTO Invoices VALUES (2, 102, 2, 2000.00, 'paid', 'legal fees, filing fees', to_date('2025-02-18', 'yyyy-mm-dd'));
INSERT INTO Invoices VALUES (3, 103, 3, 2500.00, 'pending', 'consultation, legal research', to_date('2025-03-05', 'yyyy-mm-dd'));
INSERT INTO Invoices VALUES (4, 104, 4, 1200.00, 'paid', 'consultation', to_date('2025-04-05', 'yyyy-mm-dd'));
INSERT INTO Invoices VALUES (5, 105, 5, 3000.00, 'pending', 'court representation, filing', to_date('2025-05-18', 'yyyy-mm-dd'));
INSERT INTO Invoices VALUES (6, 106, 6, 1800.00, 'paid', 'real estate legal services', to_date('2025-06-25', 'yyyy-mm-dd'));
INSERT INTO Invoices VALUES (7, 107, 7, 2200.00, 'pending', 'legal research, contract drafting', to_date('2025-07-15', 'yyyy-mm-dd'));
INSERT INTO Invoices VALUES (8, 108, 8, 1400.00, 'paid', 'tax consultation, filing', to_date('2025-08-20', 'yyyy-mm-dd'));
INSERT INTO Invoices VALUES (9, 109, 9, 2500.00, 'pending', 'personal injury consultation, legal fees', to_date('2025-09-15', 'yyyy-mm-dd'));
INSERT INTO Invoices VALUES (10, 110, 10, 1300.00, 'paid', 'employment consultation, court fees', to_date('2025-10-25', 'yyyy-mm-dd'));
