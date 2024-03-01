CREATE DATABASE RentDataBase;

USE RentDataBase;

-- Create table "user"
CREATE TABLE Client (
    ID_Client INT PRIMARY KEY IDENTITY(1,1),
    Email VARCHAR(255) CONSTRAINT CHK_Email CHECK (Email LIKE '%_@_%._%'),
    Phone_number VARCHAR(20) CONSTRAINT CHK_PhoneNumber CHECK (Phone_number LIKE '[0-9]%' AND LEN(Phone_number) >= 10 AND LEN(Phone_number) <= 20),
    Birth_date DATE,
    First_name VARCHAR(50),
    Last_name VARCHAR(50),
    Middle_name VARCHAR(50),
    Registration_date DATETIME,
    Type_client BIT,
    PasswordHash VARCHAR(MAX), 
	Photo VARCHAR(MAX) null,

);
select * from Client;

--ALTER TABLE Client
--ADD Role NVARCHAR(50) DEFAULT 'User';
ALTER TABLE Client
ALTER COLUMN Photo VARCHAR(100);


-- Create table "country"
CREATE TABLE Сountry (
    ID_Сountry INT PRIMARY KEY IDENTITY(1,1),
    Name_country VARCHAR(255)
);

-- Create table "region"
CREATE TABLE Region (
    ID_Region INT PRIMARY KEY IDENTITY(1,1),
    Сountry_ID INT,
    name VARCHAR(255),
    FOREIGN KEY (Сountry_ID) REFERENCES Сountry(ID_Сountry)
);

-- Create table "city"
CREATE TABLE City (
    ID_City INT PRIMARY KEY IDENTITY(1,1),
    Region_ID INT,
    name VARCHAR(255),
    FOREIGN KEY (Region_ID) REFERENCES Region(ID_Region)
);

-- Create table "category"
CREATE TABLE Category (
    ID_Category INT PRIMARY KEY IDENTITY(1,1),
    Category_name VARCHAR(255),
	Photopath varchar(255)
);

CREATE TABLE Parametrs (
    ID_Parametrs INT PRIMARY KEY IDENTITY(1,1),
    ParametrName VARCHAR(255),
	Category_ID int,
	FOREIGN KEY (Category_ID) REFERENCES Category(ID_Category)
);

CREATE TABLE AtributsParams (
    ID_AtributsParams INT PRIMARY KEY IDENTITY(1,1),
    AtributsParamsName VARCHAR(255),
	Parametrs_ID int,
	FOREIGN KEY (Parametrs_ID) REFERENCES Parametrs(ID_Parametrs)
);

-- ALTER TABLE Category
-- ADD Photopath VARCHAR(255);


-- Create table "product"
CREATE TABLE Product (
    ID_Product INT PRIMARY KEY IDENTITY(1,1),
    Name_product VARCHAR(255),
    Latitude DECIMAL(18,15) CHECK (Latitude >= -90.000000000000000 AND Latitude <= 90.000000000000000),
    Longitude DECIMAL(18,15) CHECK (Longitude >= -180.000000000000000 AND Longitude <= 180.000000000000000),
    Descriptions TEXT,
    Statuss BIT,
    Category_ID INT,
    City_ID INT,
    Client_ID INT,
    FOREIGN KEY (City_ID) REFERENCES City(ID_City),
    FOREIGN KEY (Client_ID) REFERENCES Client(ID_Client),
    FOREIGN KEY (Category_ID) REFERENCES Category(ID_Category)
);
--[55.729881288475845,37.52656344372563]

-- Create table "booking_price"
CREATE TABLE Booking_price (
    ID_Booking_price INT PRIMARY KEY IDENTITY(1,1),
    Product_ID INT,
    Hourly_time INT CHECK (Hourly_time >= 1 AND Hourly_time <= 24),
    Daily_time INT CHECK (Daily_time >= 1 AND Daily_time <= 30),
    Price DECIMAL(10,2),
    FOREIGN KEY (Product_ID) REFERENCES Product(ID_Product)
);


-- Create table "booking"
CREATE TABLE Booking (
    ID_Booking INT PRIMARY KEY IDENTITY(1,1),
    Startdate DATETIME,
    Enddate DATETIME,
    Booking_price_ID INT,
    Client_ID INT,
	FOREIGN KEY (Client_ID) REFERENCES Client(ID_Client),
	FOREIGN KEY (Booking_price_ID) REFERENCES Booking_price(ID_Booking_price)
);

-- Create table "photo"
CREATE TABLE Photo (
    ID_Photo INT PRIMARY KEY IDENTITY(1,1),
    Photo varchar(100),
    Product_ID INT,
	FOREIGN KEY (Product_ID) REFERENCES Product(ID_Product)
);
ALTER TABLE Photo
ALTER COLUMN Photo VARCHAR(max);

