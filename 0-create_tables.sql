--create database dbhani
--use dbhani
--go
------------------------------جدول بیمه--------------------
create table insurance_tbl --بیمه
(
insurance_id int primary key identity(1,1),--بیمهID
insurance_Name nvarchar(70),--نام بیمه
)
--------------------------------جدول کشور-----------
create table country_tbl --جدول کشور
(
country_Id int primary key identity (1,1),--کشورID
country_name nvarchar(50),--نام کشور
)
--------------------------------جدول نوع دارو---------
create table type_tbl --جدول نوع دارو
(
[type_Id] int primary key identity (1,1),--نوع داروID
[type_Name] nvarchar(70),--اسم نوع دارو
)
---------------------------------جدول نسخه------------------------
create table prescription_tbl --نسخه
(
prescription_Id int primary key identity(1,1),--نسخهID
prescription_name nvarchar(70),--نام نسخه
prescription_family nvarchar(70),-- فامیلی نسخه
prescription_date date ,-- تاریخ نسخه
insurance_id int --بیمهId
constraint fk_insurance_prescription foreign key (insurance_id)
references insurance_tbl (insurance_id)
)
------------------------------جدول شرکت------------------
create table company_tbl --جدول شرکت
(
company_Id int primary key identity (1,1),--شرکتID
company_name nvarchar(70),--نام شرکت
country_Id int,--کشورID
constraint fk_country_company foreign key (country_Id)
references country_tbl (country_Id)
)
--------------------------------جدول دارو---------
create table drug_tbl --جدول دارو
(
drug_Id int primary key identity (1,1),-- داروID
drug_genericName nvarchar(70),--نام عمومی دارو
[type_Id] int --نوع داروID
constraint fk_type_drug foreign key ([type_id])
references type_tbl ([type_id])
)
----------------------------------جدول تجاری------
create table commerical_tbl --جدول تجاری
(
commerical_Id int primary key identity (1,1),--تجاری
commerical_name nvarchar(70),--نام تجاری
company_Id int,--شرکتID
drug_Id int, --داروId
commerical_price money --قیمت_تجاری
constraint fk_company_commerical foreign key (company_Id)
references company_tbl (company_Id),

constraint fk_drug_commerical foreign key (drug_Id)
references drug_tbl (drug_Id)
)
----------------------------جدول سفارش دارو-------------------------
create table order_tbl --سفارش دارو
(
order_Id int primary key identity (1,1),--سفارشID
prescription_Id int,--نسخهID
commerical_Id int,--تجاریID
order_measure int --تعداد سفارش
constraint fk_prescription_order foreign key (prescription_Id)
references prescription_tbl (prescription_Id),

constraint fk_commerical_order foreign key (commerical_Id)
references commerical_tbl (commerical_Id)
)
