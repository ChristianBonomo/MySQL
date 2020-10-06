-- Chapter 5 Homework

SELECT category_name, category_id FROM categories;
SELECT product_id, category_id, product_code, product_name, 'description', list_price, discount_percent, date_added
FROM products;

/****************************************Question 1********************************************
* Write an INSERT statement that adds this row to the Categories table:
* category_name: Brass
* Code the INSERT statement so MySQL automatically generates the category_id column. 
***********************************************************************************************/
INSERT INTO categories (category_id, category_name) VALUES (default, 'Brass');

/****************************************Question 2********************************************
* Write an UPDATE statement that modifies the row you just added to the Categories table. This
* statement should change the product_name column to “Woodwinds”, and it should use the
* category_id column to identify the row. 
***********************************************************************************************/
UPDATE categories
SET category_name = 'Woodwinds'
WHERE category_id = (SELECT category_id FROM categories WHERE category_name = 'Brass');

/****************************************Question 3********************************************
* Write a DELETE statement that deletes the row you added to the Categories table in exercise 1. 
* This statement should use the category_id column to identify the row. 
***********************************************************************************************/
DELETE FROM categories
WHERE category_id = (SELECT category_id FROM categories WHERE category_name='Woodwinds');

/****************************************Question 4********************************************
* Write an INSERT statement that adds this row to the Products table:
* product_id: The next automatically generated ID
* category_id: 4
* product_code: dgx_640
* product_name: Yamaha DGX 640 88-Key Digital Piano
* description: Long description to come.
* list_price: 799.99
* discount_percent: 0
* date_added: Today’s date/time.
* Use a column list for this statement. 
***********************************************************************************************/
INSERT INTO products (product_id, category_id, product_code, product_name, description, list_price, discount_percent, date_added)
VALUES
	(default, 4, 'dgx_640', 'Yamaha DGX 640 88-Key Digital Piano', 'Long description to come.', '799.99', '0', NOW());
    
/****************************************Question 5********************************************
* Write an UPDATE statement that modifies the product you added in exercise 4. This statement
* should change the discount_percent column from 0% to 35%. 
***********************************************************************************************/
UPDATE products
SET discount_percent = '35%'
WHERE category_id = (SELECT category_id FROM products WHERE category_id = 4);

/****************************************Question 6********************************************
* Write a DELETE statement that deletes the record with category_id = 4 from the Categories table.
* When you execute this statement, it will produce an error since the category has related rows in the
* Products table. To fix that, precede the DELETE statement with another DELETE statement that
* deletes all products in this category. (Remember that to code two or more statements in a script, you
* must end each statement with a semicolon.) 
***********************************************************************************************/
DELETE FROM products
WHERE category_id = 4;
DELETE FROM Categories
WHERE category_id = 4;





