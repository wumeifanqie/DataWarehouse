select 
    a.deptno
    ,avg(a.salary)
from
(
    select   
        *  
        ,rank() over(partition by deptno order by salary) as rank_1
        ,dank() over(partition by deptno order by salary desc) as rank_2
    from emp
)as a
group by a.deptno
where a.rank_1 >1 and a.rank_2 >1 
