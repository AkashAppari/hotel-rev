with hotels as(
select * from dbo.['2018$']
union
select * from dbo.['2019$']
union
select * from dbo.['2020$'])

select arrival_date_year, hotel,
sum((stays_in_week_nights + stays_in_weekend_nights) * adr) as renenue,
concat (round((sum(required_car_parking_spaces)/sum(stays_in_week_nights +
stays_in_weekend_nights)) * 100, 2), '%') as parking_percentage
from hotels group by arrival_date_year, hotel

with hotels as(
select * from dbo.['2018$']
union
select * from dbo.['2019$']
union
select * from dbo.['2020$'])

select * from hotels
left join dbo.market_segment$
on hotels.market_segment = market_segment$.market_segment
left join dbo.meal_cost$
on meal_cost$.meal = hotels.meal