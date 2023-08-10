# Analyzing-eCommerce-Business-Performance-with-SQL

**Tool :** PostgreSQL <br>
**Programming Language :** SQL <br>
**Visualization Tool :** Excel <br>

## Introduction
Pada project ini, sebagai anggota tim Data Analytics di sebuah perusahaan eCommerce akan melakukan analisis terhadap aspek yang berkaitan dengan performa bisnis perusahaan. Mengukur performa bisnis sangatlah penting untuk melacak, memantau, dan menilai keberhasilan atau kegagalan dari suatu proses bisnis. Mengukur performa bisnis dapat dilakukan dengan memperhitungkan beberapa metrik bisnis. Oleh karena itu, metrik bisnis yang akan dianalisa pada project ini yaitu pertumbuhan customer, kualitas produk, dan tipe pembayaran berdasarkan data history selama 3 tahun.

## Objective
Mengumpulkan insight dari analisis dan visualisasi terkait :
1. Annual Customer Activity Growth
2. Annual Product Category Quality
3. Annual Payment Type Usage

## Data Preparation
1. Membuat database menggunakan pgAdmin.
2. Membuat 9 tabel menggunakan statement `CREATE TABLE`.
3. Melakukan import data csv ke dalam database.
4. Menentukan Primary Key dan Foreign Key menggunakan statement `ALTER TABLE`.
5. Membuat dan export ERD (Entity Relationship Diagram).

**Hasil ERD:**
<p align="center">
   <img src="ERD_pic.png" alt="gambarERD">
</p>


## Data Analysis
### 1. Annual Customer Activity Growth

Pertumbuhan aktivitas customer pada perusahaan eCommerce dapat dianalisis dari Monthly Active User (MAU), customer baru, customer yang melakukan repeat order, dan rata-rata order yang dilakukan oleh customer setiap tahun.

<p align="center">
   <img src="picture/MAU dan New Customer.png" width = 600 px alt="grafik1">
</p>

Pada tahun 2016 memiliki nilai yang rendah dibandingkan dengan 2017 dan 2018. Hal ini dikarenakan data yang tersedia pada tahun 2016 dimulai pada bulan September, sehingga menyebabkan hasil analisis di tahun 2016 memiliki perbedaan yang jauh dibandingkan dengan 2017 dan 2018. Berdasarkan grafik diatas, terlihat bahwa **customer aktif bulanan (MAU) dan jumlah customer baru mengalami peningkatan**.

<p align="center">
   <img src="picture/Repeat Customer.png" width = 600 px alt="grafik2">
</p>

Pada tahun 2017 mengalami peningkatan yang drastis, hal ini jelas dikarenakan pada tahun 2016 data yang dimiliki hanya dari bulan September. Berbeda dengan MAU dan customer baru, **jumlah customer yang repeat order mengalami penurunan**.

<p align="center">
   <img src="picture/Frekuensi Order.png" width = 600 px alt="grafik3">
</p>

Dari hasil analisa di atas, dapat dilihat bahwa sepanjang tahun 2016-2018 customer hanya melakukan order sebanyak 1 kali, artinya customer tidak melakukan repeat order.

### 2. Annual Product Category Quality

Performa bisnis eCommerce berkaitan erat dengan kualitas produk dan juga dengan pendapatan/revenue perusahaan. Kualitas produk dapat dianalisis dari total revenue, total cancelled order, product dengan revenue tertinggi, dan product yang paling banyak di cancel.

<p align="center">
   <img src="picture/Total Revenue.png" width = 600 px alt="grafik4">
</p>

**Total revenue terus mengalami peningkatan** selama tahun 2016-2018.

<p align="center">
   <img src="picture/Total Cancel Order.png" width = 600 px alt="grafik5">
</p>

**Total cancel order meningkat** selama tahun 2016-2018.

<p align="center">
   <img src="picture/Top Product Revenue.png" width = 600 px alt="grafik6">
</p>

Kategori produk yang memberikan revenue terbanyak di setiap tahunnya berbeda-beda. Revenue yang dihasilkan oleh top product mengalami peningkatan setiap tahunnya dan tahun 2018 merupakan revenue tertinggi yang dihasilkan oleh top product, yaitu oleh product Health Beauty.

<p align="center">
   <img src="picture/Most Cancelled Product.png" width = 600 px alt="grafik7">
</p>

Kategori produk yang mengalami cancel terbanyak di setiap tahunnya berbeda-beda. Cancel product terbanyak terjadi pada tahun 2018 dengan kategori product Health Beauty.

### 3. Annual Payment Type Usage

Metode pembayaran yang digunakan customer dapat dianalisis dari metode pembayaran yang sering digunakan dan jumlah customer untuk setiap metode pembayaran.

<p align="center">
   <img src="picture/Payment Method.png" width = 600 px alt="grafik8">
</p>

**Metode pembayaran yang menjadi favorit untuk digunakan adalah Credit Card** dan yang paling sedikit digunakan adalah Debit Card. Metode pembayaran dengan Credit Card, Boleto, dan Debit Card mengalami peningkatan di setiap tahunnya, namun lain halnya dengan Voucher yang untuk penggunaannya di tahun 2018 mengalami penurunan. Penurunan penggunaan voucher ini mungkin terjadi karena pengurangan metode promosi menggunakan voucher. Hal yang menarik lainnya yaitu adanya peningkatan penggunaan Debit Card yang signifikan dari tahun 2017 ke tahun 2018, bahkan peningkatan ini lebih dari 100%. Peningkatan signifikan ini mungkin terjadi karena adanya promosi dengan kartu debit tertentu.

## Summary
1. Customer baru dan Monthly Active User (MAU) mengalami peningkatan di setiap tahunnya, namun customer tidak melakukan repeat order atau dapat dikatakan bahwa hanya melakukan order 1 kali.
2. Kategori produk yang memberikan revenue terbanyak setiap tahunnya mengalami perubahan. Kondisi revenue perusahaan secara keseluruhan juga mengalami peningkatan di setiap tahunnya. Kondisi baik ini tidak berbanding lurus dengan kondisi product yang di cancel dimana product yang di cancel mengalami kenaikan di setiap tahunnya. Untuk kategori product yang dicancel juga mengalami perubahan di setiap tahunnya. Pada tahun 2018, produk Health Beaut memberikan revenue terbanyak, tetapi juga mengalami cancel terbanyak.
3. Metode pembayaran yang paling banyak digunakan adalah Credit Card.
 


