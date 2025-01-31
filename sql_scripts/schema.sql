-- Table: Membership
CREATE TABLE Membership (
    memID INT PRIMARY KEY,
    cusID INT,
    memType VARCHAR(20),
    memPrice DECIMAL(10, 2),
    memStatus VARCHAR(20)
);

-- Table: Customer
CREATE TABLE Customer (
    cusID INT PRIMARY KEY,
    memID INT,
    cusFirstName VARCHAR(50),
    cusLastName VARCHAR(50),
    cusPhone VARCHAR(20),
    cusEmail VARCHAR(100),
    cusPaymentInfo VARCHAR(100),
    cusWaiver VARCHAR(100),
    FOREIGN KEY (memID) REFERENCES Membership(memID)
);

-- Table: Employee
CREATE TABLE Employee (
    empID INT PRIMARY KEY,
    empFirstName VARCHAR(50),
    empLastName VARCHAR(50),
    empTitle VARCHAR(50),
    empSalary DECIMAL(10, 2),
    empShift VARCHAR(20),
    empStatus VARCHAR(20)
);

-- Table: Has (Assumes a relationship table for Membership start and end dates)
CREATE TABLE Has (
    memID INT,
    memStartDate DATE,
    memEndDate DATE,
    PRIMARY KEY (memID),
    FOREIGN KEY (memID) REFERENCES Membership(memID)
);

-- Table: Section
CREATE TABLE Section (
    secID INT PRIMARY KEY,
    secName VARCHAR(50),
    secEquipType VARCHAR(50),
    secEquipID INT
);

-- Table: Access
CREATE TABLE Access (
    cusID INT,
    secID INT,
    accessDate DATE,
    accessTime TIME,
    PRIMARY KEY (cusID, secID),
    FOREIGN KEY (cusID) REFERENCES Customer(cusID),
    FOREIGN KEY (secID) REFERENCES Section(secID)
);

-- Table: Offers
CREATE TABLE Offers (
    memID INT,
    offerDetails VARCHAR(255),
    PRIMARY KEY (memID),
    FOREIGN KEY (memID) REFERENCES Membership(memID)
);

-- Table: Amenities
CREATE TABLE Amenities (
    ameID INT PRIMARY KEY,
    ameName VARCHAR(100),
    ameService VARCHAR(100),
    ameHours TIME
);

-- Table: Handles (Assumes employees handling customers and memberships)
CREATE TABLE Handles (
    empID INT,
    cusID INT,
    memID INT,
    PRIMARY KEY (empID, cusID, memID),
    FOREIGN KEY (empID) REFERENCES Employee(empID),
    FOREIGN KEY (cusID) REFERENCES Customer(cusID),
    FOREIGN KEY (memID) REFERENCES Membership(memID)
);

-- Table: Supervises (Assumes employee supervises customers)
CREATE TABLE Supervises (
    empID INT,
    cusID INT,
    PRIMARY KEY (empID, cusID),
    FOREIGN KEY (empID) REFERENCES Employee(empID),
    FOREIGN KEY (cusID) REFERENCES Customer(cusID)
);

-- Table: Maintains (Assumes employee maintains amenities)
CREATE TABLE Maintains (
    empID INT,
    ameID INT,
    PRIMARY KEY (empID, ameID),
    FOREIGN KEY (empID) REFERENCES Employee(empID),
    FOREIGN KEY (ameID) REFERENCES Amenities(ameID)
);

-- Table: Manages (Assumes employee manages sections)
CREATE TABLE Manages (
    empID INT,
    secID INT,
    PRIMARY KEY (empID, secID),
    FOREIGN KEY (empID) REFERENCES Employee(empID),
    FOREIGN KEY (secID) REFERENCES Section(secID)
);


