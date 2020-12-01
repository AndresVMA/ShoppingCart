
/****** Object:  Table [dbo].[ProductTypes]    Script Date: 11/9/2020 1:56:38 AM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[ProductTypes](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Type] [nvarchar](100) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[LastModifiedDate] [datetime] NULL
 CONSTRAINT [PK_ProductTypes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, 
       ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
ALTER TABLE [dbo].[ProductTypes] ADD CONSTRAINT DF_ProductTypes_CreatedDate DEFAULT(GETDATE()) FOR CreatedDate


/****** Object:  Table [dbo].[Products]    Script Date: 11/9/2020 1:56:38 AM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[Products](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](255) NOT NULL,
	[Description] [nvarchar](500) NOT NULL,
	[Price] [money] NOT NULL,
	[TypeId] [int] FOREIGN KEY REFERENCES ProductTypes(Id),
	[IsDeleted][bit] NOT NULL,
	[IsShippable] [bit] NOT NULL,
	[IsDownloadable] [bit] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[LastModifiedDate] [datetime] NULL
CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, 
 ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
ALTER TABLE [dbo].[Products] ADD CONSTRAINT DF_Products_Price DEFAULT(0.00) FOR Price
ALTER TABLE [dbo].[Products] ADD CONSTRAINT DF_Products_IsDeleted DEFAULT(0) FOR IsDeleted
ALTER TABLE [dbo].[Products] ADD CONSTRAINT DF_Products_IsShippable DEFAULT(0) FOR IsShippable
ALTER TABLE [dbo].[Products] ADD CONSTRAINT DF_Products_IsDownloadable DEFAULT(0) FOR IsDownloadable
ALTER TABLE [dbo].[Products] ADD CONSTRAINT DF_Products_CreatedDate DEFAULT(GETDATE()) FOR CreatedDate

/****** Object:  Table [dbo].[Users]    Script Date: 11/9/2020 1:56:38 AM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[Users](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Username] [nvarchar](255) NOT NULL,
	[Password] [nvarchar](255) NOT NULL,
	[FirstName] [nvarchar](255) NOT NULL,
	[LastName] [nvarchar](255) NOT NULL,
	[Email] [nvarchar](255) NOT NULL,
	[Active] [bit] NOT NULL
	
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, 
 ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

ALTER TABLE [dbo].[Users] ADD CONSTRAINT DF_Users_Active DEFAULT(1) FOR Active

/****** Object:  Table [dbo].[ShoppingCart]    Script Date: 11/9/2020 1:56:38 AM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[UserShoppingCart](
	[UserId] int NOT NULL,
	[ProductId] int NOT NULL,
	[Quantity] int NOT NULL,
) 
ALTER TABLE [dbo].[UserShoppingCart] ADD CONSTRAINT PK_UserShoppingCart PRIMARY KEY CLUSTERED(UserId, ProductId)
ALTER TABLE [dbo].[UserShoppingCart] ADD CONSTRAINT FK_ShoppingCard_UserId 
FOREIGN KEY (UserId) REFERENCES Users(Id) ON DELETE CASCADE
ALTER TABLE [dbo].[UserShoppingCart] ADD CONSTRAINT FK_ShoppingCard_ProductId 
FOREIGN KEY (ProductId) REFERENCES Products(Id) ON DELETE CASCADE
 

/****** Object:  Table [dbo].[ShoppingCart]    Script Date: 11/9/2020 1:56:38 AM ******/
SET ANSI_NULLS ON

SET QUOTED_IDENTIFIER ON

CREATE TABLE [dbo].[ProductStock](
	[ProductId] int NOT NULL,
	[Quantity] int NOT NULL
) 
ALTER TABLE [dbo].[ProductStock] ADD CONSTRAINT PK_ProductStock PRIMARY KEY CLUSTERED(ProductId)
ALTER TABLE [dbo].[ProductStock] ADD CONSTRAINT FK_ProductStock_ProductId 
FOREIGN KEY (ProductId) REFERENCES Products(Id) ON DELETE CASCADE
 

INSERT INTO dbo.ProductTypes(Type, CreatedDate)
VALUES('Music', GETDATE()),
('Books', GETDATE()),
('eBooks', GETDATE()),
('Games', GETDATE()),
('Electronics', GETDATE()),
('Clothes', GETDATE()),
('Home Appliances', GETDATE())

INSERT INTO dbo.Users(Username, Password, FirstName, LastName, Email)
VALUES('wbyers', 'MSjnzpG40POkfG1AjXfJwWlpHWYOY3+OEcj+uKRmskDFc8gf/XFKIonS/EAkW0jgaBlAFp7doMO3xDXlp1Wl/A==', 'William', 'Byers', 'wbyers@sthings.com'),
('mwheeler', '+WbqlOr25mJvPeKQR4d1oPaTh+nFA69a5Kthz6W6sBNhR3Q0nKdlcwenQRyZRvU1zyT/hQk+uwyO7ydz0U9HKg==', 'Mike', 'Wheeler', 'mwheeler@sthings.com'),
('once', 'uhMFos3DmpN/7y7Jvtmm5g0CrNfXhDA50bocvxpHK/fhkgxLHD1k81BTCjW8qZI7fJmJDdqdU4Neho/rV+QLZQ==', 'Once', '', 'once@sthings.com'),
('max', 'MSjnzpG40POkfG1AjXfJwWlpHWYOY3+OEcj+uKRmskDFc8gf/XFKIonS/EAkW0jgaBlAFp7doMO3xDXlp1Wl/A==', 'Max', '', 'max@sthings.com')


DECLARE @bookType INT = (SELECT Id FROM ProductTypes WHERE Type = 'Books')
DECLARE @gamesType INT = (SELECT Id FROM ProductTypes WHERE Type = 'Games')

INSERT INTO dbo.Products(Name, Description, Price, TypeId, IsShippable, IsDownloadable)
VALUES('Lord of the rings- The Fellowship', 'LOTR I', 9.99, @bookType, 1, 0),
('Lord of the rings- Two Towers', 'LOTR II', 10.99, @bookType, 1, 0),
('Lord of the rings- The Return of the King', 'LOTR III', 11.99, @bookType, 1, 1),
('Injustice d Among Us', 'DC', 12.99, @gamesType, 0, 1),
('Saint Seiya - Soldier of Soul', 'Bandai Namco', 12.99, @gamesType, 0, 1),
('C&C Remastered', 'Westwood Studios/EA', 20.00, @gamesType, 0, 1)

INSERT INTO ProductStock
VALUES(1, 40), (2, 30), (3, 40), (4, 100), (5, 0), (6, 80)