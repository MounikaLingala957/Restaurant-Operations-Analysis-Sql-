Select *
From Menu_items
-- Write a Query to find the number of items in the Menu ?
Select Count(Distinct (Menu_item_id)) as Numb_items
From menu_items
--What are the least and most expensive items on the menu?
select *
From Menu_items
Order By Price 

Select * 
From Menu_items
Order BY Price Desc
--How many Italian Dishes are on the Menu ?
Select Count ( Menu_Item_id)
From Menu_items 
Where Category ='Italian'
-- What is the most Expensive and least expensive items in Italian dishes ?
Select Item_name , Price 
From Menu_items 
Where Category='Italian'
Order By  Price 

Select Item_name , Price 
From Menu_items 
Where Category='Italian'
Order By  Price Desc
--How many dishes are in each Category ?
Select Category, COunt(menu_item_id) as Num_items
From Menu_items 
Group By Category 
--What is average dish Price with in each Category ?
Select Category, Round(Avg(price),2) Category_price
From Menu_items 
Group By Category 
--Explore the Order Table
-- What is the Date Range of the Table ?
Select MIn (Order_Date) Earliest ,Max(Order_Date) Latest 
From Order_Details

--How many orders made with in this date range ?
Select Count(Distinct Order_id)
From Order_details
--How many items were ordereed with in this date range?
Select Count(*)
From order_details 
--How many items ordered with in each order ?
Select Order_ID , COunt(Item_id) as Num_items
From order_details
Group By Order_id
--Which orders had the most number of items ?
Select Order_ID , COunt(Item_id) as Num_items
From order_details
Group By Order_id
Order By Num_items Desc
--How many orders have more than 12 items?
Select Count (*)
     From      ( Select Order_ID , COunt(Item_id) as Num_items
			From order_details
			Group By Order_id
			Having Count(item_id) >12) X
			--Analysing the Customer Behavior 
--Join Menu_items and Order_details 
Select *
From Menu_items Left Join Order_details 
On menu_item_id= Item_id 
--What are the least ordered and most ordered itmes ?
Select Item_id , Count(item_id) Item_count,Item_name ,Category 
From order_details Left Join Menu_items 
On Menu_item_id =Item_id
Group By Item_id,Item_name ,Category
Order By Item_count Desc
-- What were the top 5 orders that spent msot money ?
Select  sum(Price) Total_spend, Order_id 
From   order_details Left Join Menu_items 
On Menu_item_id =Item_id
Group By Order_id 
Order By Total_spend Desc
--View the details of the higest spend order ,what specific items were ordered?
Select *
From    order_details Left Join 
		Menu_items On Menu_item_id =Item_id
Where Order_id in(1938,5250,2310,4812,2977)