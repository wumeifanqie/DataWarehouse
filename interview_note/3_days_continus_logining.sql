SELECT  user_id
FROM
(SELECT user_id , login_date , rank , date_sub(login_date, interval rank) AS diff
	FROM
	(select user_id, login_date, row_number() over(partition by user_id ORDER BY login_date) AS rank
		FROM TABLE
	) AS t1
	GROUP BY  user_id
	         ,diff
	HAVING COUNT(*) >= 3
) AS t2
