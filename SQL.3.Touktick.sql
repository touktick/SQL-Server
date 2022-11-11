CREATE SCHEMA procurement;
GO

CREATE TABLE procurement.purchase_orders(
    order_id INT PRIMARY KEY,
    vendor_id INT NOT NULL,
    order_date DATE NOT NULL
);

CREATE SEQUENCE item_counter
AS INT
START WITH 10
INCREMENT BY 10;

SELECT NEXT VALUE FOR item_counter;

CREATE SEQUENCE procurement.order_number
AS INT
START WITH 1
INCREMENT BY 1;

INSERT INTO procurement.purchase_orders(
    order_id,
    vendor_id,
    order_date
)
VALUES(
    NEXT VALUE FOR procurement.order_number,1,'2019-04-30'
);
INSERT INTO procurement.purchase_orders(
    order_id,
    vendor_id,
    order_date
)
VALUES(
    NEXT VALUE FOR procurement.order_number,2,'2019-05-01'
);
INSERT INTO procurement.purchase_orders(
    order_id,
    vendor_id,
    order_date
)
VALUES(
    NEXT VALUE FOR procurement.order_number,3,'2019-05-02'
);
SELECT
    order_id,
    vendor_id,
    order_date
FROM
    procurement.purchase_orders;

CREATE SEQUENCE procurement.receipt_no
START WITH 1
INCREMENT BY 1;

CREATE TABLE procurement.goods_receipts(
    receipt_id INT PRIMARY KEY
        DEFAULT (NEXT VALUE FOR procurement.receipt_no),
    order_id INT NOT NULL,
    full_receipt BIT NOT NULL,
    recepit_date DATE NOT NULL,
    note NVARCHAR(100)
);

CREATE TABLE procurement.invoice_receipts(
    receipt_id   INT PRIMARY KEY
        DEFAULT (NEXT VALUE FOR procurement.receipt_no), 
    order_id INT NOT NULL, 
    is_late BIT NOT NULL,
    receipt_date DATE NOT NULL,
    note NVARCHAR(100)
);