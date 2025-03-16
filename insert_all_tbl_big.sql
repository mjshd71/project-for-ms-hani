--------------------------------------insurance_tbl--------------------------
insert into insurance_tbl (insurance_Name) values
('Health Insurance'), -- بیمه سلامت
('Supplementary Insurance'), -- بیمه تکمیلی
('Life Insurance'), -- بیمه عمر
('Auto Insurance'), -- بیمه خودرو
('Fire Insurance'), -- بیمه آتش‌سوزی
('Liability Insurance'), -- بیمه مسئولیت
('Cargo Insurance'), -- بیمه باربری
('Accident Insurance'), -- بیمه حوادث
('Life and Investment Insurance'), -- بیمه عمر و سرمایه‌گذاری
('Travel Insurance'), -- بیمه مسافرتی
('Medical Insurance'), -- بیمه درمانی
('Agricultural Insurance'), -- بیمه کشاورزی
('Supplementary Health Insurance'), -- بیمه درمان تکمیلی
('Medical Liability Insurance'), -- بیمه مسئولیت پزشکان
('Engineer Liability Insurance'), -- بیمه مسئولیت مهندسان
('Manager Liability Insurance'), -- بیمه مسئولیت مدیران
('Contractor Liability Insurance'), -- بیمه مسئولیت پیمانکاران
('Workplace Accident Insurance'), -- بیمه حوادث کار
('Sports Accident Insurance'), -- بیمه حوادث ورزشی
('Student Accident Insurance'), -- بیمه حوادث دانشجویی
('Family Accident Insurance'), -- بیمه حوادث خانوادگی
('Occupational Accident Insurance'), -- بیمه حوادث شغلی
('Natural Disaster Insurance'), -- بیمه حوادث طبیعی
('Unexpected Accident Insurance'), -- بیمه حوادث غیرمترقبه
('Social Accident Insurance'), -- بیمه حوادث اجتماعی
('General Accident Insurance'), -- بیمه حوادث عمومی
('Personal Accident Insurance'), -- بیمه حوادث شخصی
('Travel Accident Insurance') -- بیمه حوادث مسافرتی
--------------------------------------country_tbl------------------------------------
insert into country_tbl (country_name) values
('Iran'),
('United States'),
('Germany'),
('France'),
('United Kingdom'),
('Canada'),
('India'),
('China'),
('Japan'),
('Brazil'), 
('Italy'),
('Spain'),
('Australia'),
('South Korea'), -- کره جنوبی
('Russia'),
('Turkey'),
('Mexico'),
('Netherlands'), -- هلند
('Switzerland'), -- سوئیس
('Sweden'); -- سوئد
------------------------------------------company_tbl------------------------------
declare @i INT = 1;
declare @country_Id INT;
declare @company_name nvarchar(70);

-- لیست کشورهای موجود
declare @country_ids TABLE (id int);
insert into @country_ids (id) value (1), (2), (3), (4), (5), (6), (7), (8), (9), (10), (11), (12), (13), (14), (15), (16), (17), (18), (19), (20);

