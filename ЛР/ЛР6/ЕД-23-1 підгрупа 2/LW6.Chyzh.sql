﻿--Завдання 1
--Напишіть запит, який поверне список працівників старше 45 років.
--Використовується таблиця [dbo].[SALESREPS]
--Результуючий набір даних містить:ідентифікатор працівника, ім'я працівника, вік, посаду
--Відсортуйте результуючий набір даних за віком (за спаданням)

USE WebStor
GO
SELECT [EMPL_NUM],[NAME], [AGE], [TITLE]
FROM [dbo].[SALESREPS] WHERE AGE>45
ORDER BY AGE DESC;
GO

--Завдання 2
--Напишіть запит, який поверне список унікальних комбінацій значень ідентифікатора виробника (MFR) та ідентифікатора товару (PRODUCT).
--Враховуйте тільки замовлення за 2008 рік.
--Використовується таблиця [dbo].[ORDERS]
--Задійте оператор DISTINCT
--Результуючий набір даних містить: ідентифікатор виробника, ідентифікатор товару

SELECT DISTINCT [MFR],[PRODUCT]
FROM [dbo].[ORDERS] WHERE [ORDER_DATE] BETWEEN '2008-01-01' AND '2008-12-31';
GO

--Завдання 3
--Напишіть запит, який поверне ідентифікатор працівника ([REP]) з найбільшою кількістю проведених замовлень.
--Враховуйте можливість того, що одразу кілька працівників можуть мати однакову кількість проведених замовлень.
--Враховуйте тільки замовлення за 2008 рік.
--Використовується таблиця [dbo].[ORDERS]
--Задійте агрегатну функцію COUNT
--Задійте оператор WITH TIES
--Результуючий набір даних містить: Ідентифікатор працівника, кількість проведених замовлень

SELECT TOP 1 WITH TIES [REP],  COUNT (DISTINCT[ORDER_NUM]) AS Quantity 
FROM [dbo].[ORDERS] WHERE [ORDER_DATE] BETWEEN '2008-01-01' AND '2008-12-31'
GROUP BY REP
ORDER BY  COUNT (DISTINCT[ORDER_NUM]) DESC;
GO