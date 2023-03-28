select  
    distinct user_id  
from
(
    select  
        *,rk_1- rank_2 as diff
    from   
    (
        select *
            ,row_nmuber() over(order by click_time) as rk1
            ,row_namber() over(patiton by user_id order by click_time) as rk2
        from a    
    ) as b
) as c
group by diff,user_id
having count(diff) >=3