-- لیست نام‌های شرکت‌ها
declare @company_names table (name nvarchar(70));
INSERT INTO @company_names (name) values
('Daroupakhsh'), ('Bayer'), ('Sanofi'), ('Pfizer'), ('Novartis'),
('Roche'), ('Merck'), ('Johnson & Johnson'), ('GSK'), ('AstraZeneca'),
('Abbott'), ('Teva'), ('Takeda'), ('Boehringer Ingelheim'), ('Eli Lilly'),
('Amgen'), ('Gilead Sciences'), ('Biogen'), ('Novo Nordisk'), ('Moderna'),
('Sinopharm'), ('Hetero Drugs'), ('Cipla'), ('Dr. Reddy’s'), ('Lupin'),
('Sun Pharma'), ('Zydus Cadila'), ('Mylan'), ('Sandoz'), ('Fresenius Kabi'),
('Aurobindo Pharma'), ('Hikma Pharmaceuticals'), ('Endo International'), ('Perrigo'), ('Mallinckrodt'),
('Alvogen'), ('Stada Arzneimittel'), ('Lannett'), ('Amneal Pharmaceuticals'), ('Purdue Pharma'),
('Jazz Pharmaceuticals'), ('Horizon Therapeutics'), ('Vertex Pharmaceuticals'), ('Regeneron Pharmaceuticals'), ('Biomarin Pharmaceutical'),
('Alexion Pharmaceuticals'), ('Ionis Pharmaceuticals'), ('Sarepta Therapeutics'), ('Incyte Corporation'), ('Seagen'),
('Exelixis'), ('Clovis Oncology'), ('Blueprint Medicines'), ('Agios Pharmaceuticals'), ('Deciphera Pharmaceuticals'),
('Karyopharm Therapeutics'), ('Epizyme'), ('Adaptive Biotechnologies'), ('Guardant Health'), ('Natera'),
('Fate Therapeutics'), ('CRISPR Therapeutics'), ('Editas Medicine'), ('Intellia Therapeutics'), ('Beam Therapeutics'),
('Sana Biotechnology'), ('Allogene Therapeutics'), ('Bluebird Bio'), ('uniQure'), ('Orchard Therapeutics'),
('Avrobio'), ('Freeline Therapeutics'), ('MeiraGTx'), ('LogicBio Therapeutics'), ('Sangamo Therapeutics');

-- ایجاد ۷۰ ردیف
while @i <= 70
BEGIN
    -- انتخاب تصادفی نام شرکت
    SET @company_name = (select TOP 1 name from @company_names order by NEWID());

    -- انتخاب تصادفی country_Id از لیست کشورهای موجود
    SET @country_Id = (select TOP 1 id from @country_ids order by NEWID());

    -- درج داده‌ها در جدول company_tbl
    insert into company_tbl (company_name, country_Id)
    values (@company_name, @country_Id);

    -- افزایش شمارنده
    SET @i = @i + 1;
