-- Query 1: Find the total number of items sold on a specific date
SELECT sum(qtysold)
FROM sales, date
WHERE sales.dateid = date.dateid
AND caldate = '2008-01-05';

-- Query 2: Find the top 10 buyers by quantity
SELECT username, total_quantity
FROM
    (SELECT buyerid, sum(qtysold) total_quantity
    FROM sales
    GROUP BY buyerid
    ORDER BY total_quantity desc limit 10) Q, 
    users
WHERE Q.buyerid = userid
ORDER BY Q.total_quantity desc;