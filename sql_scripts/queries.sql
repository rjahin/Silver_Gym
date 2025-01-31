/*List the names, salaries, and job titles of full-time employees, along with the total number of active customers they supervise. Group the results by employee and order by the number of supervised customers in descending order.*/
SELECT e.empFirstName, e.empLastName, e.empSalary, e.empTitle,
    COUNT(s.cusID) AS countOfSupervisedActiveCustomers
FROM Employee e
JOIN Supervises s ON e.empID = s.empID
JOIN Customer c ON s.cusID = c.cusID
JOIN Membership m ON c.memID = m.memID
WHERE e.empType = 'Full-Time' AND m.memStatus = 'Active'
GROUP BY e.empID, e.empFirstName, e.empLastName, e.empSalary, e.empTitle
ORDER BY countOfSupervisedActiveCustomers DESC;