END;
--------------برای آنکه چند شرکت فرانسوی داشته باشیم مربوط به سوال دوم
insert into company_tbl (company_name, country_Id)
values 
('Sanofi', 4), -- شرکت فرانسوی معروف
('Servier', 4), -- شرکت فرانسوی دیگر
('Ipsen', 4); -- شرکت فرانسوی دیگر
------------------------------------------type_tbl------------------------------
insert into type_tbl ([type_Name]) values
('Painkiller'), -- ضد درد
('Antibiotic'), -- آنتی بیوتیک
('Vitamin'), -- ویتامین
('Antihistamine'), -- آنتی هیستامین
('Antidepressant'), -- ضد افسردگی
('Antiviral'), -- ضد ویروس
('Antifungal'), -- ضد قارچ
('Antacid'), -- ضد اسید معده
('Anticoagulant'), -- ضد انعقاد خون
('Antidiabetic'), -- ضد دیابت
('Antihypertensive'), -- ضد فشار خون
('Antipyretic'), -- تب‌بر
('Antiemetic'), -- ضد تهوع
('Bronchodilator'), -- برای آسم
('Corticosteroid'), -- ضد التهاب
('Diuretic'), -- ادرارآور
('Laxative'), -- ملین
('Sedative'), -- آرام‌بخش
('Stimulant'), -- محرک
('Hormone'), -- هورمون
('Immunosuppressant'), -- سرکوب‌کننده سیستم ایمنی
('Muscle Relaxant'), -- شل‌کننده عضلات
('Anticonvulsant'), -- ضد تشنج
('Antipsychotic'), -- ضد روان‌پریشی
('Antiparasitic'), -- ضد انگل
('Antineoplastic'), -- ضد سرطان
('Vaccine'), -- واکسن
('Antitussive'), -- ضد سرفه
('Decongestant'), -- ضد احتقان
('Expectorant') -- خلط‌آور
----------------------------------------drug_tbl---------------------------------
insert into drug_tbl (drug_genericName, [type_Id]) values
('Paracetamol', 1), -- ضد درد
('Ibuprofen', 1), -- ضد درد
('Aspirin', 1), -- ضد درد
('Naproxen', 1), -- ضد درد
('Diclofenac', 1), -- ضد درد
('Amoxicillin', 2), -- آنتی بیوتیک
('Ciprofloxacin', 2), -- آنتی بیوتیک
('Azithromycin', 2), -- آنتی بیوتیک
('Doxycycline', 2), -- آنتی بیوتیک
('Metronidazole', 2), -- آنتی بیوتیک
('Vitamin C', 3), -- ویتامین
('Vitamin D', 3), -- ویتامین
('Vitamin B12', 3), -- ویتامین
('Vitamin E', 3), -- ویتامین
('Multivitamin', 3), -- ویتامین
('Cetirizine', 4), -- آنتی هیستامین
('Loratadine', 4), -- آنتی هیستامین
('Fexofenadine', 4), -- آنتی هیستامین
('Diphenhydramine', 4), -- آنتی هیستامین
('Chlorpheniramine', 4), -- آنتی هیستامین
('Sertraline', 5), -- ضد افسردگی
('Fluoxetine', 5), -- ضد افسردگی
('Escitalopram', 5), -- ضد افسردگی
('Paroxetine', 5), -- ضد افسردگی
('Venlafaxine', 5), -- ضد افسردگی
('Acyclovir', 6), -- ضد ویروس
('Oseltamivir', 6), -- ضد ویروس
('Ribavirin', 6), -- ضد ویروس
('Valacyclovir', 6), -- ضد ویروس
('Ganciclovir', 6), -- ضد ویروس
('Fluconazole', 7), -- ضد قارچ
('Ketoconazole', 7), -- ضد قارچ
('Itraconazole', 7), -- ضد قارچ
('Clotrimazole', 7), -- ضد قارچ
('Terbinafine', 7), -- ضد قارچ
('Omeprazole', 8), -- ضد اسید معده
('Ranitidine', 8), -- ضد اسید معده
('Famotidine', 8), -- ضد اسید معده
('Esomeprazole', 8), -- ضد اسید معده
('Pantoprazole', 8), -- ضد اسید معده
('Warfarin', 9), -- ضد انعقاد خون
('Heparin', 9), -- ضد انعقاد خون
('Rivaroxaban', 9), -- ضد انعقاد خون
('Apixaban', 9), -- ضد انعقاد خون
('Dabigatran', 9), -- ضد انعقاد خون
('Metformin', 10), -- ضد دیابت
('Insulin', 10), -- ضد دیابت
('Glimepiride', 10), -- ضد دیابت
('Pioglitazone', 10), -- ضد دیابت
('Sitagliptin', 10), -- ضد دیابت
('Lisinopril', 11), -- ضد فشار خون
('Amlodipine', 11), -- ضد فشار خون
('Losartan', 11), -- ضد فشار خون
('Valsartan', 11), -- ضد فشار خون
('Hydrochlorothiazide', 11), -- ضد فشار خون
('Paracetamol', 12), -- تب‌بر
('Ibuprofen', 12), -- تب‌بر
('Aspirin', 12), -- تب‌بر
('Naproxen', 12), -- تب‌بر
('Diclofenac', 12), -- تب‌بر
('Metoclopramide', 13), -- ضد تهوع
('Ondansetron', 13), -- ضد تهوع
('Domperidone', 13), -- ضد تهوع
('Prochlorperazine', 13), -- ضد تهوع
('Promethazine', 13), -- ضد تهوع
('Salbutamol', 14), -- گشادکننده برونش
('Ipratropium', 14), -- گشادکننده برونش
('Theophylline', 14), -- گشادکننده برونش
('Formoterol', 14), -- گشادکننده برونش
('Salmeterol', 14), -- گشادکننده برونش
('Prednisone', 15), -- کورتیکواستروئید
('Dexamethasone', 15), -- کورتیکواستروئید
('Hydrocortisone', 15), -- کورتیکواستروئید
('Methylprednisolone', 15), -- کورتیکواستروئید
('Betamethasone', 15), -- کورتیکواستروئید
('Furosemide', 16), -- ادرارآور
('Spironolactone', 16), -- ادرارآور
('Hydrochlorothiazide', 16), -- ادرارآور
('Bumetanide', 16), -- ادرارآور
('Torasemide', 16), -- ادرارآور
('Bisacodyl', 17), -- ملین
('Senna', 17), -- ملین
('Lactulose', 17), -- ملین
('Polyethylene Glycol', 17), -- ملین
('Docusate', 17), -- ملین
('Diazepam', 18), -- آرام‌بخش
('Alprazolam', 18), -- آرام‌بخش
('Clonazepam', 18), -- آرام‌بخش
('Lorazepam', 18), -- آرام‌بخش
('Zolpidem', 18), -- آرام‌بخش
('Caffeine', 19), -- محرک
('Amphetamine', 19), -- محرک
('Methylphenidate', 19), -- محرک
('Modafinil', 19), -- محرک
('Nicotine', 19); -- محرک
------------------------------------------commerical_tbl---------------------
insert into commerical_tbl (commerical_name, company_Id, drug_Id, commerical_price) values
('Panadol', 53, 1, 50000), -- پانادول شرکت Daroupakhsh، داروی Paracetamol
('Augmentin', 22, 6, 120000), -- آگمنتین شرکت Bayer، داروی Amoxicillin
('Vitamin C Plus', 75, 11, 80000), -- ویتامین C پلاس شرکت Sanofi، داروی Vitamin C
('Ibuprofen Plus', 53, 2, 45000), -- ایبوپروفن پلاس شرکت Daroupakhsh، داروی Ibuprofen
('Cipralex', 22, 22, 95000), -- سیپرالکس شرکت Bayer، داروی Escitalopram
('Zyrtec', 75, 16, 70000), -- زیرتک شرکت Sanofi، داروی Cetirizine
('Amoxil', 64, 6, 110000), -- آموکسیل شرکت Pfizer، داروی Amoxicillin
('Lipitor', 71, 8, 130000), -- لیپیتور شرکت AstraZeneca، داروی Atorvastatin
('Zantac', 42, 38, 60000), -- زانتاک شرکت Teva، داروی Ranitidine
('Valtrex', 37, 26, 140000), -- والترکس شرکت Johnson & Johnson، داروی Valacyclovir
('Advil', 37, 2, 48000), -- ادویل شرکت Johnson & Johnson، داروی Ibuprofen
('Glucophage', 50, 41, 55000), -- گلوکوفاژ شرکت GSK، داروی Metformin
('Nexium', 71, 37, 90000), -- نکسیوم شرکت AstraZeneca، داروی Esomeprazole
('Synthroid', 42, 14, 75000), -- سینتروئید شرکت Teva، داروی Levothyroxine
('Crestor', 71, 9, 135000), -- کرستور شرکت AstraZeneca، داروی Rosuvastatin
('Plavix', 48, 39, 85000), -- پلاویکس شرکت Cipla، داروی Clopidogrel
('Diovan', 22, 23, 95000), -- دیووان شرکت Bayer، داروی Valsartan
('Humira', 35, 50, 200000), -- هومیرا شرکت Biogen، داروی Adalimumab
('Enbrel', 87, 51, 190000), -- انبرل شرکت Gilead Sciences، داروی Etanercept
('Lantus', 75, 42, 150000), -- لانتوس شرکت Sanofi، داروی Insulin Glargine
('Januvia', 35, 44, 110000), -- جانوویا شرکت Biogen، داروی Sitagliptin
('Lyrica', 23, 15, 120000), -- لیریکا شرکت Novo Nordisk، داروی Pregabalin
('Cymbalta', 24, 24, 100000), -- سیمبالتا شرکت Vertex Pharmaceuticals، داروی Duloxetine
('Xanax', 43, 18, 65000), -- زاناکس شرکت Editas Medicine، داروی Alprazolam
('Zoloft', 48, 21, 90000), -- زولوفت شرکت Cipla، داروی Sertraline
('Prozac', 48, 22, 85000), -- پروزاک شرکت Cipla، داروی Fluoxetine
('Viagra', 67, 53, 180000), -- ویاگراشرکت Dr. Reddy’s، داروی Sildenafil
('Cialis', 48, 54, 190000), -- سیالیس شرکت Cipla، داروی Tadalafil
('Levothyroxine', 25, 14, 70000), -- لووتیروکسین شرکت Sun Pharma، داروی Levothyroxine
('Metoprolol', 42, 12, 55000), -- متوپرولول شرکت Teva، داروی Metoprolol
('Losartan', 22, 23, 60000), -- لوزارتان شرکت Bayer، داروی Losartan
('Atorvastatin', 71, 8, 80000), -- آتورواستاتین شرکت AstraZeneca، داروی Atorvastatin
('Omeprazole', 57, 37, 75000), -- امپرازول شرکت Fresenius Kabi، داروی Omeprazole
('Paracetamol Extra', 53, 1, 52000), -- پاراستامول اکسترا شرکت Daroupakhsh، داروی Paracetamol
('Ibuprofen Max', 22, 2, 47000), -- ایبوپروفن مکس شرکت Bayer، داروی Ibuprofen
('Amoxicillin Forte', 75, 6, 115000), -- آموکسی سیلین فورته شرکت Sanofi، داروی Amoxicillin
('Vitamin D3', 64, 12, 85000), -- ویتامین D3 شرکت Pfizer، داروی Vitamin D
('Cetirizine Plus', 71, 16, 72000), -- ستیریزین پلاس شرکت AstraZeneca، داروی Cetirizine
('Fluoxetine Pro', 42, 22, 88000), -- فلوکستین پرو شرکت Teva، داروی Fluoxetine
('Valacyclovir Plus', 37, 26, 145000), -- والاسیکلوویر پلاس شرکت Johnson & Johnson، داروی Valacyclovir
('Ranitidine Extra', 42, 38, 62000), -- رانیتیدین اکسترا شرکت Teva، داروی Ranitidine
('Esomeprazole Max', 71, 37, 92000), -- اسومپرازول مکس شرکت AstraZeneca، داروی Esomeprazole
('Metformin Forte', 50, 41, 58000), -- متفورمین فورته شرکت GSK، داروی Metformin
('Insulin Rapid', 75, 42, 155000), -- انسولین رپید شرکت Sanofi، داروی Insulin
('Sitagliptin Plus', 35, 44, 112000), -- سیتاگلیپتین پلاس شرکت Biogen، داروی Sitagliptin
('Pregabalin Extra', 23, 15, 125000), -- پرگابالین اکسترا شرکت Novo Nordisk، داروی Pregabalin
('Duloxetine Pro', 24, 24, 105000), -- دولوکستین پرو شرکت Vertex Pharmaceuticals، داروی Duloxetine
('Alprazolam Max', 43, 18, 68000), -- آلپرازولام مکس شرکت Editas Medicine، داروی Alprazolam
('Sertraline Plus', 48, 21, 92000), -- سرترالین پلاس شرکت Cipla، داروی Sertraline
('Fluoxetine Extra', 48, 22, 87000), -- فلوکستین اکسترا شرکت Cipla، داروی Fluoxetine
('Sildenafil Pro', 67, 53, 185000), -- سیلدنافیل پرو شرکت Dr. Reddy’s، داروی Sildenafil
('Tadalafil Max', 48, 54, 195000), -- تادالافیل مکس شرکت Cipla، داروی Tadalafil
('Levothyroxine Plus', 25, 14, 72000), -- لووتیروکسین پلاس شرکت Sun Pharma، داروی Levothyroxine
('Metoprolol Extra', 42, 12, 57000), -- متوپرولول اکسترا شرکت Teva، داروی Metoprolol
('Losartan Pro', 22, 23, 62000), -- لوزارتان پرو شرکت Bayer، داروی Losartan
('Atorvastatin Max', 71, 8, 82000), -- آتورواستاتین مکس شرکت AstraZeneca، داروی Atorvastatin
('Omeprazole Plus', 57, 37, 77000), -- امپرازول پلاس شرکت Fresenius Kabi، داروی Omeprazole
('Paracetamol Pro', 53, 1, 53000), -- پاراستامول پرو شرکت Daroupakhsh، داروی Paracetamol
('Ibuprofen Extra', 22, 2, 48000), -- ایبوپروفن اکستراشرکت Bayer، داروی Ibuprofen
('Amoxicillin Pro', 75, 6, 117000), -- آموکسی سیلین پرو شرکت Sanofi، داروی Amoxicillin
('Vitamin D3 Extra', 64, 12, 87000), -- ویتامین D3 اکسترا شرکت Pfizer، داروی Vitamin D
('Cetirizine Max', 71, 16, 74000), -- ستیریزین مکس شرکت AstraZeneca، داروی Cetirizine
('Fluoxetine Ultra', 42, 22, 89000); -- فلوکستین اولترا شرکت Teva، داروی Fluoxetine