-- Create table "chat"
CREATE TABLE Chat (
    ID_Chat INT PRIMARY KEY IDENTITY(1,1),
    Sender_user_ID INT,
    Receiver_user_ID INT,
	FOREIGN KEY (Sender_user_ID) REFERENCES Client(ID_Client),
	FOREIGN KEY (Receiver_user_ID) REFERENCES Client(ID_Client)
);

-- Create table "message"
CREATE TABLE Mesages (
    ID_Mesages INT PRIMARY KEY IDENTITY(1,1),
    Chat_ID INT,
    Mesage TEXT,
    Send_date DATETIME,
    Status_ID VARCHAR(20),
	Sender_user_ID INT
	FOREIGN KEY (Chat_ID) REFERENCES Chat(ID_Chat),
	FOREIGN KEY (Sender_user_ID) REFERENCES Client(ID_Client),

);

-- Create table "status message"
CREATE TABLE Status_message (
    ID_Status_message INT PRIMARY KEY IDENTITY(1,1),
    Name_status VARCHAR(20),

);

INSERT INTO Client (Email, Phone_number, Birth_date, First_name, Last_name, Middle_name, Registration_date, Type_client, PasswordHash)
VALUES ('nikitossa123@mail.com', '89255909828', '07.06.2004', 'Nikita', 'Sergeev', 'Alexandrovich', '29.01.2024', 0, 'nik070604');




INSERT INTO Сountry (Name_country) VALUES ('Россия');
INSERT INTO Сountry (Name_country) VALUES ('США');
INSERT INTO Сountry (Name_country) VALUES ('Китай');
INSERT INTO Сountry (Name_country) VALUES ('Япония');
INSERT INTO Сountry (Name_country) VALUES ('Индия');

-- Insert data into "region" table
INSERT INTO Region (Сountry_ID, name) VALUES (1, 'Московская область');
INSERT INTO Region (Сountry_ID, name) VALUES (1, 'Ленинградская область');
INSERT INTO Region (Сountry_ID, name) VALUES (1, 'Краснодарский край');
INSERT INTO Region (Сountry_ID, name) VALUES (2, 'Калифорния');
INSERT INTO Region (Сountry_ID, name) VALUES (2, 'Техас');
INSERT INTO Region (Сountry_ID, name) VALUES (2, 'Флорида');
INSERT INTO Region (Сountry_ID, name) VALUES (3, 'Пекин');
INSERT INTO Region (Сountry_ID, name) VALUES (3, 'Шанхай');
INSERT INTO Region (Сountry_ID, name) VALUES (3, 'Гуанчжоу');
INSERT INTO Region (Сountry_ID, name) VALUES (4, 'Токио');
INSERT INTO Region (Сountry_ID, name) VALUES (4, 'Осака');
INSERT INTO Region (Сountry_ID, name) VALUES (4, 'Киото');
INSERT INTO Region (Сountry_ID, name) VALUES (5, 'Дели');
INSERT INTO Region (Сountry_ID, name) VALUES (5, 'Мумбаи');
INSERT INTO Region (Сountry_ID, name) VALUES (5, 'Бангалор');

Select * from Region;

-- Insert data into "city" table
INSERT INTO City (Region_ID, name) VALUES (1, 'Москва');
INSERT INTO City (Region_ID, name) VALUES (1, 'Санкт-Петербург');
INSERT INTO City (Region_ID, name) VALUES (1, 'Краснодар');
INSERT INTO City (Region_ID, name) VALUES (2, 'Лос-Анджелес');
INSERT INTO City (Region_ID, name) VALUES (2, 'Хьюстон');
INSERT INTO City (Region_ID, name) VALUES (2, 'Майами');
INSERT INTO City (Region_ID, name) VALUES (3, 'Пекин');
INSERT INTO City (Region_ID, name) VALUES (3, 'Шанхай');
INSERT INTO City (Region_ID, name) VALUES (3, 'Гуанчжоу');
INSERT INTO City (Region_ID, name) VALUES (4, 'Токио');
INSERT INTO City (Region_ID, name) VALUES (4, 'Осака');
INSERT INTO City (Region_ID, name) VALUES (4, 'Киото');
INSERT INTO City (Region_ID, name) VALUES (5, 'Дели');
INSERT INTO City (Region_ID, name) VALUES (5, 'Мумбаи');
INSERT INTO City (Region_ID, name) VALUES (5, 'Бангалор');

select * from City;


