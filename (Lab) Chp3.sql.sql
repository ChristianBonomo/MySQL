-- Lab #3

-- Question 6
SELECT vendor_name, vendor_contact_last_name, vendor_contact_first_name
FROM vendors
ORDER BY vendor_contact_last_name ASC, vendor_contact_first_name ASC;

-- Question 7
SELECT concat(vendor_contact_last_name, ', ', vendor_contact_first_name) AS full_name FROM vendors
	WHERE vendor_contact_last_name < 'D' OR vendor_contact_last_name LIKE 'E%' 
	ORDER BY vendor_contact_last_name ASC, vendor_contact_first_name ASC;
    
    
-- Question 8
SELECT invoice_due_date AS 'Due Date', invoice_total AS 'Invoice Total', 
	(invoice_total * 0.1) AS '10%', ((invoice_total * 0.1) + invoice_total) AS 'Plus 10%' FROM invoices
    WHERE invoice_total >= 500 AND invoice_total <= 1000
    ORDER BY invoice_due_date DESC;
    
-- Question 9
SELECT invoice_number, invoice_total, (payment_total + credit_total) AS payment_credit_total, 
(invoice_total - (payment_total + credit_total)) AS balance_due FROM invoices
WHERE (invoice_total - (payment_total + credit_total)) > 50
ORDER BY balance_due DESC
LIMIT 5;

-- Question 11
SELECT invoice_number, invoice_date, (invoice_total - (payment_total + credit_total)) AS balance_due,
	payment_date FROM invoices
WHERE payment_date IS NULL;

-- Question 12
SELECT DATE_FORMAT(CURRENT_DATE, '%m/%d/%Y') AS 'current_date';


-- Question 13
SELECT 50,000 AS starting_principal, .65 AS interest,
	(50,000 + (50,000*.65)) AS principal_plus_interest;
	