Select sd.state_name, count(1) from enrollment_table et
inner join state_data sd
on (et.fips = sd.state_code)
where et.y='2021'  
group by 1
order by 2 desc limit 10;
