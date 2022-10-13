USE MASTER
GO
CREATE DATABASE TapHoaDienTu
go 
USE TapHoaDienTu
GO

CREATE TABLE Users
(
	Id					INT IdENTITY	(1,1)				PRIMARY KEY	,
	UserName			VARCHAR			(20)	NOT NULL	UNIQUE		,
	Password			VARCHAR			(30)	NOT NULL				,
	Name				NVARCHAR		(50)	NOT NULL				,
	Adress				NVARCHAR		(100)							,
	Roles				BIT						NOT NULL
)

CREATE TABLE Category
(
	Id					INT IdENTITY	(1,1)				PRIMARY KEY	,
	Name				NVARCHAR		(50)	NOT NULL				
)

CREATE TABLE Product
(
	Id					INT IdENTITY	(1,1)				PRIMARY KEY	,
	Name				NVARCHAR		(50)	NOT NULL				,
	Image				VARCHAR			(50)	NOT NULL				,
	CategoryId			INT REFERENCES			Category(Id)
)

CREATE TABLE ProductDetail
(
	Id					INT IdENTITY	(1,1)				PRIMARY KEY	,
	ProductId			INT REFERENCES			Product(Id)				,
	ProductDetail		NVARCHAR		(100)							,
	ImageDetail			VARCHAR			(50)	NOT NULL				,
	Price				INT
)

CREATE TABLE Orders
(
	Id					INT IdENTITY	(1,1)				PRIMARY KEY	,
	UserId				INT REFERENCES			Users(Id)				,
	DateCreated			DATE					NOT NULL				,
	TotalPrice			INT
)

CREATE TABLE OrderDetail
(
	Id					INT IdENTITY	(1,1)				PRIMARY KEY	,
	OrderId				INT REFERENCES			Orders(Id)				,
	ProductId			INT REFERENCES			Product(Id)				,
	Amount				INT												,
	TotalPrice			INT
)


INSERT