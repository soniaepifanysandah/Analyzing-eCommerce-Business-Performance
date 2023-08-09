---Jumlah penggunaan masing-masing tipe pembayaran secara all time dan diurutkan dari yang terfavorit
SELECT 
	payment_type AS metode_pembayaran, 
	COUNT (order_id) AS jumlah_penggunaan
FROM order_payments_dataset
GROUP BY 1
ORDER BY 2 DESC;

---Jumlah penggunaan masing-masing tipe pembayaran untuk setiap tahun
SELECT
	payment_type AS tipe_pembayaran,
	SUM(CASE WHEN tahun = 2016 THEN payment_type_usage ELSE 0 END) AS "tahun_2016",
	SUM(CASE WHEN tahun = 2017 THEN payment_type_usage ELSE 0 END) AS "tahun_2017",
	SUM(CASE WHEN tahun = 2018 THEN payment_type_usage ELSE 0 END) AS "tahun_2018"
FROM (
	SELECT
	  	date_part('year', order_purchase_timestamp) AS tahun,
	 	payment_type,
	 	COUNT(payment_type) AS payment_type_usage
	FROM orders_dataset AS od
	JOIN order_payments_dataset AS opd ON od.order_id = opd.order_id
	GROUP BY 1, 2) AS sub2
GROUP BY 1
ORDER BY 2 DESC;