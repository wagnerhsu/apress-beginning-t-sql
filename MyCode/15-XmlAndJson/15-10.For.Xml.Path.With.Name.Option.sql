SELECT TOP (5)
       ProductID "@ProductID",
       Name "Product/ProductName",
       Color "Product/Color"
FROM Production.Product
ORDER BY ProductID
FOR XML PATH('Product');