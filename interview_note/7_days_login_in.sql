select  
    user_id
    ,count(dts) as num 
from  
(
    select 
        user_id
        ,date_sub(log_in_date, rank) as dts  
    from  
    (
        select  
            user_id
            ,log_in date  
            ,row_number() over(partition by user_id order by log_in_date) as rank
        from user_log
    ) as t    
)as a    
group by user_id,dts
having num = 7 