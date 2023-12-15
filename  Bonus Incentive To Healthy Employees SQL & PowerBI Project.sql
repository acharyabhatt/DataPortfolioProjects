

-- Create a join table 

select * from absenteeism_at_work aaw left join compensation c
on aaw.ID  = c.ID 
left join reasons r on 
aaw.`Reason for absence`  = r.`Number` ;


-- find the healthiest employee for bonus 

select * from absenteeism_at_work 
where `Social drinker` = 0 and `Social drinker` = 0 
and 
`Body mass index` < 25 
and 
`Absenteeism time in hours` < (select AVG(`Absenteeism time in hours`) from absenteeism_at_work aaw)


-- find the compensation rate increase for "healthy" i.e, non-smokers , budget 983,221 so  0.68 incerease per hour / 1414.4 per year

select count(*) as nonsmokers from  absenteeism_at_work where `Social smoker` = 0


-- Avoiding the duplicate cloumn for further Visualization in Power BI

select 
aaw.ID,
r.Reason,
`Month of absence`,
`Body mass index`,

case when `Body mass index`  < 18 then 'underweight'
	 when `Body mass index` between  18 and 25 then 'healthy weight'
	 when `Body mass index` between 25 and 30 then 'overweight'
	 when `Body mass index`  > 30 then 'obese'
	 else 'Unknown' end as `BMI_Category`,
	 	 

case when `Month of absence` in (12,1,2) then 'winter'
	 when `Month of absence` in (3,4,5) then 'spring'
	 when `Month of absence` in (6,7,8) then 'summer'
	 when `Month of absence` in (9,10,11) then 'fall'
	 else 'Unknown' end as `Season_Names`,

`Reason for absence`,
`Day of the week`,
`Seasons`,
`Transportation expense`,
`Distance from Residence to Work`,
`Service time`,
`Age`,
`Work load Average/day`,
`Hit target`,
`Disciplinary failure`,
`Education`,
`Social drinker`,
`Social smoker`,
`Pet`,
`Weight`,
`Height`,
`Absenteeism time in hours`

	 
from absenteeism_at_work aaw left join compensation c
on aaw.ID  = c.ID 
left join reasons r on 
aaw.`Reason for absence`  = r.`Number` ;




