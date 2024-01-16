-- regions
create table Region (
    RegionID serial primary key,
    RegionName varchar(255) not null
);

-- stores
create table Stores (
    StoreID serial primary key,
    StoreName varchar(255) not null,
    RegionID int not null,
    foreign key (RegionID) references Region (RegionID)
);

-- store addresses
create table StoreAddress (
    AddressID serial primary key,
    StoreID int unique not null,
	City varchar(255) not null,
    Street varchar(255) not null,
    HouseNumber varchar(50) not null,
    PostalCode varchar(20) not null,
    foreign key (StoreID) references Stores (StoreID)
);

-- employees (+ new details)
create table Employees (
    EmployeeID serial primary key,
    EmployeeName varchar(255) not null,
    ContactInfo varchar(255),
    HireDate date,
    JobTitle varchar(255),
    Salary decimal(10, 2),
    Status boolean not null default true -- True for 'Active', False for 'Disabled'
);

-- employee & stores; if one employee works in multiple stores
create table EmployeeStores (
    EmployeeID int not null,
    StoreID int not null,
    primary key (EmployeeID, StoreID),
    foreign key (EmployeeID) references Employees (EmployeeID),
    foreign key (StoreID) references Stores (StoreID)
);

-- prices and items with item category
create table ItemsAndPrices (
    ItemID serial primary key,
    ItemName varchar(255) not null,
    ItemCategory varchar(255) not null,
    BasePrice decimal(10, 2) not null,
    Quantity int not null default 0
);

-- price modifier w/ timestamp
create table PriceModifier (
    ModifierID serial primary key,
    RegionID int not null,
    PriceModifier decimal(5, 2) not null,
    EffectiveDate timestamp not null default current_timestamp,
    foreign key (RegionID) references Region (RegionID)
);

-- sales transactions
create table SalesTransactions (
    TransactionID serial primary key,
    StoreID int not null,
    EmployeeID int not null,
    TransactionDate timestamp not null default current_timestamp,
    foreign key (StoreID) references Stores (StoreID),
    foreign key (EmployeeID) references Employees (EmployeeID)
);

-- sales details w/o priceperitem
create table SalesDetails (
    SalesDetailID serial primary key,
    TransactionID int not null,
    ItemID int not null,
    QuantitySold int not null,
    foreign key (TransactionID) references SalesTransactions (TransactionID),
    foreign key (ItemID) references ItemsAndPrices(ItemID)
);

-- SalesReport view
create view SalesReport as
select
    st.TransactionID as transaction_id,
    s.StoreName as store_name,
    r.RegionName as region_name,
    i.ItemName as item_name,
    sd.QuantitySold as quantity_sold,
    i.BasePrice as base_price,
    COALESCE(pm.PriceModifier, 0) as price_modifier,
    (i.BasePrice + (i.BasePrice * COALESCE(pm.PriceModifier, 0) / 100)) as modified_price_per_item,
    ((i.BasePrice + (i.BasePrice * COALESCE(pm.PriceModifier, 0) / 100)) * sd.QuantitySold) as total_sale
from
    SalesTransactions st
join 
    Stores s on st.StoreID = s.StoreID
join
    Region r on s.RegionID = r.RegionID
join
    SalesDetails sd on st.TransactionID = sd.TransactionID
join
    ItemsAndPrices i on sd.ItemID = i.ItemID
left join
    PriceModifier pm on r.RegionID = pm.RegionID and st.TransactionDate >= pm.EffectiveDate
order by 
    st.TransactionDate;