-----------------------مربوط به سوال اول برای بالا بردن جامعه آماری-
insert into commerical_tbl (commerical_name, company_Id, drug_Id, commerical_price)
values 
('Lantus', 92, 42, 150000), -- داروی ساخت Sanofi
('Plavix', 93, 39, 85000), -- داروی ساخت Servier
('Somakit', 94, 50, 200000); -- داروی ساخت Ipsen
--------------------------------------prescription_tbl-------------------------
-- ایجاد جدول موقت برای ذخیره نام‌ها و فامیلی‌های تصادفی
declare @first_names table (name nvarchar(70));
declare @last_names table (name nvarchar(70));

-- اضافه کردن نام‌ها و فامیلی‌های تصادفی
insert into @first_names (name) values
('Ali'), ('Maryam'), ('Reza'), ('Sara'), ('Mohammad'), ('Fatemeh'), ('Amir'), ('Zahra'), ('Hassan'), ('Narges'),
('Ahmad'), ('Leila'), ('Mehdi'), ('Zeynab'), ('Hossein'), ('Parvaneh'), ('Alireza'), ('Shadi'), ('Kamran'), ('Nazanin'),
('Farhad'), ('Yasmin'), ('Saeed'), ('Mina'), ('Iman'), ('Roya'), ('Behnam'), ('Elham'), ('Pouya'), ('Samira');

