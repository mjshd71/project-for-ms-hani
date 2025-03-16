--------------------------------------insurance_tbl--------------------------
INSERT INTO insurance_tbl (insurance_Name)
VALUES 
('Health Insurance'), -- بیمه سلامت
('Supplementary Insurance'), -- بیمه تکمیلی
('Life Insurance'), -- بیمه عمر
('Auto Insurance'), -- بیمه خودرو
('Fire Insurance'), -- بیمه آتش‌سوزی
('Medical Insurance'), -- بیمه درمانی
('Agricultural Insurance'), -- بیمه کشاورزی
('Supplementary Health Insurance'), -- بیمه درمان تکمیلی
('Medical Liability Insurance'), -- بیمه مسئولیت پزشکان
('Engineer Liability Insurance') -- بیمه مسئولیت مهندسان
--------------------------------------country_tbl------------------------------------
INSERT INTO country_tbl (country_name)
VALUES 
('Iran'),
('Germany'),
('France'),
('United States'),
('United Kingdom'),
('Canada'),
('India'),
('China'),
('Japan'),
('Brazil')
------------------------------------------company_tbl------------------------------
INSERT INTO company_tbl (company_name, country_Id)
VALUES 
('Daroupakhsh', 1), -- ایران
('Bayer', 2), -- آلمان
('Sanofi', 3), -- فرانسه
('Pfizer', 4), -- ایالات متحده
('GSK', 5), -- بریتانیا
('Novartis', 6), -- کانادا
('Roche', 7), -- هند
('Merck', 8), -- چین
('Johnson & Johnson', 9), -- ژاپن
('AstraZeneca', 10) -- برزیل
------------------------------------------type_tbl------------------------------
INSERT INTO type_tbl ([type_Name])
VALUES 
('Painkiller'), -- ضد درد
('Antibiotic'), -- آنتی بیوتیک
('Vitamin'), -- ویتامین
('Antihistamine'), -- آنتی هیستامین
('Antidepressant'), -- ضد افسردگی
('Antiviral'), -- ضد ویروس
('Antifungal'), -- ضد قارچ
('Antacid'), -- ضد اسید معده
('Anticoagulant'), -- ضد انعقاد خون
('Antidiabetic') -- ضد دیابت
----------------------------------------drug_tbl---------------------------------
INSERT INTO drug_tbl (drug_genericName, [type_Id])
VALUES 
('Paracetamol', 1), -- ضد درد
('Amoxicillin', 2), -- آنتی بیوتیک
('Vitamin C', 3), -- ویتامین
('Cetirizine', 4), -- آنتی هیستامین
('Sertraline', 5), -- ضد افسردگی
('Acyclovir', 6), -- ضد ویروس
('Fluconazole', 7), -- ضد قارچ
('Omeprazole', 8), -- ضد اسید معده
('Warfarin', 9), -- ضد انعقاد خون
('Metformin', 10) -- ضد دیابت
------------------------------------------commerical_tbl---------------------
INSERT INTO commerical_tbl (commerical_name, company_Id, drug_Id, commerical_price)
VALUES 
('Panadol', 1, 1, 50000), -- داروپخش
('Augmentin', 2, 2, 120000), -- بایر
('Vitamin C Plus', 3, 3, 80000), -- سانوفی
('Zyrtec', 4, 4, 70000), -- فایزر
('Cipralex', 5, 5, 95000), -- GSK
('Valtrex', 6, 6, 140000), -- Novartis
('Diflucan', 7, 7, 90000), -- Roche
('Prilosec', 8, 8, 75000), -- Merck
('Coumadin', 9, 9, 110000), -- Johnson & Johnson
('Glucophage', 10, 10, 55000) -- AstraZeneca
--------------------------------------prescription_tbl-------------------------
INSERT INTO prescription_tbl (prescription_name, prescription_family, prescription_date, insurance_id)
VALUES 
('Ali', 'Rezaei', '2024-10-01', 1),
('Maryam', 'Mohammadi', '2024-10-02', 2),
('Reza', 'Karimi', '2024-10-03', 3),
('Sara', 'Ahmadi', '2024-10-04', 4),
('Mohammad', 'Hosseini', '2024-10-05', 5),
('Fatemeh', 'Alavi', '2024-10-06', 6),
('Amir', 'Naseri', '2024-10-07', 7),
('Zahra', 'Moradi', '2024-10-08', 8),
('Hassan', 'Rahmani', '2024-10-09', 9),
('Narges', 'Kazemi', '2023-10-10', 10)
------------------------------------------order_tbl--------------------------------
INSERT INTO order_tbl (prescription_Id, commerical_Id, order_measure)
VALUES 
(1, 1, 2),
(2, 2, 1),
(3, 3, 3), 
(4, 4, 1),
(5, 5, 2),
(6, 6, 1),
(7, 7, 2),
(8, 8, 1),
(9, 9, 3),
(10, 10, 2)