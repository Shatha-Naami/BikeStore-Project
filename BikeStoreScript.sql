-- New script in master.
-- Date: Dec 10, 2022
-- Time: 8:16:31 PM
SELECT
    ords.order_id ,
    CONCAT(cus.first_name, ' ', cus.last_name) AS 'Customers',
    cus.city ,
    cus.state ,
    ords.order_date,
    SUM(oi.quantity) AS 'total_unit',
    SUM(oi.quantity * oi.list_price) AS 'revenue',
    pro.product_name,
    cats.category_name,
    stores.store_name,
    CONCAT(staffs.first_name, ' ', staffs.last_name) AS 'Staffs'


FROM
    BikeStores.sales.orders ords
JOIN BikeStores.sales.customers cus
ON
    ords.customer_id = cus.customer_id
JOIN BikeStores.sales.order_items oi
ON
    ords.order_id = oi.order_id
JOIN BikeStores.production.products pro
ON
     oi.product_id = pro.product_id
JOIN BikeStores.production.categories cats
ON
     pro.category_id = cats.category_id
JOIN BikeStores.sales.stores stores
ON
     ords.store_id = stores.store_id
JOIN BikeStores.sales.staffs staffs 
ON
     staffs.store_id = stores.store_id
GROUP BY
    ords.order_id ,
    CONCAT(cus.first_name, ' ', cus.last_name),
    cus.city ,
    cus.state ,
    ords.order_date,
    pro.product_name,
    cats.category_name,
    stores.store_name,
    CONCAT(staffs.first_name, ' ', staffs.last_name)
    
    
    
    
    