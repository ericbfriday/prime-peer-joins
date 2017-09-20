--Get all customers and their addresses.
SELECT * FROM customers JOIN addresses ON customers.id = addresses.customer_id;

--Get all orders and their line items.
SELECT * FROM orders JOIN line_items ON orders.id = line_items.order_id;

--Which warehouses have cheetos?
SELECT * FROM products
JOIN warehouse_product ON products.id = warehouse_product.product_id
JOIN warehouse ON warehouse_product.warehouse_id = warehouse.id
WHERE description = 'cheetos';

--Which warehouses have diet pepsi?
SELECT * FROM products
JOIN warehouse_product ON products.id = warehouse_product.product_id
JOIN warehouse ON warehouse_product.warehouse_id = warehouse.id
WHERE description = 'diet pepsi';

--Get the number of orders for each customer. NOTE: It is OK if those without orders are not included in results.
SELECT COUNT(*) FROM customers
JOIN addresses ON customers.id = addresses.customer_id
JOIN orders ON addresses.id = orders.address_id
GROUP BY customer_id;

--How many customers do we have?
SELECT COUNT(*) FROM customers;

--How many products do we carry?
SELECT COUNT(*) FROM products;

--What is the total available on-hand quantity of diet pepsi?
SELECT SUM(on_hand) FROM products
JOIN warehouse_product ON products.id = warehouse_product.product_id
WHERE products.description = 'diet pepsi'; 