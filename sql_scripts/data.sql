-- Insert data into Membership table
INSERT INTO Membership (memID, cusID, memType, memPrice, memStatus)
VALUES 
(10011, 1001, 'Gold', 100.00, 'Active'),
(10012, 1002, 'Silver', 75.00, 'Inactive'),
(10013, 1003, 'Platinum', 150.00, 'Active'),
(10014, 1004, 'Bronze', 50.00, 'Active'),
(10015, 1005, 'Silver', 75.00, 'Active'),
(10016, 1006, 'Gold', 100.00, 'Inactive');

-- Insert data into Customer table
INSERT INTO Customer (cusID, memID, cusFirstName, cusLastName, cusPhone, cusEmail, cusPaymentInfo, cusWaiver)
VALUES 
(1001, 10011, 'Samantha', 'Garcia', '312-555-1334', 'samanthagarcia12@yahoo.com', 'Visa ****8004', 'Signed'),
(1002, 10012, 'Sarah', 'Khan', '773-278-5678', 'sarahk866@gmail.com', 'Visa ****6728', 'Signed'),
(1003, 10013, 'Zayn', 'Malik', '312-989-4267', 'zaynmalikk87@gmail.com', 'Visa ****2651', 'Signed'),
(1004, 10014, 'Alice', 'Johnson', '234-567-8901', 'alicej@yahoo.com', 'Visa ****5668', 'Signed'),
(1005, 10015, 'Mike', 'Andrew', '312-678-9012', 'mikeb12@gmail.com', 'Discover ****7580', 'Signed'),
(1006, 10016, 'Sam', 'Matthews', '312-555-1334', 'samanthagarcia12@yahoo.com', 'Visa ****8004', 'Signed');

-- Insert data into Employee table
INSERT INTO Employee (empID, empFirstName, empLastName, empTitle, empSalary, empShift, empStatus)
VALUES 
(2001, 'Ryan', 'Lee', 'Manager', 55000.00, 'All-day', 'Full-Time'),
(2002, 'Tom', 'Wilson', 'Trainer', 32000.00, 'Morning', 'Part-Time'),
(2003, 'Jane', 'Austin', 'Assistant', 27000.00, 'Afternoon', 'Part-Time'),
(2004, 'Chris', 'Evans', 'Receptionist', 29000.00, 'All-day', 'Full-Time'),
(2005, 'David', 'Hwang', 'Trainer', 31000.00, 'Evening', 'Part-Time'),
(2006, 'Emily', 'Johnson', 'Assistant', 53000.00, 'Morning', 'Full-Time'),
(2007, 'Alex', 'Dunphy', 'Trainer', 45000.00, 'All-day', 'Full-Time'),
(2008, 'Jamie', 'Doe', 'Trainer', 48000.00, 'All-day', 'Full-Time');

-- Insert data into Has table
INSERT INTO Has (memID, memStartDate, memEndDate)
VALUES 
(10011, '2018-01-17', '2024-01-01'),
(10012, '2022-05-15', '2023-05-15'),
(10013, '2024-01-01', '2024-12-31'),
(10014, '2024-05-01', '2025-04-30'),
(10015, '2023-03-01', '2024-12-31'),
(10016, '2024-03-01', '2024-09-30');

-- Insert data into Section table
INSERT INTO Section (secID, secName, secEquipType, secEquipID)
VALUES 
(601, 'Cardio', 'Treadmill', 101),
(602, 'Weights', 'Dumbbell', 102),
(603, 'Yoga', 'Yoga Mat', 103),
(604, 'Swimming Pool', 'Lap Pool', 104),
(605, 'Cycling', 'Spin Bike', 105),
(606, 'Boxing', 'Punching Bag', 106);

-- Updated Insertions into Access table based on Membership restrictions
INSERT INTO Access (cusID, secID, accessDate, accessTime)
VALUES 
-- Gold member (1001), does not have access to secID 604
(1001, 601, '2023-10-01', '08:00:00'), -- Cardio
(1001, 602, '2023-10-02', '09:00:00'), -- Weights
(1001, 603, '2023-10-03', '10:00:00'), -- Yoga
(1001, 605, '2023-10-04', '11:00:00'), -- Cycling
(1001, 606, '2023-10-05', '12:00:00'), -- Boxing

-- Silver member (1002), does not have access to secID 604 and 603
(1002, 601, '2024-10-01', '08:00:00'), -- Cardio
(1002, 602, '2024-10-02', '09:00:00'), -- Weights
(1002, 605, '2024-10-05', '8:00:00'), -- Cycling
(1002, 606, '2024-10-06', '13:00:00'), -- Boxing

-- Platinum member (1003), has access to all sections
(1003, 601, '2024-10-01', '08:00:00'), -- Cardio
(1003, 602, '2024-10-02', '09:00:00'), -- Weights
(1003, 603, '2024-10-03', '10:00:00'), -- Yoga
(1003, 604, '2024-10-05', '10:00:00'), -- Swimming Pool
(1003, 605, '2024-10-05', '12:00:00'), -- Cycling
(1003, 606, '2024-10-06', '10:00:00'), -- Boxing

-- Bronze member (1004), does not have access to secID 604, 603, and 605
(1004, 601, '2024-10-01', '08:00:00'), -- Cardio
(1004, 602, '2024-10-02', '09:00:00'), -- Weights
(1004, 606, '2024-10-06', '11:00:00'), -- Boxing

-- Silver member (1005), does not have access to secID 604 and 603
(1005, 601, '2024-09-01', '08:00:00'), -- Cardio
(1005, 602, '2024-09-05', '09:00:00'), -- Weights
(1005, 605, '2024-09-05', '13:00:00'), -- Cycling
(1005, 606, '2024-09-06', '13:00:00'); -- Boxing

-- Insert data into Offers table
INSERT INTO Offers (memID, offerDetails)
VALUES 
(10011, 'Free personal training session for Gold members'),
(10012, '10% discount on merchandise for Silver members'),
(10013, 'Access to VIP lounge for Platinum members'),
(10014, 'Monthly wellness workshops for Bronze members'),
(10015, 'Exclusive spa access for Silver members'),
(10016, 'Gold members get priority booking for classes');

-- Insert data into Amenities table
INSERT INTO Amenities (ameID, ameName, ameService, ameHours)
VALUES 
(701, 'Sauna', 'Relaxation', '10:00:00'),
(702, 'Swimming Pool', 'Recreation', '08:00:00'),
(703, 'Cafe', 'Food & Beverages', '07:00:00'),
(704, 'Spa', 'Therapy', '09:00:00'),
(705, 'Tennis Court', 'Sports', '06:00:00'),
(706, 'Massage Room', 'Relaxation', '11:00:00');

-- Insert data into Handles table
INSERT INTO Handles (empID, cusID, memID)
VALUES 
(2002, 1001, 10011),
(2005, 1002, 10012),
(2008, 1003, 10013),
(2007, 1004, 10014),
(2007, 1005, 10015),
(2005, 1006, 10016);

-- Insert data into Supervises table
INSERT INTO Supervises (empID, cusID)
VALUES 
(2001, 1001),
(2001, 1002),
(2001, 1003),
(2003, 1004),
(2004, 1005),
(2006, 1006);

-- Insert data into Maintains table
INSERT INTO Maintains (empID, ameID)
VALUES 
(2001, 703),
(2008, 702),
(2006, 703),
(2003, 704),
(2001, 705),
(2006, 706);

-- Insert data into Manages table
INSERT INTO Manages (empID, secID)
VALUES 
(2007, 601),
(2007, 602),
(2005, 603),
(2008, 604),
(2002, 605),
(2007, 606);