insert into @last_names (name) values
('Rezaei'), ('Mohammadi'), ('Karimi'), ('Ahmadi'), ('Hosseini'), ('Alavi'), ('Naseri'), ('Moradi'), ('Rahmani'), ('Kazemi'),
('Jafari'), ('Gholami'), ('Ebrahimi'), ('Rahimi'), ('Sadeghi'), ('Mousavi'), ('Taheri'), ('Mirzaei'), ('Farahani'), ('Hashemi'),
('Kiani'), ('Abbasi'), ('Mahmoudi'), ('Salehi'), ('Nouri'), ('Shahbazi'), ('Zare'), ('Yousefi'), ('Asadi'), ('Bagheri');

-- ایجاد ۱۰,۰۰۰ ردیف
declare @i int = 1;
declare @insurance_id int;
declare @prescription_date date;
declare @prescription_name nvarchar(70);
declare @prescription_family nvarchar(70);

-- لیست بیمه‌ها (insurance_id)
declare @insurance_ids TABLE (id INT);
insert into @insurance_ids (id) values
(1), (2), (3), (4), (5), (6), (7), (8), (9), (10),
(11), (12), (13), (14), (15), (16), (17), (18), (19), (20),
(21), (22), (23), (24), (25), (26), (27), (28), (29), (30),
(31), (32), (33), (34), (35), (36), (37), (38), (39), (40),
(41), (42), (43), (44), (45), (46), (47), (48), (49), (50),
(51), (52), (53), (54), (55), (56);

