-----------------------------------------------------------question 1
--------------------------تعداد نسخه هایی که داروی ساخت فرانسه دارن را نمایش بده؟
select count(distinct p.prescription_id) from prescription_tbl p  
				join order_tbl o on p.prescription_Id=o.prescription_Id 
				join commerical_tbl c on o.commerical_Id=c.commerical_Id
				join company_tbl co on co.company_Id=c.company_Id
				join country_tbl on country_tbl.country_Id=co.country_Id
where country_tbl.country_name='france'
--------------------------------------------------------question 2
----------------------نام شرکت های بیمه ای که در سال گذشته بیشتر از 100 نسخه داشته اند را نمایش بده؟
	select i.insurance_Name , count(p.prescription_Id) as countprescription_Id from insurance_tbl i join prescription_tbl p
				on i.insurance_id=p.insurance_id
	where year(p.prescription_date)=2024----سال گذشته
	group by i.insurance_Name
	having count(p.prescription_Id)>100----بیش از 100 نسخه
	order by 2 desc
-------------------------------------------------------question 3
 ------------------استفاده از Sp
 -----------------------implement
create proc GetMostExpensiveDrug
    @company_Id int
AS
BEGIN
    select top 1
        c.commerical_name AS' داروی_تجاری',
        c.commerical_price AS' قیمت'
    from 
        commerical_tbl c
    where 
        c.company_Id = @company_Id
   order by 
        c.commerical_price desc;
END
---------------------call
exec GetMostExpensiveDrug @company_Id = 67


----------ساخت به روش fn
 -----------------------implement
create function GetMostExpensiveDrug2(@company_Id int)
returns table
AS
return (
    select top 1
        c.commerical_name AS داروی_تجاری,
        c.commerical_price AS قیمت
    from 
        commerical_tbl c
    where 
        c.company_Id = @company_Id
    order by 
        c.commerical_price desc
);
---------------------call
select * 
from GetMostExpensiveDrug2(53)

-----------------------------------------------------------------------question 4
-----نام گران قیمت ترین دارو در هر دسته را نمایش دهید؟
with RankedDrugs AS (
				select c.commerical_name,
				c.commerical_price,
				t.[type_Name],
				ROW_NUMBER() over (partition by t.[type_Id] order by c.commerical_price) as ranked
				from commerical_tbl c 
				join drug_tbl d on c.drug_Id=d.drug_Id
				join type_tbl t on d.[type_Id]=t.[type_Id]
				)
			select 
			commerical_name,
			commerical_price,
			ranked 
			from RankedDrugs
			where ranked =1


------------------------------------------------------------------------------question 5
-----بدون تغییر بر روی داده های داخل جدول،گزارشی با دو ستون نام دارو 
-----و قیمت با افزایش 3 درصدی  را به کارفرما نمایش دهید

--------------------------------with-استفاده از------------
with IncreasedPrice 
AS (
    select 
        d.drug_genericName AS name_drug,
        c.commerical_price * 1.03 AS price_increase
    from drug_tbl d
    JOIN commerical_tbl c ON d.drug_Id = c.drug_Id
  )
SELECT * FROM IncreasedPrice
order by 2 desc
------------نیز استفاده کنیم-select-می تونیم از دستور -----------
select 
    d.drug_genericName AS name_drug,
    c.commerical_price * 1.03 AS price_increase
FROM drug_tbl d
JOIN commerical_tbl c ON d.drug_Id = c.drug_Id
order by 2 desc
----------می تونستیم ویو هم بسازیم و استفاده کنیم---------------
	create view IncreasedPriceReport AS
select 
    d.drug_genericName AS name_drug,
    c.commerical_price * 1.03 AS price_increase
FROM drug_tbl d
JOIN commerical_tbl c ON d.drug_Id = c.drug_Id


SELECT * FROM IncreasedPriceReport
order by 2 desc