-- Insert data into "category" table
INSERT INTO Category (Category_name) VALUES ('Электроника');
INSERT INTO Category (Category_name) VALUES ('Одежда');
INSERT INTO Category (Category_name) VALUES ('Мебель');
INSERT INTO Category (Category_name) VALUES ('Автомобили');
INSERT INTO Category (Category_name) VALUES ('Недвижимость');
	INSERT INTO Category (Category_name, Photopath)
VALUES
('Бытовая техника', 'images/category/appliances.jpg'),
('Электроника', 'images/category/electronics.jpg'),
('Мебель', 'images/category/furniture.jpg'),
('Одежда и обувь', 'images/category/clothes_and_shoes.jpg'),
('Спорт и отдых', 'images/category/sports_and_recreation.jpg'),
('Инструменты', 'images/category/tools.jpg'),
('Автомобили', 'images/category/cars.jpg'),
('Недвижимость', 'images/category/real_estate.jpg'),
('Услуги', 'images/category/services.jpg');

Select * from Parametrs;
Select * from Category;
-- Вставка данных в таблицу Parametrs
INSERT INTO Parametrs (ParametrName, Category_ID)
VALUES
('Производитель', 1),
('Модель', 1),
('Год выпуска', 1),
('Состояние', 1),
('Цена', 1),

('Производитель', 2),
('Модель', 2),
('Год выпуска', 2),
('Состояние', 2),
('Цена', 2),

('Тип мебели', 3),
('Материал', 3),
('Цвет', 3),
('Размер', 3),
('Цена', 3),

('Тип одежды', 4),
('Размер', 4),
('Цвет', 4),
('Материал', 4),
('Цена', 4),

('Тип спорта', 5),
('Для какого пола', 5),
('Возрастная группа', 5),
('Цена', 5),

('Тип инструмента', 6),
('Производитель', 6),
('Модель', 6),
('Цена', 6),

('Марка', 7),
('Модель', 7),
('Год выпуска', 7),
('Пробег', 7),
('Цена', 7),

('Тип недвижимости', 8),
('Площадь', 8),
('Количество комнат', 8),
('Этаж', 8),
('Цена', 8),

('Тип услуги', 9),
('Для кого', 9),
('Цена', 9);


-- Вставка данных в таблицу AtributsParams
INSERT INTO AtributsParams (AtributsParamsName, Parametrs_ID)
VALUES
('Samsung', 1),
('LG', 1),
('Bosch', 1),
('Siemens', 1),
('Haier', 1),

('Galaxy S22 Ultra', 2),
('iPhone 14 Pro Max', 2),
('Pixel 7 Pro', 2),
('OnePlus 11', 2),
('Xiaomi 13 Pro', 2),

('2023', 3),
('2022', 3),
('2021', 3),
('2020', 3),
('2019', 3),

('Новый', 4),
('Б/у', 4),
('Рефурбишед', 4),

('10000', 5),
('20000', 5),
('30000', 5),
('40000', 5),
('50000', 5),

('Apple', 6),
('Samsung', 6),
('Xiaomi', 6),
('Realme', 6),
('OPPO', 6),

('iPhone 14 Pro Max', 7),
('Galaxy S22 Ultra', 7),
('Pixel 7 Pro', 7),
('OnePlus 11', 7),
('Xiaomi 13 Pro', 7),

('2023', 8),
('2022', 8),
('2021', 8),
('2020', 8),
('2019', 8),

('10000', 9),
('20000', 9),
('30000', 9),
('40000', 9),
('50000', 9),

('Кровать', 10),
('Диван', 10),
('Шкаф', 10),
('Комод', 10),
('Стол', 10),

('Дерево', 11),
('МДФ', 11),
('ДСП', 11),
('Металл', 11),
('Пластик', 11),

('Белый', 12),
('Черный', 12),
('Коричневый', 12),
('Серый', 12),
('Красный', 12),

('100x200', 13),
('120x200', 13),
('140x200', 13),
('160x200', 13),
('180x200', 13),

('10000', 14),
('20000', 14),
('30000', 14),
('40000', 14),
('50000', 14),

('Футболка', 15),
('Рубашка', 15),
('Джинсы', 15),
('Юбка', 15),
('Платье', 15),

('S', 16),
('M', 16),
('L', 16),
('XL', 16),
('XXL', 16),

('Белый', 17),
('Черный', 17),
('Серый', 17),
('Красный', 17),
('Синий', 17),

('Хлопок', 18),
('Полиэстер', 18),
('Эластан', 18),
('Лен', 18),
('Шелк', 18),

('1000', 19),
('2000', 19),
('3000', 19),
('4000', 19),
('5000', 19),

('Футбол', 20),
('Баскетбол', 20),
('Волейбол', 20),
('Теннис', 20),
('Хоккей', 20),

