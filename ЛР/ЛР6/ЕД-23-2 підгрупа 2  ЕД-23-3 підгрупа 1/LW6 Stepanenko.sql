Use WebStor
Go

SELECT [EMPL_NUM], [NAME], [AGE], [TITLE]
FROM dbo.SALESREPS
WHERE AGE > 45
ORDER BY [AGE] DESC;

SELECT DISTINCT [MFR], [PRODUCT]
FROM dbo.ORDERS
WHERE ORDER_DATE BETWEEN '20080101' AND '20081231';


SELECT TOP 1 WITH TIES [REP], 
COUNT(DISTINCT AMOUNT) AS [Qty] 
FROM [dbo].[ORDERS]
WHERE [ORDER_DATE] BETWEEN '20080101'AND '20090101'
GROUP BY [REP]
ORDER BY [Qty] ASC



SELECT TOP 1 WITH TIES [REP], 
COUNT(DISTINCT AMOUNT) AS QUANTITY 
FROM [dbo].[ORDERS]
WHERE [ORDER_DATE] BETWEEN '20080101'AND '20090101'
GROUP BY [REP]
ORDER BY COUNT(DISTINCT AMOUNT) DESC
