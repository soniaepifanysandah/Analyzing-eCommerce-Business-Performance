-- Membuat Tabel

CREATE TABLE customers_dataset (
	customer_id varchar,
	customer_unique_id varchar,
	customer_zip_code_prefix varchar,
	customer_city varchar,
	customer_state varchar
);
	
CREATE TABLE geolocation_dataset (
	geolocation_zip_code_prefix varchar,
	geolocation_lat varchar,
	geolocation_lng varchar,
	geolocation_city varchar,
	geolocation_state varchar
);

CREATE TABLE order_items_dataset (
	order_id varchar,
	order_item_id varchar,
	product_id varchar,
	seller_id varchar,
	shipping_limit_date timestamp without time zone,
	price numeric,
	freight_value numeric
);

CREATE TABLE order_payments_dataset (
	order_id varchar,
	payment_sequential int,
	payment_type varchar,
	payment_installments smallint,
	payment_value numeric
);

CREATE TABLE order_reviews_dataset (
	review_id varchar,
	order_id varchar,
	review_score smallint,
	review_comment_title varchar,
	review_comment_messages text,
	review_creation_date timestamp without time zone,
	review_answer_timestamp timestamp without time zone
);

CREATE TABLE orders_dataset (
	order_id varchar,
	customer_id varchar,
	order_status varchar,
	order_purchase_timestamp timestamp without time zone,
	order_approved_at timestamp without time zone,
	order_delivered_carrier_date timestamp without time zone,
	order_delivered_customer_date timestamp without time zone,
	order_estimated_delivery_date timestamp without time zone
);

CREATE TABLE product_dataset (
	index integer,
	product_id varchar,
	product_category_name varchar,
	product_name_length numeric,
	product_description_length numeric,
	product_photos_qty numeric,
	product_weight_g numeric,
	product_length_cm numeric,
	product_height_cm numeric,
	product_width_cm numeric
);

CREATE TABLE sellers_dataset (
	seller_id varchar,
	seller_zip_code_prefix varchar,
	seller_city varchar,
	seller_state varchar
);


--- Primary Key
ALTER TABLE customers_dataset ADD CONSTRAINT pk_customers_dataset PRIMARY KEY(customer_id);
ALTER TABLE sellers_dataset ADD CONSTRAINT pk_sellers_dataset PRIMARY KEY(seller_id);
ALTER TABLE product_dataset ADD CONSTRAINT pk_product_dataset PRIMARY KEY(product_id);
ALTER TABLE orders_dataset ADD CONSTRAINT pk_orders_dataset PRIMARY KEY(order_id);

-- FOREIGN KEY
ALTER TABLE orders_dataset ADD FOREIGN KEY (customer_id) REFERENCES customers_dataset;
ALTER TABLE order_payments_dataset ADD FOREIGN KEY (order_id) REFERENCES orders_dataset;
ALTER TABLE order_reviews_dataset ADD FOREIGN KEY (order_id) REFERENCES orders_dataset;
ALTER TABLE order_items_dataset ADD FOREIGN KEY (order_id) REFERENCES orders_dataset;
ALTER TABLE order_items_dataset ADD FOREIGN KEY (product_id) REFERENCES product_dataset;
ALTER TABLE order_items_dataset ADD FOREIGN KEY (seller_id) REFERENCES sellers_dataset;
