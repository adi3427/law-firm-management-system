CREATE TABLE LawFirms (
    LawFirmID INT PRIMARY KEY,
    Name VARCHAR2(255),
    Address VARCHAR2(255),
    ContactDetails VARCHAR2(255),
    Website VARCHAR2(255)
);

CREATE TABLE Lawyers (
    LawyerID INT PRIMARY KEY,
    Name VARCHAR2(255),
    Specialization VARCHAR2(255),
    YearsOfExperience INT,
    ContactInfo VARCHAR2(255),
    LawFirmID INT,
    FOREIGN KEY (LawFirmID) REFERENCES LawFirms(LawFirmID)
);

CREATE TABLE Clients (
    ClientID INT PRIMARY KEY,
    Name VARCHAR2(255),
    Address VARCHAR2(255),
    ContactInfo VARCHAR2(255)
);

CREATE TABLE Cases (
    CaseNumber INT PRIMARY KEY,
    Type VARCHAR2(255),
    FilingDate DATE,
    Status VARCHAR2(50),
    ClientID INT,
    LawyerID INT,
    FOREIGN KEY (ClientID) REFERENCES Clients(ClientID),
    FOREIGN KEY (LawyerID) REFERENCES Lawyers(LawyerID)
);

CREATE TABLE Courts (
    CourtID INT PRIMARY KEY,
    Name VARCHAR2(255),
    Type VARCHAR2(255),
    Location VARCHAR2(255)
);

CREATE TABLE Hearings (
    HearingID INT PRIMARY KEY,
    ScheduledDate DATE,
    Location VARCHAR2(255),
    CaseNumber INT,
    Outcome CLOB,
    FOREIGN KEY (CaseNumber) REFERENCES Cases(CaseNumber)
);

CREATE TABLE Invoices (
    InvoiceID INT PRIMARY KEY,
    CaseNumber INT,
    ClientID INT,
    TotalAmount DECIMAL(10, 2),
    PaymentStatus VARCHAR2(50),
    ServiceBreakdown CLOB,
    DateIssued DATE,
    FOREIGN KEY (CaseNumber) REFERENCES Cases(CaseNumber),
    FOREIGN KEY (ClientID) REFERENCES Clients(ClientID)
);