('Мужской', 21),
('Женский', 21),
('Детский', 21),

('Взрослый', 22),
('Детский', 22),

('1000', 23),
('2000', 23),
('3000', 23),
('4000', 23),
('5000', 23),

('Молоток', 24),
('Отвертка', 24),
('Гаечный ключ', 24),
('Пила', 24),
('Дрель', 24),

('Stanley', 25),
('Bosch', 25),
('Makita', 25),
('DeWalt', 25),
('Milwaukee', 25),

('Hammer Drill', 26),
('Circular Saw', 26),
('Table Saw', 26),
('Miter Saw', 26),
('Sander', 26),

('1000', 27),
('2000', 27),
('3000', 27),
('4000', 27),
('5000', 27),

('Toyota', 28),
('Honda', 28),
('Nissan', 28),
('Mazda', 28),
('Subaru', 28),

('Camry', 29),
('Accord', 29),
('Altima', 29),
('Mazda3', 29),
('Impreza', 29),

('2023', 30),
('2022', 30),
('2021', 30),
('2020', 30),
('2019', 30),

('10000', 31),
('20000', 31),
('30000', 31),
('40000', 31),
('50000', 31),

('Квартира', 32),
('Дом', 32),
('Офис', 32),
('Магазин', 32),
('Склад', 32),

('100', 33),
('200', 33),
('300', 33),
('400', 33),
('500', 33),

('1', 34),
('2', 34),
('3', 34),
('4', 34),
('5', 34),

('1', 35),
('2', 35),
('3', 35),
('4', 35),
('5', 35),

('10000', 36),
('20000', 36),
('30000', 36),
('40000', 36),
('50000', 36),

('Уборка', 37),
('Ремонт', 37),
('Строительство', 37),
('Переезд', 37),
('Курьерская доставка', 37),

('Частное лицо', 38),
('Компания', 38),

('1000', 39),
('2000', 39),
('3000', 39),
('4000', 39),
('5000', 39);

select * from Category;
select * from Client;
select * from Booking_price;

select * from Product;

-- Insert data into "product" table
INSERT INTO Product (Name_product, Latitude, Longitude, Descriptions, Statuss, Category_ID, City_ID, Client_ID) VALUES ('iPhone 13', 55.729881288475845, 37.52656344372563, 'Новый iPhone 13 с объемом памяти 128 ГБ', 0, 1, 1, 1);
INSERT INTO Product (Name_product, Latitude, Longitude, Descriptions, Statuss, Category_ID, City_ID, Client_ID) VALUES ('Samsung Galaxy S22', 55.729881288475845, 37.52656344372563, 'Новый Samsung Galaxy S22 с объемом памяти 256 ГБ', 0, 1, 1, 1);
INSERT INTO Product (Name_product, Latitude, Longitude, Descriptions, Statuss, Category_ID, City_ID, Client_ID) VALUES ('Xiaomi Redmi Note 11', 55.729881288475845, 37.52656344372563, 'Новый Xiaomi Redmi Note 11 с объемом памяти 128 ГБ', 0, 1, 1, 1);
INSERT INTO Product (Name_product, Latitude, Longitude, Descriptions, Statuss, Category_ID, City_ID, Client_ID) VALUES ('Платье Zara', 55.729881288475845, 37.52656344372563, 'Новое платье Zara размера M', 0, 1, 1, 1);
INSERT INTO Product (Name_product, Latitude, Longitude, Descriptions, Statuss, Category_ID, City_ID, Client_ID) VALUES ('Куртка H&M', 55.729881288475845, 37.52656344372563, 'Новая куртка H&M размера L', 0, 1, 1, 1);
INSERT INTO Product (Name_product, Latitude, Longitude, Descriptions, Statuss, Category_ID, City_ID, Client_ID) VALUES ('Диван IKEA', 55.729881288475845, 37.52656344372563, 'Новый диван IKEA', 0, 1, 1, 1);
INSERT INTO Product (Name_product, Latitude, Longitude, Descriptions, Statuss, Category_ID, City_ID, Client_ID) VALUES ('Кровать Hoff', 55.729881288475845, 37.52656344372563, 'Новая кровать Hoff', 0, 1, 1, 1);
INSERT INTO Product (Name_product, Latitude, Longitude, Descriptions, Statuss, Category_ID, City_ID, Client_ID) VALUES ('Автомобиль Toyota Camry', 55.729881288475845, 37.52656344372563, 'Новый автомобиль Toyota Camry', 0, 1, 1, 1);
INSERT INTO Product (Name_product, Latitude, Longitude, Descriptions, Statuss, Category_ID, City_ID, Client_ID) VALUES ('Автомобиль BMW X5', 55.729881288475845, 37.52656344372563, 'Новый автомобиль BMW X5', 0, 1, 1, 1);
INSERT INTO Product (Name_product, Latitude, Longitude, Descriptions, Statuss, Category_ID, City_ID, Client_ID) VALUES ('Квартира в центре Москвы', 55.729881288475845, 37.52656344372563, 'Новая квартира в центре Москвы', 0, 1, 1, 1);
INSERT INTO Product (Name_product, Latitude, Longitude, Descriptions, Statuss, Category_ID, City_ID, Client_ID) VALUES ('Дом в Подмосковье', 55.729881288475845, 37.52656344372563, 'Новый дом в Подмосковье', 0, 1, 1, 1);

