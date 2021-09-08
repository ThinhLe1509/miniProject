
CREATE DATABASE ministoreR2S;
    
USE ministoreR2S;
CREATE TABLE Accounts(
    Username VARCHAR(50) NOT NULL PRIMARY KEY,
    Password VARCHAR(50) NOT NULL,
    Fullname VARCHAR(50) NOT NULL,
    Email VARCHAR(50) NOT NULL,
    Photo VARCHAR(50) NOT NULL
); 

CREATE TABLE  Roles (
     Id   VARCHAR (10) NOT NULL PRIMARY KEY,
     NAME   VARCHAR (50) NOT NULL
   );
   
   CREATE TABLE Categories(
    Id CHAR(4) NOT NULL PRIMARY KEY,
    NAME VARCHAR(50) NOT NULL
); 
   
   CREATE TABLE  Products (
     Id   INT  NOT NULL PRIMARY KEY AUTO_INCREMENT,
     NAME   VARCHAR (50) NOT NULL,
     Image  VARCHAR (50) NOT NULL,
     Price  FLOAT  NOT NULL,
     CreateDate  DATE  NOT NULL,
     Available  BIT  NOT NULL,
     CategoryId   CHAR (4) NOT NULL,
      FOREIGN KEY (CategoryId) REFERENCES Categories(Id)  
  );
  
CREATE TABLE Authorities(
    Id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    Username VARCHAR(50) NOT NULL,
    RoleId VARCHAR(10) NOT NULL,
    FOREIGN KEY (RoleId) REFERENCES Roles(Id),
    FOREIGN KEY (Username) REFERENCES Accounts(Username)
); 

CREATE TABLE  Orders (
     Id  BIGINT NOT NULL PRIMARY KEY AUTO_INCREMENT,
     Username  vARCHAR (50) NOT NULL,
     CreateDate  DATETIME  NOT NULL,
     Address   VARCHAR (100) NOT NULL,
    FOREIGN KEY (Username) REFERENCES Accounts(Username)
    );
    
    CREATE TABLE OrderDetails(
    Id BIGINT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    OrderId BIGINT NOT NULL,
    ProductId INT NOT NULL,
    Price FLOAT NOT NULL,
    Quantity INT NOT NULL,
    FOREIGN KEY (OrderId) REFERENCES Orders(Id),   
    FOREIGN KEY (ProductId) REFERENCES Products(Id)
);
INSERT INTO `accounts`(`Username`, `Password`, `Fullname`, `Email`, `Photo`) VALUES('ALFKI', 'alfki', 'Maria Anders', 'alfki@gmail.com', 'user.png');
INSERT INTO `accounts`(`Username`, `Password`, `Fullname`, `Email`, `Photo`) VALUES ('ANATR', 'anatr', 'Ana Trujillo', 'anatr@gmail.com', 'user.png');
INSERT INTO `accounts`(`Username`, `Password`, `Fullname`, `Email`, `Photo`) VALUES  ('ANTON', 'anton', 'Antonio Moreno', 'anton@gmail.com', 'user.png');
INSERT INTO `accounts`(`Username`, `Password`, `Fullname`, `Email`, `Photo`) VALUES  ('AROUT', 'arout', 'Thomas Hardy', 'arout@gmail.com', 'user.png');
INSERT INTO `accounts`(`Username`, `Password`, `Fullname`, `Email`, `Photo`) VALUES ('BERGS', 'bergs', 'Christina Berglund', 'bergs@gmail.com', 'user.png');

INSERT INTO `accounts`(`Username`, `Password`, `Fullname`, `Email`, `Photo`) VALUES('cust', '123', 'Maria Anders', 'alfki@gmail.com', 'user.png');
INSERT INTO `accounts`(`Username`, `Password`, `Fullname`, `Email`, `Photo`) VALUES ('admin', '123', 'Ana Trujillo', 'anatr@gmail.com', 'user.png');
INSERT INTO `accounts`(`Username`, `Password`, `Fullname`, `Email`, `Photo`) VALUES  ('pm', '123', 'Antonio Moreno', 'anton@gmail.com', 'user.png');
INSERT INTO `accounts`(`Username`, `Password`, `Fullname`, `Email`, `Photo`) VALUES  ('thinhle', '123', 'Le Hung Thinh', 'thinhlhpc01173@fpt.edu.vn', 'user.png');

INSERT INTO `roles`(`Id`, `NAME`) VALUES ('CUST', 'Customers');
INSERT INTO `roles`(`Id`, `NAME`) VALUES ('DIRE', 'Directors');
INSERT INTO `roles`(`Id`, `NAME`) VALUES ('STAF', 'Staffs');

INSERT INTO `authorities`(`Id`, `Username`, `RoleId`) VALUES (5, 'cust', 'CUST');
INSERT INTO `authorities`(`Id`, `Username`, `RoleId`) VALUES (6, 'pm', 'DIRE');
INSERT INTO `authorities`(`Id`, `Username`, `RoleId`) VALUES (7, 'admin', 'STAF');
INSERT INTO `authorities`(`Id`, `Username`, `RoleId`) VALUES (8, 'thinhle', 'DIRE');

INSERT INTO `categories`(`Id`, `NAME`) VALUES ('1000', 'Dong ho deo tay');
INSERT INTO `categories`(`Id`, `NAME`) VALUES ('1001', 'May tinh xach tay');
INSERT INTO `categories`(`Id`, `NAME`) VALUES ('1002', 'May anh');
INSERT INTO `categories`(`Id`, `NAME`) VALUES ('1003', 'Dien thoai');
INSERT INTO `categories`(`Id`, `NAME`) VALUES ('1004', 'Nuoc hoa');
INSERT INTO `categories`(`Id`, `NAME`) VALUES ('1005', 'Nu trang');
INSERT INTO `categories`(`Id`, `NAME`) VALUES ('1006', 'Non thoi trang');
INSERT INTO `categories`(`Id`, `NAME`) VALUES ('1007', 'Tui xach xach tay');

