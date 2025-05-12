create database superMarket;

select * from cleaned;
select clean_date, count(invoice_id) 
  from  cleaned
  group by clean_date;


select month(clean_date), count(invoice_id) 
  from  cleaned
  group by month(clean_date);
  
select city , month(clean_date), count(invoice_id) 
from  cleaned
group by city,month(clean_date);

select city , sum(cogs)
from  cleaned
group by city;
select  monthname(clean_date),sum(cogs) 
from  cleaned
group by monthname(clean_date);


select city ,product_line,round(sum(revenue),2)
from cleaned
group by city , product_line
order by city , product_line;


select * from cleaned;

select clean_date , hour(time) ,product_line, count(invoice_id) as total
from cleaned
group by clean_date, hour(time),product_line
order by total desc;

select  city, product_line , round(sum(gross_income),2) as profit ,Rank() over(partition by city order by round(sum(gross_income),2) desc) as Rank_
from cleaned
group by city , product_line
order by city;