-- Insert data into "booking_price" table
INSERT INTO Booking_price (Product_ID, Hourly_time, Daily_time, Price) VALUES (1, 1, 24, 1000);
INSERT INTO Booking_price (Product_ID, Hourly_time, Daily_time, Price) VALUES (2, 1, 24, 1200);
INSERT INTO Booking_price (Product_ID, Hourly_time, Daily_time, Price) VALUES (3, 1, 24, 800);
INSERT INTO Booking_price (Product_ID, Hourly_time, Daily_time, Price) VALUES (4, 1, 24, 500);
INSERT INTO Booking_price (Product_ID, Hourly_time, Daily_time, Price) VALUES (5, 1, 24, 600);
INSERT INTO Booking_price (Product_ID, Hourly_time, Daily_time, Price) VALUES (6, 1, 24, 700);
INSERT INTO Booking_price (Product_ID, Hourly_time, Daily_time, Price) VALUES (7, 1, 24, 800);
INSERT INTO Booking_price (Product_ID, Hourly_time, Daily_time, Price) VALUES (8, 1, 24, 1000);
INSERT INTO Booking_price (Product_ID, Hourly_time, Daily_time, Price) VALUES (9, 1, 24, 1200);
INSERT INTO Booking_price (Product_ID, Hourly_time, Daily_time, Price) VALUES (10, 1, 24, 1500);
INSERT INTO Booking_price (Product_ID, Hourly_time, Daily_time, Price) VALUES (11, 1, 24, 2000);

-- Insert data into "booking" table
INSERT INTO Booking (Startdate, Enddate, Booking_price_ID, Client_ID) VALUES ('2023-03-08 10:00:00', '2023-03-08 12:00:00', 1, 1);
INSERT INTO Booking (Startdate, Enddate, Booking_price_ID, Client_ID) VALUES ('2023-03-09 10:00:00', '2023-03-09 12:00:00', 2, 1);
INSERT INTO Booking (Startdate, Enddate, Booking_price_ID, Client_ID) VALUES ('2023-03-10 10:00:00', '2023-03-10 12:00:00', 3, 1);

-- Insert data into "photo" table
INSERT INTO Photo (Photo, Product_ID) VALUES (0x1234567890ABCDEF, 1);
INSERT INTO Photo (Photo, Product_ID) VALUES (0x1234567890ABCDEF, 2);
INSERT INTO Photo (Photo, Product_ID) VALUES (0x1234567890ABCDEF, 3);
INSERT INTO Photo (Photo, Product_ID) VALUES (0x1234567890ABCDEF, 4);
INSERT INTO Photo (Photo, Product_ID) VALUES (0x1234567890ABCDEF, 5);
INSERT INTO Photo (Photo, Product_ID) VALUES (0x1234567890ABCDEF, 6);
INSERT INTO Photo (Photo, Product_ID) VALUES (0x1234567890ABCDEF, 7);
INSERT INTO Photo (Photo, Product_ID) VALUES (0x1234567890ABCDEF, 8);
INSERT INTO Photo (Photo, Product_ID) VALUES (0x1234567890ABCDEF, 9);
INSERT INTO Photo (Photo, Product_ID) VALUES (0x1234567890ABCDEF, 10);
INSERT INTO Photo (Photo, Product_ID) VALUES (0x1234567890ABCDEF, 11);

-- Insert data into "chat" table
INSERT INTO Chat (Sender_user_ID, Receiver_user_ID) VALUES (1, 2);
INSERT INTO Chat (Sender_user_ID, Receiver_user_ID) VALUES (2, 1);
INSERT INTO Chat (Sender_user_ID, Receiver_user_ID) VALUES (1, 3);
INSERT INTO Chat (Sender_user_ID, Receiver_user_ID) VALUES (3, 1);

-- Insert data into "message" table
INSERT INTO Mesages (Chat_ID, Mesage, Send_date, Status_ID, Sender_user_ID) VALUES (1, 'Привет!', '2023-03-08 10:00:00', 'sent', 1);