INSERT INTO `products`(`Id`, `NAME`, `Image`, `Price`, `CreateDate`, `Available`, `CategoryId`) VALUES  (1001, 'Aniseed Syrup', '1001.jpg', 190, '2021-09-04', 0, '1000');
INSERT INTO `products`(`Id`, `NAME`, `Image`, `Price`, `CreateDate`, `Available`, `CategoryId`) VALUES (1002, 'Change', '1002.jpg', 19,'2021-09-04', 0, '1000');
INSERT INTO `products`(`Id`, `NAME`, `Image`, `Price`, `CreateDate`, `Available`, `CategoryId`) VALUES  (1003, 'Aniseed Syrup', '1003.jpg', 10,'2021-09-04', 1, '1001');
INSERT INTO `products`(`Id`, `NAME`, `Image`, `Price`, `CreateDate`, `Available`, `CategoryId`) VALUES  (1004, 'Chef Anton''s Cajun Seasoning', '1004.jpg', 22, '2021-09-04', 0, '1001');
INSERT INTO `products`(`Id`, `NAME`, `Image`, `Price`, `CreateDate`, `Available`, `CategoryId`) VALUES (1005, 'Chef Anton''s Gumbo Mix', '1005.jpg', 21.35, '2021-09-04', 1, '1002');
INSERT INTO `products`(`Id`, `NAME`, `Image`, `Price`, `CreateDate`, `Available`, `CategoryId`) VALUES  (1006, 'Grandma''s Boysenberry Spread', '1006.jpg', 25, '2021-09-04', 0, '1001');
INSERT INTO `products`(`Id`, `NAME`, `Image`, `Price`, `CreateDate`, `Available`, `CategoryId`) VALUES  (1007, 'Uncle Bob''s Organic Dried Pears', '1007.jpg', 30, '2021-09-04', 0, '1006');
INSERT INTO `products`(`Id`, `NAME`, `Image`, `Price`, `CreateDate`, `Available`, `CategoryId`) VALUES  (1008, 'Northwoods Cranberry Sauce', '1008.jpg', 40,'2021-09-04', 0, '1001');
INSERT INTO `products`(`Id`, `NAME`, `Image`, `Price`, `CreateDate`, `Available`, `CategoryId`) VALUES  (1009, 'Mishi Kobe Niku', '1009.jpg', 97, '2021-09-04', 0, '1005');
INSERT INTO `products`(`Id`, `NAME`, `Image`, `Price`, `CreateDate`, `Available`, `CategoryId`) VALUES  (1010, 'Ikura', '1010.jpg', 31, '2021-09-04', 0, '1007');
INSERT INTO `products`(`Id`, `NAME`, `Image`, `Price`, `CreateDate`, `Available`, `CategoryId`) VALUES  (1011, 'Queso Cabrales', '1011.jpg', 21, '2021-09-04', 0, '1003');
INSERT INTO `products`(`Id`, `NAME`, `Image`, `Price`, `CreateDate`, `Available`, `CategoryId`) VALUES  (1012, 'Queso Manchego La Pastora', '1012.jpg', 38, '2021-09-04', 1, '1003');
INSERT INTO `products`(`Id`, `NAME`, `Image`, `Price`, `CreateDate`, `Available`, `CategoryId`) VALUES  (1013, 'Konbu', '1013.jpg', 6,'2021-09-04', 0, '1007');
INSERT INTO `products`(`Id`, `NAME`, `Image`, `Price`, `CreateDate`, `Available`, `CategoryId`) VALUES (1014, 'Tofu', '1014.jpg', 23.25, '2021-09-04', 1, '1006');
INSERT INTO `products`(`Id`, `NAME`, `Image`, `Price`, `CreateDate`, `Available`, `CategoryId`) VALUES  (1015, 'Genen Shouyu', '1015.jpg', 15.5, '2021-09-04', 0, '1001');
INSERT INTO `products`(`Id`, `NAME`, `Image`, `Price`, `CreateDate`, `Available`, `CategoryId`) VALUES  (1016, 'Pavlova', '1016.jpg', 17.45, '2021-09-04', 0, '1002');
INSERT INTO `products`(`Id`, `NAME`, `Image`, `Price`, `CreateDate`, `Available`, `CategoryId`) VALUES  (1017, 'Alice Mutton', '1017.jpg', 39,'2021-09-04', 1, '1005');
INSERT INTO `products`(`Id`, `NAME`, `Image`, `Price`, `CreateDate`, `Available`, `CategoryId`) VALUES  (1018, 'Carnarvon Tigers', '1018.jpg', 62.5,'2021-09-04', 1, '1007');
INSERT INTO `products`(`Id`, `NAME`, `Image`, `Price`, `CreateDate`, `Available`, `CategoryId`) VALUES  (1019, 'Teatime Chocolate Biscuits', '1019.jpg', 9.2, '2021-09-04', 0, '1002');
INSERT INTO `products`(`Id`, `NAME`, `Image`, `Price`, `CreateDate`, `Available`, `CategoryId`) VALUES  (1020, 'Sir Rodney''s Marmalade', '1020.jpg', 81,'2021-09-04', 0, '1002');

