---Rata-rata jumlah customer aktif bulanan (Monthly Active User) untuk setiap tahun
SELECT 
	tahun, 
	ROUND(AVG(active_users),2) AS avg_active_users
FROM (
	SELECT 
		date_part('year',od.order_purchase_timestamp) AS tahun,
		date_part('month',od.order_purchase_timestamp) AS bulan,
		COUNT(DISTINCT cd.customer_unique_id) AS active_users
	FROM customers_dataset AS cd
	JOIN orders_dataset AS od ON cd.customer_id=od.customer_id
	GROUP BY 1,2) AS sub1
GROUP BY 1;

---Jumlah customer baru pada masing-masing tahun
SELECT 
	date_part('year',first_order) AS tahun,
	count(jumlah_customer_baru) as new_customer
FROM(
	SELECT 
		cd.customer_unique_id,
		MIN(order_purchase_timestamp) AS first_order,
		COUNT(distinct cd.customer_unique_id) AS jumlah_customer_baru
	FROM orders_dataset AS od
	JOIN customers_dataset AS cd ON od.customer_id=cd.customer_id
	GROUP BY 1) AS sub2
GROUP BY 1
ORDER BY 1;

---Jumlah customer yang melakukan repeat order pada masing-masing tahun
SELECT 
	tahun, 
	COUNT(total_customer) AS jumlah_cust_repeat_order
FROM (
	SELECT 
		date_part('year', od.order_purchase_timestamp) AS tahun,
 		cd.customer_unique_id,
 		COUNT(cd.customer_unique_id) AS total_customer,
 		COUNT(od.order_id) AS total_order
	FROM orders_dataset AS od
	JOIN customers_dataset AS cd ON od.customer_id = cd.customer_id
	GROUP BY 1,2
	HAVING COUNT(order_id)>1
	ORDER BY 3) AS sub3
GROUP BY 1
ORDER BY 1;

---Rata-rata jumlah order yang dilakukan customer untuk masing-masing tahun 
SELECT 
	tahun, 
	round(AVG(total_order),2) AS avg_frequency_order
FROM (
	SELECT
		date_part('year', od.order_purchase_timestamp) AS tahun,
 		cd.customer_unique_id,
 		COUNT(cd.customer_unique_id) AS total_order
	FROM orders_dataset AS od
	JOIN customers_dataset AS cd ON od.customer_id = cd.customer_id
	GROUP BY 1,2) AS sub4
GROUP BY 1
ORDER BY 1;

---Menggabungkan ketiga metrik yang telah berhasil ditampilkan menjadi satu tampilan tabel
WITH mau AS (
SELECT 
	tahun, 
	ROUND(AVG(active_users),2) AS avg_active_users
FROM (
	SELECT 
		date_part('year',od.order_purchase_timestamp) AS tahun,
		date_part('month',od.order_purchase_timestamp) AS bulan,
		COUNT(DISTINCT cd.customer_unique_id) AS active_users
	FROM customers_dataset AS cd
	JOIN orders_dataset AS od ON cd.customer_id=od.customer_id
	GROUP BY 1,2) AS sub1
GROUP BY 1),

new_cust AS (
SELECT 
	date_part('year',first_order) AS tahun,
	count(jumlah_customer_baru) as new_customer
FROM(
	SELECT 
		cd.customer_unique_id,
		MIN(order_purchase_timestamp) AS first_order,
		COUNT(distinct cd.customer_unique_id) AS jumlah_customer_baru
	FROM orders_dataset AS od
	JOIN customers_dataset AS cd ON od.customer_id=cd.customer_id
	GROUP BY 1) AS sub2
GROUP BY 1
ORDER BY 1),

repeat_order AS (
SELECT 
	tahun, 
	COUNT(total_customer) AS jumlah_cust_repeat_order
FROM (
	SELECT 
		date_part('year', od.order_purchase_timestamp) AS tahun,
 		cd.customer_unique_id,
 		COUNT(cd.customer_unique_id) AS total_customer,
 		COUNT(od.order_id) AS total_order
	FROM orders_dataset AS od
	JOIN customers_dataset AS cd ON od.customer_id = cd.customer_id
	GROUP BY 1,2
	HAVING COUNT(order_id)>1
	ORDER BY 3) AS sub3
GROUP BY 1
ORDER BY 1),

avg_freq_order AS (
SELECT 
	tahun, 
	round(AVG(total_order),2) AS avg_frequency_order
FROM (
	SELECT
		date_part('year', od.order_purchase_timestamp) AS tahun,
 		cd.customer_unique_id,
 		COUNT(cd.customer_unique_id) AS total_order
	FROM orders_dataset AS od
	JOIN customers_dataset AS cd ON od.customer_id = cd.customer_id
	GROUP BY 1,2) AS sub4
GROUP BY 1
ORDER BY 1)

SELECT 
	m.tahun,
	m.avg_active_users, 
	nc.new_customer, 
	ro.jumlah_cust_repeat_order, 
	avo.avg_frequency_order
FROM mau AS m
JOIN new_cust AS nc ON m.tahun = nc.tahun
JOIN repeat_order AS ro ON m.tahun = ro.tahun
JOIN avg_freq_order AS avo ON m.tahun = avo.tahun