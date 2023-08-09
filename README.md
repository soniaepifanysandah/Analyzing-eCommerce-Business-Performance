# Analyzing-eCommerce-Business-Performance-with-SQL

**Tool :** PostgreSQL <br>
**Programming Language :** SQL <br>
**Visualization Tool :** Excel <br>

## Introduction
Pada project ini, sebagai anggota tim Data Analytics di sebuah perusahaan eCommerce akan melakukan analisis terhadap aspek yang berkaitan dengan performa bisnis perusahaan. Mengukur performa bisnis sangatlah penting untuk melacak, memantau, dan menilai keberhasilan atau kegagalan dari suatu proses bisnis. Mengukur performa bisnis dapat dilakukan dengan memperhitungkan beberapa metrik bisnis. Oleh karena itu, metrik bisnis yang akan dianalisa pada project ini yaitu pertumbuhan pelanggan, kualitas produk, dan tipe pembayaran berdasarkan data history selama 3 tahun.

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

<p align="center">
   <img src="MAU dan New Customer.png" width = 600 px alt="grafik1">
</p>

Pada tahun 2016 memiliki nilai yang rendah dibandingkan dengan 2017 dan 2018. Hal ini dikarenakan data yang tersedia pada tahun 2016 dimulai pada bulan September, sehingga menyebabkan hasil analisis di tahun 2016 memiliki perbedaan yang jauh dibandingkan dengan 2017 dan 2018. Berdasarkan grafik diatas, terlihat bahwa **customer aktif bulanan (MAU) dan jumlah customer baru mengalami peningkatan**.

<p align="center">
   <img src="Repeat Customer.png" width = 600 px alt="grafik2">
</p>

Pada tahun 2017 mengalami peningkatan yang drastis, hal ini jelas dikarenakan pada tahun 2016 data yang dimiliki hanya dari bulan September. Berbeda dengan MAU dan customer baru, jumlah customer yang repeat order mengalami penurunan.

