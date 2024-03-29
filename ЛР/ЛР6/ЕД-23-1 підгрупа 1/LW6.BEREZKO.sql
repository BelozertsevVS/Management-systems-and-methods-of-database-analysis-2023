﻿USE WebStor;
GO
 
SELECT [EMPL_NUM], [NAME], [AGE], [TITLE] FROM [dbo].[SALESREPS]
WHERE AGE > 45
ORDER BY AGE DESC;
GO
 
SELECT DISTINCT [MFR], [PRODUCT] FROM [dbo].[ORDERS]
WHERE [ORDER_DATE] BETWEEN '20080101' AND '20081128';
GO
 
SELECT TOP 1 WITH TIES [REP], COUNT(DISTINCT [ORDER_NUM]) AS Quantity
FROM [dbo].[ORDERS] WHERE [ORDER_DATE] BETWEEN '20080101' AND '20081128'
GROUP BY REP
ORDER BY COUNT(DISTINCT [ORDER_NUM]) DESC;
GO