UPDATE Category
SET Photopath = 'assets/images/appliances.jpg'
WHERE ID_Category = 1;
UPDATE Category
SET Photopath = 'assets/images/electronics.jpg'
WHERE ID_Category = 2;
UPDATE Category
SET Photopath = 'assets/images/furniture.jpg'
WHERE ID_Category = 3;
UPDATE Category
SET Photopath = 'assets/images/clothes_and_shoes.jpg'
WHERE ID_Category = 4;
UPDATE Category
SET Photopath = 'assets/images/sports_and_recreation.jpg'
WHERE ID_Category = 5;
UPDATE Category
SET Photopath = 'assets/images/tools.jpg'
WHERE ID_Category = 6;
UPDATE Category
SET Photopath = 'assets/images/cars.jpg'
WHERE ID_Category = 7;
UPDATE Category
SET Photopath = 'assets/images/real_estate.jpg'
WHERE ID_Category = 8;
UPDATE Category
SET Photopath = 'assets/images/real_servicesestate.jpg'
WHERE ID_Category = 9;



-- Удаляем категории с id больше 9
DELETE FROM Category WHERE ID_Category > 9;

-- Обновляем данные категорий с id от 1 до 9
UPDATE Category
SET Category_name = CASE
    WHEN ID_Category = 1 THEN 'Бытовая техника'
    WHEN ID_Category = 2 THEN 'Электроника'
    WHEN ID_Category = 3 THEN 'Мебель'
    WHEN ID_Category = 4 THEN 'Одежда и обувь'
    WHEN ID_Category = 5 THEN 'Спорт и отдых'
    WHEN ID_Category = 6 THEN 'Инструменты'
    WHEN ID_Category = 7 THEN 'Автомобили'
    WHEN ID_Category = 8 THEN 'Недвижимость'
    WHEN ID_Category = 9 THEN 'Услуги'
    ELSE Category_name
    END,
    Photopath = CASE
    WHEN ID_Category = 1 THEN 'assets/images/appliances.jpg'
    WHEN ID_Category = 2 THEN 'assets/images/electronics.jpg'
    WHEN ID_Category = 3 THEN 'assets/images/furniture.jpg'
    WHEN ID_Category = 4 THEN 'assets/images/clothes_and_shoes.jpg'
    WHEN ID_Category = 5 THEN 'assets/images/sports_and_recreation.jpg'
    WHEN ID_Category = 6 THEN 'assets/images/tools.jpeg'
    WHEN ID_Category = 7 THEN 'assets/images/cars.jpg'
    WHEN ID_Category = 8 THEN 'assets/images/real_estate.jpg'
    WHEN ID_Category = 9 THEN 'assets/images/services.jpg'
    ELSE Photopath
    END
WHERE ID_Category BETWEEN 1 AND 9;

-- Выводим данные из таблицы Category для проверки
SELECT * FROM Category;

