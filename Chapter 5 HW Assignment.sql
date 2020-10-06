-- Chapter 5 Homework

-- SELECT statements to view changes made by scripting further below.
SELECT category_name, category_id FROM categories;
SELECT product_id, category_id, product_code, product_name, 'description', list_price, discount_percent, date_added
FROM products;

-- Question 1 (INSERT statement that adds 'Brass' row to category_name)
INSERT INTO categories (category_id, category_name) VALUES (default, 'Brass');

-- Question 2 (UPDATE statement that modifies the newly added rows name using the category ID)
UPDATE categories
SET category_name = 'Woodwinds'
WHERE category_id = (SELECT category_id FROM categories WHERE category_name = 'Brass');

-- Question 3 (DELETE statement that deletes newly added row using the category ID)
DELETE FROM categories
WHERE category_id = (SELECT category_id FROM categories WHERE category_name='Woodwinds');

-- Question 4 (Write an INSERT statement that adds a row to the Products table)
INSERT INTO products (product_id, category_id, product_code, product_name, description, list_price, discount_percent, date_added)
VALUES
	(default, 4, 'dgx_640', 'Yamaha DGX 640 88-Key Digital Piano', 'Long description to come.', '799.99', '0', NOW());
    
-- Question 5 (Write an UPDATE statement that changes discount_percent column from 0% to 35%
UPDATE products
SET discount_percent = '35%'
WHERE category_id = (SELECT category_id FROM products WHERE category_id = 4);

-- Question 6 (DELETE statement that delets the record with category_id of 4)
DELETE FROM products
WHERE category_id = 4;
DELETE FROM Categories
WHERE category_id = 4;





