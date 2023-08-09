---Membuat tabel yang berisi informasi total revenue per tahun 
CREATE TABLE IF NOT EXISTS revenue_year AS (
SELECT
	date_part('year', od.order_purchase_timestamp) AS year,
	SUM(oid.price + oid.freight_value) AS total_revenue
FROM orders_dataset AS od
JOIN order_items_dataset AS oid ON od.order_id = oid.order_id
WHERE od.order_status = 'delivered'
GROUP BY 1
ORDER BY 1 ASC);

---Membuat tabel yang berisi informasi total cancel order per tahun
CREATE TABLE IF NOT EXISTS cancel_order_year AS (
SELECT
	date_part('year', order_purchase_timestamp) AS year,
	COUNT(order_id) AS total_cancel
FROM orders_dataset
WHERE order_status = 'canceled'
GROUP BY 1);

---Membuat tabel yang berisi nama kategori produk yang memiliki revenue tertinggi untuk masing-masing tahun
CREATE TABLE IF NOT EXISTS top_produk_by_revenue AS (
SELECT
	year,
	product_category_name,
	revenue
FROM (
	SELECT
		date_part('year', od.order_purchase_timestamp) AS year,
	 	pd.product_category_name AS product_category_name,
	 	SUM(oid.price + oid.freight_value) AS revenue,
	 	RANK() OVER(PARTITION BY date_part('year', od.order_purchase_timestamp)
		ORDER BY SUM(oid.price + oid.freight_value) DESC) AS product_rank
	FROM orders_dataset AS od
	JOIN order_items_dataset AS oid ON od.order_id = oid.order_id
	JOIN product_dataset AS pd ON oid.product_id = pd.product_id
	WHERE order_status = 'delivered'
	GROUP BY 1, 2) AS sub3
WHERE product_rank = 1);

---Membuat tabel yang berisi nama kategori produk yang memiliki jumlah cancel order terbanyak untuk masing-masing tahun
CREATE TABLE IF NOT EXISTS top_product_cancel AS (
SELECT
	year,
	product_category_name,
	total_cancel
FROM (
	SELECT
		date_part('year', od.order_purchase_timestamp) AS year,
	 	pd.product_category_name,
	 	COUNT(od.order_id) AS total_cancel,
	 	RANK() OVER(PARTITION BY DATE_PART('year', order_purchase_timestamp)
		ORDER BY COUNT(od.order_id) DESC) AS cancel_rank
	 FROM orders_dataset AS od
	 JOIN order_items_dataset AS oid ON od.order_id = oid.order_id
	 JOIN product_dataset AS pd ON oid.product_id = pd.product_id
	 WHERE order_status = 'canceled'
	 GROUP BY 1, 2) AS sub4
WHERE cancel_rank = 1);

---Menggabungkan informasi-informasi yang telah didapatkan ke dalam satu tabel.
SELECT
	ry.year,
	ry.total_revenue,
	tpr.product_category_name as top_revenue_product,
	tpr.revenue as total_revenue_top_product,
	coy.total_cancel as total_cancel_order,
	tpc.product_category_name as top_canceled_product,
	tpc.total_cancel as total_top_canceled_product
FROM revenue_year AS ry
JOIN cancel_order_year AS coy ON coy.year = ry.year
JOIN top_produk_by_revenue AS tpr ON ry.year = tpr.year
JOIN top_product_cancel AS tpc ON ry.year = tpc.year;