INSERT INTO Product (Name_product, Latitude, Longitude, Descriptions, Statuss, Category_ID, City_ID, Client_ID) VALUES ('Холодильник Samsung', 55.729881288475845, 37.52656344372563, 'Новый холодильник Samsung с объемом 300 литров', 0, 1, 1, 1);
INSERT INTO Product (Name_product, Latitude, Longitude, Descriptions, Statuss, Category_ID, City_ID, Client_ID) VALUES ('Стиральная машина LG', 55.729881288475845, 37.52656344372563, 'Новая стиральная машина LG с загрузкой 7 кг', 0, 1, 1, 1);
INSERT INTO Product (Name_product, Latitude, Longitude, Descriptions, Statuss, Category_ID, City_ID, Client_ID) VALUES ('Телевизор Sony', 55.729881288475845, 37.52656344372563, 'Новый телевизор Sony с диагональю 55 дюймов', 0, 2, 1, 1);
INSERT INTO Product (Name_product, Latitude, Longitude, Descriptions, Statuss, Category_ID, City_ID, Client_ID) VALUES ('Ноутбук HP', 55.729881288475845, 37.52656344372563, 'Новый ноутбук HP с процессором Intel Core i5', 0, 2, 1, 1);
INSERT INTO Product (Name_product, Latitude, Longitude, Descriptions, Statuss, Category_ID, City_ID, Client_ID) VALUES ('Диван IKEA', 55.729881288475845, 37.52656344372563, 'Новый диван IKEA с обивкой из ткани', 0, 3, 1, 1);
INSERT INTO Product (Name_product, Latitude, Longitude, Descriptions, Statuss, Category_ID, City_ID, Client_ID) VALUES ('Кровать Hoff', 55.729881288475845, 37.52656344372563, 'Новая кровать Hoff с размерами 160x200 см', 0, 3, 1, 1);
INSERT INTO Product (Name_product, Latitude, Longitude, Descriptions, Statuss, Category_ID, City_ID, Client_ID) VALUES ('Платье Zara', 55.729881288475845, 37.52656344372563, 'Новое платье Zara размера M', 0, 4, 1, 1);
INSERT INTO Product (Name_product, Latitude, Longitude, Descriptions, Statuss, Category_ID, City_ID, Client_ID) VALUES ('Кроссовки Nike', 55.729881288475845, 37.52656344372563, 'Новые кроссовки Nike размера 42', 0, 4, 1, 1);
INSERT INTO Product (Name_product, Latitude, Longitude, Descriptions, Statuss, Category_ID, City_ID, Client_ID) VALUES ('Велосипед Stels', 55.729881288475845, 37.52656344372563, 'Новый велосипед Stels с диаметром колес 26 дюймов', 0, 5, 1, 1);
INSERT INTO Product (Name_product, Latitude, Longitude, Descriptions, Statuss, Category_ID, City_ID, Client_ID) VALUES ('Лыжи Fischer', 55.729881288475845, 37.52656344372563, 'Новые лыжи Fischer длиной 170 см', 0, 5, 1, 1);
INSERT INTO Product (Name_product, Latitude, Longitude, Descriptions, Statuss, Category_ID, City_ID, Client_ID) VALUES ('Автомобиль Toyota Camry', 55.729881288475845, 37.52656344372563, 'Новый автомобиль Toyota Camry 2023 года выпуска', 0, 7, 1, 1);
INSERT INTO Product (Name_product, Latitude, Longitude, Descriptions, Statuss, Category_ID, City_ID, Client_ID) VALUES ('Автомобиль BMW X5', 55.729881288475845, 37.52656344372563, 'Новый автомобиль BMW X5 2022 года выпуска', 0, 7, 1, 1);
INSERT INTO Product (Name_product, Latitude, Longitude, Descriptions, Statuss, Category_ID, City_ID, Client_ID) VALUES ('Дрель Bosch', 55.729881288475845, 37.52656344372563, 'Новая дрель Bosch с мощностью 800 Вт', 0, 6, 1, 1);
INSERT INTO Product (Name_product, Latitude, Longitude, Descriptions, Statuss, Category_ID, City_ID, Client_ID) VALUES ('Набор инструментов Stanley', 55.729881288475845, 37.52656344372563, 'Новый набор инструментов Stanley с 10 предметами', 0, 6, 1, 1);
INSERT INTO Product (Name_product, Latitude, Longitude, Descriptions, Statuss, Category_ID, City_ID, Client_ID) VALUES ('Платье Zara', 55.729881288475845, 37.52656344372563, 'Новое платье Zara размера M', 0, 4, 1, 1);
INSERT INTO Product (Name_product, Latitude, Longitude, Descriptions, Statuss, Category_ID, City_ID, Client_ID) VALUES ('Кроссовки Nike', 55.729881288475845, 37.52656344372563, 'Новые кроссовки Nike размера 42', 0, 4, 1, 1);
INSERT INTO Product (Name_product, Latitude, Longitude, Descriptions, Statuss, Category_ID, City_ID, Client_ID) VALUES ('Квартира в центре Москвы', 55.729881288475845, 37.52656344372563, 'Новая квартира в центре Москвы площадью 100 кв.м.', 0, 8, 1, 1);
INSERT INTO Product (Name_product, Latitude, Longitude, Descriptions, Statuss, Category_ID, City_ID, Client_ID) VALUES ('Дом в Подмосковье', 55.729881288475845, 37.52656344372563, 'Новый дом в Подмосковье площадью 200 кв.м.', 0, 8, 1, 1);
INSERT INTO Product (Name_product, Latitude, Longitude, Descriptions, Statuss, Category_ID, City_ID, Client_ID) VALUES ('Услуги ремонта квартир', 55.729881288475845, 37.52656344372563, 'Услуги ремонта квартир под ключ', 0, 9, 1, 1);
INSERT INTO Product (Name_product, Latitude, Longitude, Descriptions, Statuss, Category_ID, City_ID, Client_ID) VALUES ('Услуги по уборке квартир', 55.729881288475845, 37.52656344372563, 'Услуги по уборке квартир на регулярной основе', 0, 9, 1, 1);

4 6 7 8 9 10 11 18 19 

DELETE FROM Product
WHERE ID_Product = 4;


UPDATE Photo
SET Photo = 0x1234567890ABCDEF
WHERE Product_ID = 1;


1	Бытовая техника
2	Электроника
3	Мебель
4	Одежда и обувь
5	Спорт и отдых
6	Инструменты
7	Автомобили
8	Недвижимость
9	Услуги

