WITH RestaurantSummary AS (
    -- بخش ۱: غذاهایی که توسط آشپزها در هر رستوران طبخ می‌شوند
	select 
		Restaurant_table.restaurant_title,
		Chef_table.chef_title, Food_table.
		food_title 
	FROM Restaurant_table 
		join Food_table ON Restaurant_table.restaurant_id = Food_table.restaurant_id  
		join Food_chef_table ON Food_chef_table.food_id = Food_table.food_id
		join Chef_table ON Chef_table.chef_id = Food_chef_table.chef_id

union all 

    -- بخش ۲: غذاهایی که در رستوران‌ها طبخ می‌شوند اما آشپز ندارند
	select
		Restaurant_table.restaurant_title,
		Chef_table.chef_title,
		Food_table.food_title
	from Restaurant_table 
		left join Food_table ON Restaurant_table.restaurant_id = Food_table.restaurant_id 
		left join Food_chef_table ON Food_chef_table.food_id = Food_table.food_id
		left join Chef_table ON Chef_table.chef_id = Food_chef_table.chef_id
	where chef_title is null

union all 

    -- بخش ۳: آشپزهایی که در رستوران‌ها حضور دارند اما هیچ غذایی طبخ نمی‌کنند
	select Restaurant_table.restaurant_title,
		Chef_table.chef_title,
		Food_table.food_title
	from Restaurant_table 
		join Restaurant_chef_table ON Restaurant_table.restaurant_id = Restaurant_chef_table.restaurant_id 
		left join Chef_table ON Chef_table.chef_id = Restaurant_chef_table.chef_id
		left join Food_chef_table ON Restaurant_chef_table.chef_id = Food_chef_table.chef_id left join Food_table ON Food_table.food_id = Food_chef_table.food_id
		and Food_table.restaurant_id = Restaurant_table.restaurant_id
	where Food_table.food_title is null

) 
	select * 
	from RestaurantSummary 
	order by restaurant_title