SELECT avg(todo) as prom FROM
(SELECT sum(Quantity*UnitPrice) as todo from invoice_items
GROUP by InvoiceId)

--Calcular el promedio de lo que gastan los usuarios en el sistema