1  2
2  2
3  2 
4  4
5  4
6  3
7  3
8  7
9  7
10 8
11 8
12 1
13 1


    UPDATE Product
SET Category_ID = CASE
    WHEN ID_Product = 14 THEN 2  -- Телевизор Sony
    WHEN ID_Product = 15 THEN 2  -- Ноутбук HP
    WHEN ID_Product = 19 THEN 4  -- Кроссовки Nike
    WHEN ID_Product = 20 THEN 5  -- Велосипед Stels
    WHEN ID_Product = 21 THEN 5  -- Лыжи Fischer
    WHEN ID_Product = 24 THEN 6  -- Дрель Bosch
    WHEN ID_Product = 25 THEN 6  -- Набор инструментов Stanley
    WHEN ID_Product = 30 THEN 9  -- Услуги ремонта квартир
    WHEN ID_Product = 31 THEN 9  -- Услуги по уборке квартир
    ELSE Category_ID  -- Сохранить существующее значение Category_ID для всех остальных продуктов
END;

DELETE FROM Product
WHERE ID_Product IN (16, 17, 18, 22, 23, 26, 27, 28, 29);

select * from Photo

INSERT INTO Photo (Photo, Product_ID)
VALUES
('https://firebasestorage.googleapis.com/v0/b/rentapp-f1866.appspot.com/o/domvpodmoskov.jpg?alt=media&token=a8e71d0f-6533-4c43-9339-ec27a891a1ea', 11),
('https://firebasestorage.googleapis.com/v0/b/rentapp-f1866.appspot.com/o/holodilniksamsung.jpg?alt=media&token=acdeaee8-29ee-4ff3-ad97-79d12fa3c2c1', 12),
('https://firebasestorage.googleapis.com/v0/b/rentapp-f1866.appspot.com/o/staralnaymashina.jpg?alt=media&token=8166fa8d-9451-4f7b-a73a-6d9c37ab462f', 13),
('https://firebasestorage.googleapis.com/v0/b/rentapp-f1866.appspot.com/o/televizorsony.jpg?alt=media&token=0e1b3a53-8b45-4e5e-a52c-dd4e429cd95b', 14),
('https://firebasestorage.googleapis.com/v0/b/rentapp-f1866.appspot.com/o/noutbokhp.jpg?alt=media&token=ea079a61-431b-4b91-988f-d3b23c408413', 15),
('https://firebasestorage.googleapis.com/v0/b/rentapp-f1866.appspot.com/o/krosovkiNike.jpg?alt=media&token=6a0e36e9-1ece-4e03-b006-47e7931f4fa7', 19),
('https://firebasestorage.googleapis.com/v0/b/rentapp-f1866.appspot.com/o/velosipedStels.jpg?alt=media&token=5f5ac05e-df29-4fe7-b207-551811ee3578', 20),
('https://firebasestorage.googleapis.com/v0/b/rentapp-f1866.appspot.com/o/lugiFisher.jpg?alt=media&token=f40337a3-6adb-4f69-8e6f-4575e659cc8b', 21),
('https://firebasestorage.googleapis.com/v0/b/rentapp-f1866.appspot.com/o/drelBosch.jpg?alt=media&token=7f703ca1-698d-47e8-8415-0968f62a394d', 24),
('https://firebasestorage.googleapis.com/v0/b/rentapp-f1866.appspot.com/o/naborinstrumentovStanley.jpg?alt=media&token=eb7866fc-a53c-4f76-abf1-2d88a0505947', 25),
('https://firebasestorage.googleapis.com/v0/b/rentapp-f1866.appspot.com/o/kvartiravcentremoskow.jpg?alt=media&token=22414cbb-2639-4d06-a940-7dff5162ab63', 30),
('https://firebasestorage.googleapis.com/v0/b/rentapp-f1866.appspot.com/o/uborka-kvartir-i-ofisov.jpg?alt=media&token=77acaed0-543d-45d9-98f7-9d0dbb270a5d', 31)
go


12	Холодильник Samsung
13	Стиральная машина LG
14	Телевизор Sony
15	Ноутбук HP
19	Кроссовки Nike
20	Велосипед Stels
21	Лыжи Fischer
24	Дрель Bosch
25	Набор инструментов Stanley
30	Услуги ремонта квартир
31	Услуги по уборке квартир
1	iPhone 13
2	Samsung Galaxy S22
3	Xiaomi Redmi Note 11
4	Платье Zara
5	Куртка H&M
6	Диван IKEA
7	Кровать Hoff
8	Автомобиль Toyota Camry
9	Автомобиль BMW X5
10	Квартира в центре Москвы
11	Дом в Подмосковье