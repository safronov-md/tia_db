-- INSERT INTO Region
INSERT INTO Region (RegionName) VALUES
    ('North'),
    ('South'),
    ('East'),
    ('West'),
    ('Central'),
    ('Northeast'),
    ('Northwest'),
    ('Southeast'),
    ('Southwest'),
    ('Midwest');

-- INSERT INTO Stores
INSERT INTO Stores (StoreName, RegionID) VALUES
    ('Downtown Electronics', 1),
    ('Fashion Haven', 2),
    ('Home Essentials', 3),
    ('Tech Oasis', 4),
    ('Urban Outlets', 5),
    ('Natures Mart', 6),
    ('Metro Marketplace', 7),
    ('Sunset Superstore', 8),
    ('City Junction Mall', 9),
    ('Green Valley Emporium', 10);

-- INSERT INTO StoreAddress
INSERT INTO StoreAddress (StoreID, City, Street, HouseNumber, PostalCode) VALUES
    (1, 'New York', 'Broadway', '123', '10001'),
    (2, 'Los Angeles', 'Rodeo Drive', '456', '90002'),
    (3, 'Chicago', 'Magnificent Mile', '789', '60603'),
    (4, 'San Francisco', 'Market Street', '101', '94104'),
    (5, 'Miami', 'Ocean Drive', '202', '33109'),
    (6, 'Seattle', 'Pike Place', '303', '98101'),
    (7, 'Dallas', 'Main Street', '404', '75201'),
    (8, 'Atlanta', 'Peachtree Street', '505', '30308'),
    (9, 'Denver', '16th Street', '606', '80202'),
    (10, 'Phoenix', 'Desert Sky Mall', '707', '85035');

-- INSERT INTO Employees
INSERT INTO Employees (EmployeeName, ContactInfo, HireDate, JobTitle, Salary, Status) VALUES
    ('John Doe', 'john.doe@email.com', '2023-01-15', 'Manager', 60000.00, true),
    ('Jane Smith', 'jane.smith@email.com', '2023-02-20', 'Sales Associate', 40000.00, true),
    ('Bob Johnson', 'bob.johnson@email.com', '2023-03-25', 'Cashier', 30000.00, true),
    ('Alice Williams', 'alice.williams@email.com', '2023-04-30', 'Manager', 65000.00, true),
    ('Charlie Brown', 'charlie.brown@email.com', '2023-05-05', 'Sales Associate', 42000.00, true),
    ('Eva Davis', 'eva.davis@email.com', '2023-06-10', 'Cashier', 31000.00, true),
    ('Mike Miller', 'mike.miller@email.com', '2023-07-15', 'Manager', 62000.00, true),
    ('Sara Garcia', 'sara.garcia@email.com', '2023-08-20', 'Sales Associate', 41000.00, true),
    ('David Lee', 'david.lee@email.com', '2023-09-25', 'Cashier', 30500.00, true),
    ('Karen White', 'karen.white@email.com', '2023-10-30', 'Manager', 63000.00, true);

-- INSERT INTO EmployeeStores
INSERT INTO EmployeeStores (EmployeeID, StoreID) VALUES
    (1, 1),
    (2, 2),
    (3, 3),
    (4, 4),
    (5, 5),
    (6, 6),
    (7, 7),
    (8, 8),
    (9, 9),
    (10, 10);

-- INSERT INTO ItemsAndPrices
INSERT INTO ItemsAndPrices (ItemName, ItemCategory, BasePrice, Quantity) VALUES
    ('Smartphone', 'Electronics', 499.99, 100),
    ('Designer Jeans', 'Clothing', 99.99, 150),
    ('Refrigerator', 'Home Appliances', 799.99, 80),
    ('Bestseller Novel', 'Books', 29.99, 200),
    ('Board Game', 'Toys', 49.99, 120),
    ('Laptop', 'Electronics', 1299.99, 90),
    ('Casual T-shirt', 'Clothing', 19.99, 180),
    ('Microwave Oven', 'Home Appliances', 149.99, 100),
    ('Cookbook', 'Books', 14.99, 250),
    ('Action Figure', 'Toys', 29.99, 110);

-- INSERT INTO PriceModifier
INSERT INTO PriceModifier (RegionID, PriceModifier, EffectiveDate) VALUES
    (1, 0.95, '2023-01-01'),
    (2, 1.05, '2023-02-01'),
    (3, 1.10, '2023-03-01'),
    (4, 1.02, '2023-04-01'),
    (5, 0.98, '2023-05-01'),
    (6, 1.15, '2023-06-01'),
    (7, 1.08, '2023-07-01'),
    (8, 1.12, '2023-08-01'),
    (9, 1.03, '2023-09-01'),
    (10, 1.07, '2023-10-01');

-- INSERT INTO SalesTransactions
INSERT INTO SalesTransactions (StoreID, EmployeeID) VALUES
    (1, 1),
    (2, 2),
    (3, 3),
    (4, 4),
    (5, 5),
    (6, 6),
    (7, 7),
    (8, 8),
    (9, 9),
    (10, 10);

-- INSERT INTO SalesDetails
INSERT INTO SalesDetails (TransactionID, ItemID, QuantitySold) VALUES
    (1, 1, 10),
    (2, 2, 5),
    (3, 3, 8),
    (4, 4, 12),
    (5, 5, 15),
    (6, 6, 7),
    (7, 7, 20),
    (8, 8, 10),
    (9, 9, 25),
    (10, 10, 18);
