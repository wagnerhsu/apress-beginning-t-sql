--1
DECLARE @hdoc INT;
DECLARE @doc VARCHAR(1000)
    = N'
<Products>
<Product ProductID="32565451" ProductName="Bicycle Pump">
   <Order ProductID="32565451" SalesID="5" OrderDate="2011-07-04T00:00:00">
      <OrderDetail OrderID="10248" CustomerID="22" Quantity="12"/>
      <OrderDetail OrderID="10248" CustomerID="11" Quantity="10"/>
   </Order>
</Product>
<Product ProductID="57841259" ProductName="Bicycle Seat">
   <Order ProductID="57841259" SalesID="3" OrderDate="2011-015-16T00:00:00">
      <OrderDetail OrderID="54127" CustomerID="72" Quantity="3"/>
   </Order>
</Product>
</Products>';

--2
EXEC sp_xml_preparedocument @hdoc OUTPUT, @doc;

--3
SELECT *
FROM
    OPENXML(@hdoc, N'/Products/Product/Order/OrderDetail')
    WITH
    (
        CustomerID INT '@CustomerID',
        ProductID INT '../@ProductID',
        ProductName VARCHAR(30) '../../@ProductName',
        OrderID INT '@OrderID',
        Orderdate VARCHAR(30) '../@OrderDate'
    );

--4
EXEC sp_xml_removedocument @hdoc;