-- ایجاد ۱۰,۰۰۰ ردیف
while @i <= 10000
BEGIN
    -- انتخاب تصادفی نام و فامیلی
    SET @prescription_name = (select top 1 name from @first_names order by NEWID());
    SET @prescription_family = (select top 1 name from @last_names order by NEWID());

    -- انتخاب تصادفی تاریخ بین ۱ سال گذشته تا امروز
    SET @prescription_date = DATEADD(DAY, -FLOOR(RAND() * 365), GETDATE());

    -- انتخاب تصادفی بیمه (برخی بیمه‌ها بیشتر از ۱۰۰ نسخه داشته باشند)
    IF @i <= 500 -- ۵۰۰ نسخه برای بیمه ۱
        SET @insurance_id = 1;
    else IF @i <= 1000 -- ۵۰۰ نسخه برای بیمه ۲
        SET @insurance_id = 2;
    else IF @i <= 1500 -- ۵۰۰ نسخه برای بیمه ۳
        SET @insurance_id = 3;
    else IF @i <= 2000 -- ۵۰۰ نسخه برای بیمه ۴
        SET @insurance_id = 4;
    else IF @i <= 2500 -- ۵۰۰ نسخه برای بیمه ۵
        SET @insurance_id = 5;
    else -- بقیه نسخه‌ها به صورت تصادفی
        SET @insurance_id = (select top 1 id from @insurance_ids order by NEWID());

    -- درج داده‌ها در جدول prescription_tbl
    insert into prescription_tbl (prescription_name, prescription_family, prescription_date, insurance_id)
    values (@prescription_name, @prescription_family, @prescription_date, @insurance_id);

    -- افزایش شمارنده
    SET @i = @i + 1;
