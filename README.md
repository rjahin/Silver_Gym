# Silver_Gym

#1. Introduction
The Fitness Gym Database (Silver Gym) is a management system that holds customer, section, employee, amenities and membership. This system showcases the relationships amongst these entities to ensure that this is a seamless experience for all. 

#2. Description of the Organization
The Fitness Gym Database (Silver Fitness) holds the information of the employees, customers, amenities, sections and memberships. This gym database includes the amenities offered, memberships types, customer details, and  employee information. 
- Each customer is identified by a unique identification number and associated with a membership plan through membership ID. Customers have personal information such as name(First & Last), phone number, email, payment information, and waiver status. A customer may access multiple sections, and their access times and dates are recorded. 
- Each membership has a unique identification number and is also linked to a customer’s ID. Membership details include membership type, price, status, billing frequency, and the membership duration is tracked. 
- Each employee has a unique identification number, name, shift information, type, and salary. Employees may be categorized as interns, staff, or managers. Employees may supervise customers, handle memberships, or maintain sections and amenities. 
- Customers are allowed access to different gym sections. When a customer accesses any section it records customer ID, section ID, access date and time. 
- A section is an area within the gym, such as a workout area or class section. Each section has a unique identification number, section name, specific equipment ID, and equipment type. 
- The gym offers various deals and promotions to its members. Each offer is associated with a membership through membership ID and includes detailed information about the offer. 
- The gym provides various amenities services like personal trainers, spa service, or equipment rental. Each amenities is defined by amenities ID, amenity name, the type of service provided and the service working hours. Employees are responsible for maintaining these amenities.

#3. ER Diagram

<img width="869" alt="Screenshot 2025-01-30 at 3 25 16 PM" src="https://github.com/user-attachments/assets/8c4adf9a-698e-4548-9e55-4f47ceb9d2e8" />

#4. ER Diagram Uncaptured Constraints
The following is a list of constraints that are not captured by the ER diagram of
- Billing–How a customer is billed based on the information captured in cusPaymentInfo.
- Employee Benefits–Benefits employees receive for working at Silver Fitness.
- Non-Member Customers–Free trials and one-day membership programs exist for customers so people can still use the Silver Fitness facility without being on an official membership plan.
- Fitness Courses–Silver Fitness features group fitness classes for premium members.
- Spa Access–Silver Fitness features spa access for premium members.
- Sauna Access–Sauna access is provided in all Silver Fitness locker room facilities.
- Café Access–Silver fitness features a complimentary café bar for premium members.
- Currency ($)–Currency is based in the United States Dollar (USD). 
- Format for Dates–The format for dates is DD/MM/YYYY.

  
#5. Relational Schema
Employee(empID, empFirstName, empLastName, empTitle, empSalary, empShift, empStatus)

Customer(cusID, memID, cusFirstName, cusLastName, cusPhone, cusEmail, cusPaymentInfo, cusWaiver)
	/nforeign key(memID) references Membership(memID)

Membership(memID cusID, memType, memPrice, memStatus)
 	/nforeign key(cusID) references Customer(cusID)

Has(memStartDate, memEndDate)

Section(secID, secName, secEquipType, secEquipID)

Access(cusID secID, accessDate, accessTime)
	/nforeign key(cusID) references Customer(cusID)
	/nforeign key(secID) references Section(secID)
 
Offers(memID, offerDetails)
	/nforeign key(memID) references Membership(memID)
 
Amenities(ameID, ameName, ameService, ameHours)

Handles(empID cusID memID)
	foreign key(empID) references Employee(empID)
	foreign key(cusID) references Customer(cusID)	 
	foreign key(memID) references Membership(memID)
 
Supervises(empID, cusID)
	foreign key(empID) references Employee(empID)
	foreign key(cusID) references Customer(cusID)
 
Maintains(empID, ameID)
	foreign key(empID) references Employee(empID)
	foreign key(ameID) references Amenities(ameID)
 
Manages(empID, secID)
	foreign key(empID) references Employee(empID)
	foreign key(secID) references Section(secID)



 
