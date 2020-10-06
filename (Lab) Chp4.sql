-- Chapter 4 Lab

/****************************************Question 1********************************************
* Write a SELECT statement that returns all columns from the Vendors table inner-joined with all columns from the Invoices table. 
* This should return 114 rows. 
* Hint: You can use an asterisk (*) to select the columns from both tables.
***********************************************************************************************/
SELECT *
FROM vendors JOIN invoices
	ON vendors.vendor_id = invoices.vendor_id;

/****************************************Question 2********************************************
* Write a SELECT statement that returns these four columns: 
* vendor_name invoice_number invoice_date balance_due 
* The vendor_name column from the Vendors table 
* The invoice_number column from the Invoices table 
* The invoice_date column from the Invoices table
* The invoice_total column minus the payment_total and credit_total columns from the Invoices table 
* Use these aliases for the tables: v for Vendors and i for Invoices. 
* Return one row for each invoice with a non-zero balance. 
* This should return 11 rows. 
* Sort the result set by vendor_name in ascending order. 
***********************************************************************************************/
SELECT vendor_name, invoice_number, invoice_date, (invoice_total - (payment_total + credit_total)) AS balance_due
FROM vendors v INNER JOIN invoices i
	ON v.vendor_id = i.vendor_id
WHERE (invoice_total - (payment_total + credit_total)) > 0
ORDER BY v.vendor_name ASC;

/****************************************Question 3********************************************
* Write a SELECT statement that returns these three columns: 
* vendor_name default_account description 
* The vendor_name column from the Vendors table 
* The default_account_number column from the Vendors table 
* The account_description column from the General_Ledger_Accounts table 
* Return one row for each vendor. 
* This should return 122 rows. 
* Sort the result set by account_description and then by vendor_name.
***********************************************************************************************/
SELECT vendor_name, default_account_number, account_description AS 'description'
FROM vendors v INNER JOIN general_ledger_accounts g
	ON v.default_account_number = g.account_number
ORDER BY account_description, vendor_name;

/****************************************Question 4********************************************
* Write a SELECT statement that returns these five columns: 
* vendor_name invoice_date invoice_number li_sequence li_amount 
* The vendor_name column from the Vendors table 
* The invoice_date column from the Invoices table 
* The invoice_number column from the Invoices table 
* The invoice_sequence column from the Invoice_Line_Items table 
* The line_item_amount column from the Invoice_Line_Items table 
* Use aliases for the tables. 
* This should return 118 rows. 
* Sort the final result set by vendor_name, invoice_date, invoice_number, and invoice_sequence
***********************************************************************************************/
SELECT vendor_name, invoice_date, invoice_number, invoice_sequence AS 'li_sequence', line_item_amount AS 'li_amount'
FROM vendors v
	JOIN invoices i
		ON v.vendor_id = i.vendor_id
	JOIN invoice_line_items li
		ON i.invoice_id = li.invoice_id
ORDER BY vendor_name, invoice_date, invoice_number, invoice_sequence;

/****************************************Question 5********************************************
* Write a SELECT statement that returns three columns: 
* vendor_id vendor_name 
* The vendor_id column from the Vendors table 
* The vendor_name column from the Vendors table 
* contact_name A concatenation of the vendor_contact_first_name and vendor_contact_last_name columns with a space between 
* Return one row for each vendor whose contact has the same last name as another vendor’s contact. 
* This should return 2 rows. 
***********************************************************************************************/
SELECT a.vendor_id, a.vendor_name, CONCAT(a.vendor_contact_first_name, " ", a.vendor_contact_last_name) AS contact_name
FROM vendors a INNER JOIN vendors b
WHERE a.vendor_id <> b.vendor_id 
	AND a.vendor_contact_last_name = b.vendor_contact_last_name
ORDER BY a.vendor_contact_last_name;

/****************************************Question 6********************************************
* Write a SELECT statement that returns these three columns: 
* account_number account_description invoice_id 
* The account_number column from the General_Ledger_Accounts table 
* The account_description column from the General_Ledger_Accounts table 
* The invoice_id column from the Invoice_Line_Items table 
* Return one row for each account number that has never been used. 
* This should return 54 rows.
* Remove the invoice_id column from the SELECT clause
* Sort the final result set by the account_number column.
***********************************************************************************************/
SELECT gla.account_number, account_description
FROM general_ledger_accounts gla LEFT JOIN invoice_line_items li
	ON gla.account_number = li.account_number
WHERE invoice_id IS NULL
ORDER BY account_number;

/****************************************Question 7********************************************
* Use the UNION operator to generate a result set consisting of two columns from the Vendors table: 
* vendor_name and vendor_state. 
* If the vendor is in California, the vendor_state value should be “CA”; otherwise, the vendor_state value should be “Outside CA.” 
* Sort the final result set by vendor_name.
***********************************************************************************************/
SELECT vendor_name, 'CA' AS vendor_state
FROM vendors
WHERE vendor_state = 'CA'
UNION
SELECT vendor_name, 'Outside CA' as vendor_state
FROM vendors
WHERE vendor_state <> 'CA'
ORDER BY vendor_name;