END;



------------------میخوام نسخه های مربوط به شرکت فرانسه را اضافه کنم
insert into prescription_tbl (prescription_name, prescription_family, prescription_date, insurance_id)
values 
('Ali', 'Rezaei', '2023-10-01', 1),
('Maryam', 'Mohammadi', '2023-10-02', 2),
('Reza', 'Karimi', '2023-10-03', 3),
('Sara', 'Ahmadi', '2023-10-04', 4),
('Mohammad', 'Hosseini', '2023-10-05', 5),
('Fatemeh', 'Alavi', '2023-10-06', 6),
('Amir', 'Naseri', '2023-10-07', 7),
('Zahra', 'Moradi', '2023-10-08', 8),
('Hassan', 'Rahmani', '2023-10-09', 9),
('Narges', 'Kazemi', '2023-10-10', 10),
('Ahmad', 'Jafari', '2023-10-11', 11);
------------------------------------------order_tbl--------------------------------
-- ایجاد ۴۰,۰۰۰ ردیف در جدول order_tbl
declare @i int = 1;
declare @prescription_Id int;
declare @commerical_Id int;
declare @order_measure int;

-- لیست prescription_Idها از جدول prescription_tbl
declare @prescription_ids table (id int);
insert into @prescription_ids (id)
select prescription_Id from prescription_tbl;

-- لیست commerical_Idها از جدول commerical_tbl
declare @commerical_ids table (id int);
insert into @commerical_ids (id)
select commerical_Id from commerical_tbl;
---با توجه به انکه ما 10000 نسخه داریم و به طور میانگین هر نسخه 4 دارو داشته باشد پس 40000 دارو تصادفی در نسخه ها خواهیم داشت
-- ایجاد ۴۰,۰۰۰ ردیف
while @i <= 40000
BEGIN
    -- انتخاب تصادفی prescription_Id
    SET @prescription_Id = (select top 1 id from @prescription_ids order by NEWID());

    -- انتخاب تصادفی commerical_Id
    SET @commerical_Id = (select top 1 id from @commerical_ids order by NEWID());

    -- انتخاب تصادفی تعداد سفارش (بین ۱ تا ۱۰)
    SET @order_measure = FLOOR(RAND() * 10) + 1;

    -- درج داده‌ها در جدول order_tbl
    insert into order_tbl (prescription_Id, commerical_Id, order_measure)
    values (@prescription_Id, @commerical_Id, @order_measure);

    -- افزایش شمارنده
    SET @i = @i + 1;
END;


-----------------------میخوام سفارش هایی که مربوط به شرکت فرانسه است را اضافه کنم
insert into order_tbl (prescription_Id, commerical_Id, order_measure)
values 
(10001, 65, 1),
(10002, 66, 1), 
(10003, 67, 1), 
(10004, 65, 1),
(10005, 66, 1),
(10006, 67, 1),
(10007, 65, 1),
(10008, 66, 1),
(10009, 67, 1),
(10010, 65, 1),
(10011, 66, 1);