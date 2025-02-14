USE [VinidiktovDay5]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 29.03.2024 11:50:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[ID_Product] [int] NOT NULL,
	[Articul] [nvarchar](50) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[DescriptionProduct] [nvarchar](200) NOT NULL,
	[ID_Category] [int] NOT NULL,
	[Photo] [nvarchar](1000) NULL,
	[ID_Manufacture] [int] NOT NULL,
	[Cost] [nvarchar](50) NOT NULL,
	[CurrentDiscount] [int] NOT NULL,
	[MaxDiscount] [int] NOT NULL,
	[QuantityStock] [int] NOT NULL,
	[ID_UnitMeasurement] [int] NOT NULL,
	[ID_Supplier] [int] NOT NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[ID_Product] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ManufactureProduct]    Script Date: 29.03.2024 11:50:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ManufactureProduct](
	[ID_Manufacturer] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_ManufactureProduct] PRIMARY KEY CLUSTERED 
(
	[ID_Manufacturer] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[InfoProduct]    Script Date: 29.03.2024 11:50:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[InfoProduct] AS
SELECT        dbo.Product.ID_Product, dbo.Product.Name, dbo.Product.DescriptionProduct, dbo.ManufactureProduct.Name AS Manufacture, dbo.Product.Cost, dbo.Product.QuantityStock, dbo.Product.Photo
FROM            dbo.ManufactureProduct INNER JOIN
                         dbo.Product ON dbo.ManufactureProduct.ID_Manufacturer = dbo.Product.ID_Manufacture
GO
/****** Object:  Table [dbo].[CategoryProduct]    Script Date: 29.03.2024 11:50:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CategoryProduct](
	[ID_Category] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_CategoryProduct] PRIMARY KEY CLUSTERED 
(
	[ID_Category] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 29.03.2024 11:50:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[ID_Order] [int] NOT NULL,
	[ID_StatusOrder] [int] NOT NULL,
	[DateOrder] [date] NOT NULL,
	[DateDelivery] [date] NOT NULL,
	[ID_CompositionOrder] [int] NOT NULL,
	[CountProduct] [int] NOT NULL,
	[ID_PickUp] [int] NOT NULL,
	[ID_Client] [int] NULL,
	[CodeReceive] [int] NOT NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[ID_Order] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderProduct]    Script Date: 29.03.2024 11:50:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderProduct](
	[ID_OrderProduct] [int] NOT NULL,
	[ID_Order] [int] NULL,
	[ID_Product] [int] NOT NULL,
 CONSTRAINT [PK_OrderProduct] PRIMARY KEY CLUSTERED 
(
	[ID_OrderProduct] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PickUpPoint]    Script Date: 29.03.2024 11:50:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PickUpPoint](
	[ID_PickUp] [int] NOT NULL,
	[Address] [nvarchar](300) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_PickUp] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 29.03.2024 11:50:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[ID_Role] [int] NOT NULL,
	[Role] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
(
	[ID_Role] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StatusOrder]    Script Date: 29.03.2024 11:50:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StatusOrder](
	[ID_Status] [int] NOT NULL,
	[Status] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_StatusOrder] PRIMARY KEY CLUSTERED 
(
	[ID_Status] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Supplier]    Script Date: 29.03.2024 11:50:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Supplier](
	[ID_Supplier] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Supplier] PRIMARY KEY CLUSTERED 
(
	[ID_Supplier] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UnitMeasurement]    Script Date: 29.03.2024 11:50:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UnitMeasurement](
	[ID_UnitMeasurement] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_UnitMeasurement] PRIMARY KEY CLUSTERED 
(
	[ID_UnitMeasurement] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 29.03.2024 11:50:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[ID_User] [int] NOT NULL,
	[FIO] [nvarchar](50) NOT NULL,
	[Login] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](50) NOT NULL,
	[ID_Role] [int] NOT NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[ID_User] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[CategoryProduct] ([ID_Category], [Name]) VALUES (1, N'Детские ткани')
INSERT [dbo].[CategoryProduct] ([ID_Category], [Name]) VALUES (2, N'Постельные ткани')
INSERT [dbo].[CategoryProduct] ([ID_Category], [Name]) VALUES (3, N'Ткани для изделий')
GO
INSERT [dbo].[ManufactureProduct] ([ID_Manufacturer], [Name]) VALUES (1, N'БТК Текстиль')
INSERT [dbo].[ManufactureProduct] ([ID_Manufacturer], [Name]) VALUES (2, N'Империя ткани')
INSERT [dbo].[ManufactureProduct] ([ID_Manufacturer], [Name]) VALUES (3, N'Комильфо')
INSERT [dbo].[ManufactureProduct] ([ID_Manufacturer], [Name]) VALUES (4, N'Май Фабрик')
GO
INSERT [dbo].[Order] ([ID_Order], [ID_StatusOrder], [DateOrder], [DateDelivery], [ID_CompositionOrder], [CountProduct], [ID_PickUp], [ID_Client], [CodeReceive]) VALUES (1, 2, CAST(N'2022-05-10' AS Date), CAST(N'2022-05-16' AS Date), 1, 5, 27, 7, 811)
INSERT [dbo].[Order] ([ID_Order], [ID_StatusOrder], [DateOrder], [DateDelivery], [ID_CompositionOrder], [CountProduct], [ID_PickUp], [ID_Client], [CodeReceive]) VALUES (2, 2, CAST(N'2022-05-10' AS Date), CAST(N'2022-05-16' AS Date), 25, 7, 27, 7, 811)
INSERT [dbo].[Order] ([ID_Order], [ID_StatusOrder], [DateOrder], [DateDelivery], [ID_CompositionOrder], [CountProduct], [ID_PickUp], [ID_Client], [CodeReceive]) VALUES (3, 2, CAST(N'2022-05-11' AS Date), CAST(N'2022-05-17' AS Date), 4, 5, 5, NULL, 812)
INSERT [dbo].[Order] ([ID_Order], [ID_StatusOrder], [DateOrder], [DateDelivery], [ID_CompositionOrder], [CountProduct], [ID_PickUp], [ID_Client], [CodeReceive]) VALUES (4, 2, CAST(N'2022-05-11' AS Date), CAST(N'2022-05-17' AS Date), 25, 9, 5, NULL, 812)
INSERT [dbo].[Order] ([ID_Order], [ID_StatusOrder], [DateOrder], [DateDelivery], [ID_CompositionOrder], [CountProduct], [ID_PickUp], [ID_Client], [CodeReceive]) VALUES (5, 2, CAST(N'2022-05-12' AS Date), CAST(N'2022-05-18' AS Date), 12, 4, 29, NULL, 813)
INSERT [dbo].[Order] ([ID_Order], [ID_StatusOrder], [DateOrder], [DateDelivery], [ID_CompositionOrder], [CountProduct], [ID_PickUp], [ID_Client], [CodeReceive]) VALUES (6, 2, CAST(N'2022-05-12' AS Date), CAST(N'2022-05-18' AS Date), 11, 8, 29, NULL, 813)
INSERT [dbo].[Order] ([ID_Order], [ID_StatusOrder], [DateOrder], [DateDelivery], [ID_CompositionOrder], [CountProduct], [ID_PickUp], [ID_Client], [CodeReceive]) VALUES (7, 2, CAST(N'2022-05-13' AS Date), CAST(N'2022-05-19' AS Date), 13, 6, 10, NULL, 814)
INSERT [dbo].[Order] ([ID_Order], [ID_StatusOrder], [DateOrder], [DateDelivery], [ID_CompositionOrder], [CountProduct], [ID_PickUp], [ID_Client], [CodeReceive]) VALUES (8, 2, CAST(N'2022-05-13' AS Date), CAST(N'2022-05-19' AS Date), 24, 1, 10, NULL, 814)
INSERT [dbo].[Order] ([ID_Order], [ID_StatusOrder], [DateOrder], [DateDelivery], [ID_CompositionOrder], [CountProduct], [ID_PickUp], [ID_Client], [CodeReceive]) VALUES (9, 2, CAST(N'2022-05-14' AS Date), CAST(N'2022-05-20' AS Date), 28, 2, 31, 8, 815)
INSERT [dbo].[Order] ([ID_Order], [ID_StatusOrder], [DateOrder], [DateDelivery], [ID_CompositionOrder], [CountProduct], [ID_PickUp], [ID_Client], [CodeReceive]) VALUES (10, 2, CAST(N'2022-05-14' AS Date), CAST(N'2022-05-20' AS Date), 21, 1, 31, 8, 815)
INSERT [dbo].[Order] ([ID_Order], [ID_StatusOrder], [DateOrder], [DateDelivery], [ID_CompositionOrder], [CountProduct], [ID_PickUp], [ID_Client], [CodeReceive]) VALUES (11, 2, CAST(N'2022-05-15' AS Date), CAST(N'2022-05-21' AS Date), 19, 4, 32, NULL, 816)
INSERT [dbo].[Order] ([ID_Order], [ID_StatusOrder], [DateOrder], [DateDelivery], [ID_CompositionOrder], [CountProduct], [ID_PickUp], [ID_Client], [CodeReceive]) VALUES (12, 2, CAST(N'2022-05-15' AS Date), CAST(N'2022-05-21' AS Date), 23, 1, 32, NULL, 816)
INSERT [dbo].[Order] ([ID_Order], [ID_StatusOrder], [DateOrder], [DateDelivery], [ID_CompositionOrder], [CountProduct], [ID_PickUp], [ID_Client], [CodeReceive]) VALUES (13, 2, CAST(N'2022-05-16' AS Date), CAST(N'2022-05-22' AS Date), 7, 2, 20, NULL, 817)
INSERT [dbo].[Order] ([ID_Order], [ID_StatusOrder], [DateOrder], [DateDelivery], [ID_CompositionOrder], [CountProduct], [ID_PickUp], [ID_Client], [CodeReceive]) VALUES (14, 2, CAST(N'2022-05-16' AS Date), CAST(N'2022-05-22' AS Date), 18, 5, 20, NULL, 817)
INSERT [dbo].[Order] ([ID_Order], [ID_StatusOrder], [DateOrder], [DateDelivery], [ID_CompositionOrder], [CountProduct], [ID_PickUp], [ID_Client], [CodeReceive]) VALUES (15, 1, CAST(N'2022-05-17' AS Date), CAST(N'2022-05-23' AS Date), 29, 1, 34, 9, 818)
INSERT [dbo].[Order] ([ID_Order], [ID_StatusOrder], [DateOrder], [DateDelivery], [ID_CompositionOrder], [CountProduct], [ID_PickUp], [ID_Client], [CodeReceive]) VALUES (16, 1, CAST(N'2022-05-17' AS Date), CAST(N'2022-05-23' AS Date), 20, 3, 34, 9, 818)
INSERT [dbo].[Order] ([ID_Order], [ID_StatusOrder], [DateOrder], [DateDelivery], [ID_CompositionOrder], [CountProduct], [ID_PickUp], [ID_Client], [CodeReceive]) VALUES (17, 2, CAST(N'2022-05-18' AS Date), CAST(N'2022-05-24' AS Date), 27, 2, 35, 10, 819)
INSERT [dbo].[Order] ([ID_Order], [ID_StatusOrder], [DateOrder], [DateDelivery], [ID_CompositionOrder], [CountProduct], [ID_PickUp], [ID_Client], [CodeReceive]) VALUES (18, 2, CAST(N'2022-05-18' AS Date), CAST(N'2022-05-24' AS Date), 9, 3, 35, 10, 819)
INSERT [dbo].[Order] ([ID_Order], [ID_StatusOrder], [DateOrder], [DateDelivery], [ID_CompositionOrder], [CountProduct], [ID_PickUp], [ID_Client], [CodeReceive]) VALUES (19, 1, CAST(N'2022-05-19' AS Date), CAST(N'2022-05-25' AS Date), 17, 6, 36, NULL, 820)
INSERT [dbo].[Order] ([ID_Order], [ID_StatusOrder], [DateOrder], [DateDelivery], [ID_CompositionOrder], [CountProduct], [ID_PickUp], [ID_Client], [CodeReceive]) VALUES (20, 1, CAST(N'2022-05-19' AS Date), CAST(N'2022-05-25' AS Date), 8, 7, 36, NULL, 820)
GO
INSERT [dbo].[OrderProduct] ([ID_OrderProduct], [ID_Order], [ID_Product]) VALUES (3, 3, 3)
INSERT [dbo].[OrderProduct] ([ID_OrderProduct], [ID_Order], [ID_Product]) VALUES (4, 4, 4)
INSERT [dbo].[OrderProduct] ([ID_OrderProduct], [ID_Order], [ID_Product]) VALUES (5, 5, 5)
INSERT [dbo].[OrderProduct] ([ID_OrderProduct], [ID_Order], [ID_Product]) VALUES (6, 6, 6)
INSERT [dbo].[OrderProduct] ([ID_OrderProduct], [ID_Order], [ID_Product]) VALUES (7, 7, 7)
INSERT [dbo].[OrderProduct] ([ID_OrderProduct], [ID_Order], [ID_Product]) VALUES (8, 8, 8)
INSERT [dbo].[OrderProduct] ([ID_OrderProduct], [ID_Order], [ID_Product]) VALUES (9, 9, 9)
INSERT [dbo].[OrderProduct] ([ID_OrderProduct], [ID_Order], [ID_Product]) VALUES (10, 10, 10)
INSERT [dbo].[OrderProduct] ([ID_OrderProduct], [ID_Order], [ID_Product]) VALUES (11, 11, 11)
INSERT [dbo].[OrderProduct] ([ID_OrderProduct], [ID_Order], [ID_Product]) VALUES (12, 12, 12)
INSERT [dbo].[OrderProduct] ([ID_OrderProduct], [ID_Order], [ID_Product]) VALUES (13, 13, 13)
INSERT [dbo].[OrderProduct] ([ID_OrderProduct], [ID_Order], [ID_Product]) VALUES (14, 14, 14)
INSERT [dbo].[OrderProduct] ([ID_OrderProduct], [ID_Order], [ID_Product]) VALUES (15, 15, 15)
INSERT [dbo].[OrderProduct] ([ID_OrderProduct], [ID_Order], [ID_Product]) VALUES (16, 16, 16)
INSERT [dbo].[OrderProduct] ([ID_OrderProduct], [ID_Order], [ID_Product]) VALUES (17, 17, 17)
INSERT [dbo].[OrderProduct] ([ID_OrderProduct], [ID_Order], [ID_Product]) VALUES (18, 18, 18)
INSERT [dbo].[OrderProduct] ([ID_OrderProduct], [ID_Order], [ID_Product]) VALUES (19, 19, 19)
INSERT [dbo].[OrderProduct] ([ID_OrderProduct], [ID_Order], [ID_Product]) VALUES (20, 20, 20)
INSERT [dbo].[OrderProduct] ([ID_OrderProduct], [ID_Order], [ID_Product]) VALUES (21, NULL, 21)
INSERT [dbo].[OrderProduct] ([ID_OrderProduct], [ID_Order], [ID_Product]) VALUES (22, NULL, 22)
INSERT [dbo].[OrderProduct] ([ID_OrderProduct], [ID_Order], [ID_Product]) VALUES (23, NULL, 23)
INSERT [dbo].[OrderProduct] ([ID_OrderProduct], [ID_Order], [ID_Product]) VALUES (24, NULL, 24)
INSERT [dbo].[OrderProduct] ([ID_OrderProduct], [ID_Order], [ID_Product]) VALUES (25, NULL, 25)
INSERT [dbo].[OrderProduct] ([ID_OrderProduct], [ID_Order], [ID_Product]) VALUES (26, NULL, 26)
INSERT [dbo].[OrderProduct] ([ID_OrderProduct], [ID_Order], [ID_Product]) VALUES (27, NULL, 27)
INSERT [dbo].[OrderProduct] ([ID_OrderProduct], [ID_Order], [ID_Product]) VALUES (28, NULL, 28)
INSERT [dbo].[OrderProduct] ([ID_OrderProduct], [ID_Order], [ID_Product]) VALUES (29, NULL, 29)
INSERT [dbo].[OrderProduct] ([ID_OrderProduct], [ID_Order], [ID_Product]) VALUES (30, NULL, 30)
GO
INSERT [dbo].[PickUpPoint] ([ID_PickUp], [Address]) VALUES (1, N'344288, г. Кропоткин, ул. Чехова, 1')
INSERT [dbo].[PickUpPoint] ([ID_PickUp], [Address]) VALUES (2, N'614164, г.Кропоткин,  ул. Степная, 30')
INSERT [dbo].[PickUpPoint] ([ID_PickUp], [Address]) VALUES (3, N'394242, г. Кропоткин, ул. Коммунистическая, 43')
INSERT [dbo].[PickUpPoint] ([ID_PickUp], [Address]) VALUES (4, N'660540, г. Кропоткин, ул. Солнечная, 25')
INSERT [dbo].[PickUpPoint] ([ID_PickUp], [Address]) VALUES (5, N'125837, г. Кропоткин, ул. Шоссейная, 40')
INSERT [dbo].[PickUpPoint] ([ID_PickUp], [Address]) VALUES (6, N'125703, г. Кропоткин, ул. Партизанская, 49')
INSERT [dbo].[PickUpPoint] ([ID_PickUp], [Address]) VALUES (7, N'625283, г. Кропоткин, ул. Победы, 46')
INSERT [dbo].[PickUpPoint] ([ID_PickUp], [Address]) VALUES (8, N'614611, г. Кропоткин, ул. Молодежная, 50')
INSERT [dbo].[PickUpPoint] ([ID_PickUp], [Address]) VALUES (9, N'454311, г.Кропоткин, ул. Новая, 19')
INSERT [dbo].[PickUpPoint] ([ID_PickUp], [Address]) VALUES (10, N'660007, г.Кропоткин, ул. Октябрьская, 19')
INSERT [dbo].[PickUpPoint] ([ID_PickUp], [Address]) VALUES (11, N'603036, г. Кропоткин, ул. Садовая, 4')
INSERT [dbo].[PickUpPoint] ([ID_PickUp], [Address]) VALUES (12, N'450983, г.Кропоткин, ул. Комсомольская, 26')
INSERT [dbo].[PickUpPoint] ([ID_PickUp], [Address]) VALUES (13, N'394782, г. Кропоткин, ул. Чехова, 3')
INSERT [dbo].[PickUpPoint] ([ID_PickUp], [Address]) VALUES (14, N'603002, г. Кропоткин, ул. Дзержинского, 28')
INSERT [dbo].[PickUpPoint] ([ID_PickUp], [Address]) VALUES (15, N'450558, г. Кропоткин, ул. Набережная, 30')
INSERT [dbo].[PickUpPoint] ([ID_PickUp], [Address]) VALUES (16, N'394060, г.Кропоткин, ул. Фрунзе, 43')
INSERT [dbo].[PickUpPoint] ([ID_PickUp], [Address]) VALUES (17, N'410661, г. Кропоткин, ул. Школьная, 50')
INSERT [dbo].[PickUpPoint] ([ID_PickUp], [Address]) VALUES (18, N'625590, г. Кропоткин, ул. Коммунистическая, 20')
INSERT [dbo].[PickUpPoint] ([ID_PickUp], [Address]) VALUES (19, N'625683, г. Кропоткин, ул. 8 Марта')
INSERT [dbo].[PickUpPoint] ([ID_PickUp], [Address]) VALUES (20, N'400562, г. Кропоткин, ул. Зеленая, 32')
INSERT [dbo].[PickUpPoint] ([ID_PickUp], [Address]) VALUES (21, N'614510, г. Кропоткин, ул. Маяковского, 47')
INSERT [dbo].[PickUpPoint] ([ID_PickUp], [Address]) VALUES (22, N'410542, г. Кропоткин, ул. Светлая, 46')
INSERT [dbo].[PickUpPoint] ([ID_PickUp], [Address]) VALUES (23, N'620839, г. Кропоткин, ул. Цветочная, 8')
INSERT [dbo].[PickUpPoint] ([ID_PickUp], [Address]) VALUES (24, N'443890, г. Кропоткин, ул. Коммунистическая, 1')
INSERT [dbo].[PickUpPoint] ([ID_PickUp], [Address]) VALUES (25, N'603379, г. Кропоткин, ул. Спортивная, 46')
INSERT [dbo].[PickUpPoint] ([ID_PickUp], [Address]) VALUES (26, N'603721, г. Кропоткин, ул. Гоголя, 41')
INSERT [dbo].[PickUpPoint] ([ID_PickUp], [Address]) VALUES (27, N'410172, г. Кропоткин, ул. Северная, 13')
INSERT [dbo].[PickUpPoint] ([ID_PickUp], [Address]) VALUES (28, N'420151, г. Кропоткин, ул. Вишневая, 32')
INSERT [dbo].[PickUpPoint] ([ID_PickUp], [Address]) VALUES (29, N'125061, г. Кропоткин, ул. Подгорная, 8')
INSERT [dbo].[PickUpPoint] ([ID_PickUp], [Address]) VALUES (30, N'630370, г. Кропоткин, ул. Шоссейная, 24')
INSERT [dbo].[PickUpPoint] ([ID_PickUp], [Address]) VALUES (31, N'614753, г. Кропоткин, ул. Полевая, 35')
INSERT [dbo].[PickUpPoint] ([ID_PickUp], [Address]) VALUES (32, N'426030, г. Кропоткин, ул. Маяковского, 44')
INSERT [dbo].[PickUpPoint] ([ID_PickUp], [Address]) VALUES (33, N'450375, г. Кропоткин ул. Клубная, 44')
INSERT [dbo].[PickUpPoint] ([ID_PickUp], [Address]) VALUES (34, N'625560, г. Кропоткин, ул. Некрасова, 12')
INSERT [dbo].[PickUpPoint] ([ID_PickUp], [Address]) VALUES (35, N'630201, г. Кропоткин, ул. Комсомольская, 17')
INSERT [dbo].[PickUpPoint] ([ID_PickUp], [Address]) VALUES (36, N'190949, г. Кропоткин, ул. Мичурина, 26')
GO
INSERT [dbo].[Product] ([ID_Product], [Articul], [Name], [DescriptionProduct], [ID_Category], [Photo], [ID_Manufacture], [Cost], [CurrentDiscount], [MaxDiscount], [QuantityStock], [ID_UnitMeasurement], [ID_Supplier]) VALUES (3, N'T238C7', N'Муслин «Gri»', N'Муслин «Gri» однотонный шириной 140+/-5 см с изображением на ткани — однотонный; цветовая гамма: серая.', 1, N'\Resource\T238C7.jpg', 1, N'6500', 2, 15, 12, 1, 2)
INSERT [dbo].[Product] ([ID_Product], [Articul], [Name], [DescriptionProduct], [ID_Category], [Photo], [ID_Manufacture], [Cost], [CurrentDiscount], [MaxDiscount], [QuantityStock], [ID_UnitMeasurement], [ID_Supplier]) VALUES (4, N'M112C8', N'Бязь детская «Совята»', N'Бязь детская «Совята» шириной 150 см с изображением на ткани — совы; цветовая гамма: бордо, желтая, салатовая.', 1, N'\Resource\M112C8.jpg', 2, N'26000', 2, 20, 14, 1, 3)
INSERT [dbo].[Product] ([ID_Product], [Articul], [Name], [DescriptionProduct], [ID_Category], [Photo], [ID_Manufacture], [Cost], [CurrentDiscount], [MaxDiscount], [QuantityStock], [ID_UnitMeasurement], [ID_Supplier]) VALUES (5, N'M294G9', N'Полотно вафельное «8 марта»', N'Полотно вафельное «8 марта» шириной 50 см с изображением на ткани — белые розы; цветовая гамма: розовая.', 3, N'\Resource\M294G9.jpg', 2, N'5130', 2, 5, 1, 1, 3)
INSERT [dbo].[Product] ([ID_Product], [Articul], [Name], [DescriptionProduct], [ID_Category], [Photo], [ID_Manufacture], [Cost], [CurrentDiscount], [MaxDiscount], [QuantityStock], [ID_UnitMeasurement], [ID_Supplier]) VALUES (6, N'N283K3', N'Сатин «Миндальный» однотонный', N'Сатин «Миндальный» однотонный шириной 250 см с изображением на ткани цветовая гамма: миндаль. ', 2, N'\Resource\N283K3.jpg', 3, N'6500', 3, 5, 7, 1, 3)
INSERT [dbo].[Product] ([ID_Product], [Articul], [Name], [DescriptionProduct], [ID_Category], [Photo], [ID_Manufacture], [Cost], [CurrentDiscount], [MaxDiscount], [QuantityStock], [ID_UnitMeasurement], [ID_Supplier]) VALUES (7, N'L293S9', N'Плюш розовый гладкий', N'Плюш розовый гладкий шириной 180 см с изображением на ткани — однотонный; цветовая гамма: однотонная, розовая.', 1, N'\Resource\L293S9.jpg', 3, N'30000', 3, 40, 2, 1, 3)
INSERT [dbo].[Product] ([ID_Product], [Articul], [Name], [DescriptionProduct], [ID_Category], [Photo], [ID_Manufacture], [Cost], [CurrentDiscount], [MaxDiscount], [QuantityStock], [ID_UnitMeasurement], [ID_Supplier]) VALUES (8, N'M398S9', N'Поплин Мокко', N'Поплин Мокко 220 см шириной 220 см с изображением на ткани — однотонное; цветовая гамма: коричневая, кофе, шоколад.', 2, N'\Resource\M398S9.jpg', 4, N'1800', 2, 15, 6, 1, 1)
INSERT [dbo].[Product] ([ID_Product], [Articul], [Name], [DescriptionProduct], [ID_Category], [Photo], [ID_Manufacture], [Cost], [CurrentDiscount], [MaxDiscount], [QuantityStock], [ID_UnitMeasurement], [ID_Supplier]) VALUES (9, N'S384K2', N'Фланель черная', N'Фланель черная оптом шириной 90 см с изображением на ткани — однотонное; цветовая гамма: черная.', 3, N'\Resource\S384K2.jpg', 1, N'69000', 4, 40, 2, 1, 1)
INSERT [dbo].[Product] ([ID_Product], [Articul], [Name], [DescriptionProduct], [ID_Category], [Photo], [ID_Manufacture], [Cost], [CurrentDiscount], [MaxDiscount], [QuantityStock], [ID_UnitMeasurement], [ID_Supplier]) VALUES (10, N'K839K3', N'Плюш белый в клетку', N'Плюш белый в клетку шириной 180 см с изображением на ткани — клетка, однотонный; цветовая гамма: белая, однотонная.', 1, N'\Resource\K839K3.jpg', 2, N'765', 2, 5, 3, 1, 1)
INSERT [dbo].[Product] ([ID_Product], [Articul], [Name], [DescriptionProduct], [ID_Category], [Photo], [ID_Manufacture], [Cost], [CurrentDiscount], [MaxDiscount], [QuantityStock], [ID_UnitMeasurement], [ID_Supplier]) VALUES (11, N'D938K3', N'Фланель однотонная светлая', N'Фланель однотонная светлая оптом шириной 90 см с изображением на ткани — однотонное; цветовая гамма: голубая, желтая, розовая, сирень, фисташка.', 3, N'\Resource\picture.png', 4, N'1300', 4, 10, 10, 1, 1)
INSERT [dbo].[Product] ([ID_Product], [Articul], [Name], [DescriptionProduct], [ID_Category], [Photo], [ID_Manufacture], [Cost], [CurrentDiscount], [MaxDiscount], [QuantityStock], [ID_UnitMeasurement], [ID_Supplier]) VALUES (12, N'R748K3', N'Поплин Морская волна', N'Поплин Морская волна 220 см шириной 220 см с изображением на ткани — однотонное; цветовая гамма: аквамарин, бирюзовая.', 2, N'\Resource\picture.png', 4, N'2300', 2, 15, 6, 1, 1)
INSERT [dbo].[Product] ([ID_Product], [Articul], [Name], [DescriptionProduct], [ID_Category], [Photo], [ID_Manufacture], [Cost], [CurrentDiscount], [MaxDiscount], [QuantityStock], [ID_UnitMeasurement], [ID_Supplier]) VALUES (13, N'C384D8', N'Сатин «Дымчатая роза» однотонный', N'Сатин «Дымчатая роза» однотонный шириной 250 см с изображением на ткани цветовая гамма: розовый зефир.', 2, N'\Resource\picture.png', 2, N'1133', 3, 10, 4, 1, 3)
INSERT [dbo].[Product] ([ID_Product], [Articul], [Name], [DescriptionProduct], [ID_Category], [Photo], [ID_Manufacture], [Cost], [CurrentDiscount], [MaxDiscount], [QuantityStock], [ID_UnitMeasurement], [ID_Supplier]) VALUES (14, N'F374S8', N'Фланель рубашечная', N'Фланель рубашечная шириной 150 см с изображением на ткани — клетка; цветовая гамма: светло-коричневая, синий-королевский.', 3, N'\Resource\picture.png', 1, N'2100', 2, 5, 5, 1, 3)
INSERT [dbo].[Product] ([ID_Product], [Articul], [Name], [DescriptionProduct], [ID_Category], [Photo], [ID_Manufacture], [Cost], [CurrentDiscount], [MaxDiscount], [QuantityStock], [ID_UnitMeasurement], [ID_Supplier]) VALUES (15, N'W874J3', N'Ткань поплин «Натурель»', N'Ткань поплин «Натурель» шириной 220 см с изображением на ткани — мелкие цветы; цветовая гамма: пепельная, розовая. ', 2, N'\Resource\picture.png', 1, N'1600', 3, 5, 9, 1, 1)
INSERT [dbo].[Product] ([ID_Product], [Articul], [Name], [DescriptionProduct], [ID_Category], [Photo], [ID_Manufacture], [Cost], [CurrentDiscount], [MaxDiscount], [QuantityStock], [ID_UnitMeasurement], [ID_Supplier]) VALUES (16, N'Z937S2', N'Поплин Голубой', N'Поплин Голубой 220 см шириной 220 см с изображением на ткани — однотонное; цветовая гамма: голубая.', 2, N'\Resource\picture.png', 1, N'9000', 2, 10, 15, 1, 3)
INSERT [dbo].[Product] ([ID_Product], [Articul], [Name], [DescriptionProduct], [ID_Category], [Photo], [ID_Manufacture], [Cost], [CurrentDiscount], [MaxDiscount], [QuantityStock], [ID_UnitMeasurement], [ID_Supplier]) VALUES (17, N'Q836H4', N'Фланель рубашечная', N'Фланель арт 535 рубашечная шириной 150 см с изображением на ткани — клетка; цветовая гамма: светло-коричневая, синий-королевский.', 3, N'\Resource\picture.png', 4, N'1350', 4, 5, 7, 1, 3)
INSERT [dbo].[Product] ([ID_Product], [Articul], [Name], [DescriptionProduct], [ID_Category], [Photo], [ID_Manufacture], [Cost], [CurrentDiscount], [MaxDiscount], [QuantityStock], [ID_UnitMeasurement], [ID_Supplier]) VALUES (18, N'H483D9', N'Фланель детская H483D9', N'Фланель детская 21212-2 шириной 90 см с изображением на ткани — россыпь звездочек; цветовая гамма: баклажан, оранжевый, розовая.', 1, N'\Resource\picture.png', 3, N'318', 2, 5, 18, 1, 2)
INSERT [dbo].[Product] ([ID_Product], [Articul], [Name], [DescriptionProduct], [ID_Category], [Photo], [ID_Manufacture], [Cost], [CurrentDiscount], [MaxDiscount], [QuantityStock], [ID_UnitMeasurement], [ID_Supplier]) VALUES (19, N'O947D8', N'Ткань для скатертей под рогожку', N'Ткань для скатертей под рогожку «рис 18825» шириной 150 см с изображением на ткани — ромашки, россыпь цветов; цветовая гамма: красная, синяя.', 3, N'\Resource\picture.png', 4, N'3550', 3, 10, 9, 1, 2)
INSERT [dbo].[Product] ([ID_Product], [Articul], [Name], [DescriptionProduct], [ID_Category], [Photo], [ID_Manufacture], [Cost], [CurrentDiscount], [MaxDiscount], [QuantityStock], [ID_UnitMeasurement], [ID_Supplier]) VALUES (20, N'R983K4', N'Сатин «Серо-бежевый» однотонный', N'Сатин «Серо-бежевый» однотонный шириной 250 см с изображением на ткани цветовая гамма: серо-бежевая.', 2, N'\Resource\picture.png', 2, N'1645', 2, 15, 13, 1, 2)
INSERT [dbo].[Product] ([ID_Product], [Articul], [Name], [DescriptionProduct], [ID_Category], [Photo], [ID_Manufacture], [Cost], [CurrentDiscount], [MaxDiscount], [QuantityStock], [ID_UnitMeasurement], [ID_Supplier]) VALUES (21, N'U947E9', N'Муслин белый горошек на однотонном фоне', N'Муслин белый горошек на однотонном фоне шириной 150 см с изображением на ткани — мелкий горошек; цветовая гамма: желтая.', 1, N'\Resource\picture.png', 2, N'3411', 3, 10, 4, 1, 1)
INSERT [dbo].[Product] ([ID_Product], [Articul], [Name], [DescriptionProduct], [ID_Category], [Photo], [ID_Manufacture], [Cost], [CurrentDiscount], [MaxDiscount], [QuantityStock], [ID_UnitMeasurement], [ID_Supplier]) VALUES (22, N'H497J3', N'Ситец детский', N'Ситец детский шириной 95 см с изображением на ткани — котята, сердечки; цветовая гамма: белоземельная, оранжевый.', 1, N'\Resource\picture.png', 1, N'523', 2, 5, 8, 1, 1)
INSERT [dbo].[Product] ([ID_Product], [Articul], [Name], [DescriptionProduct], [ID_Category], [Photo], [ID_Manufacture], [Cost], [CurrentDiscount], [MaxDiscount], [QuantityStock], [ID_UnitMeasurement], [ID_Supplier]) VALUES (23, N'N394K2', N'Ткань поплин «Лакшери»', N'Ткань поплин «Лакшери» шириной 220 см с изображением на ткани — надписи, сердечки; цветовая гамма: белая, красная, черная. ', 2, N'\Resource\picture.png', 2, N'30660', 4, 10, 15, 1, 2)
INSERT [dbo].[Product] ([ID_Product], [Articul], [Name], [DescriptionProduct], [ID_Category], [Photo], [ID_Manufacture], [Cost], [CurrentDiscount], [MaxDiscount], [QuantityStock], [ID_UnitMeasurement], [ID_Supplier]) VALUES (24, N'P495H8', N'Поплин «Густав»', N'Поплин «Густав» шириной 220 см с изображением на ткани — листья, папортник; цветовая гамма: зеленая, светло-серая.', 2, N'\Resource\picture.png', 3, N'1000', 2, 15, 14, 1, 3)
INSERT [dbo].[Product] ([ID_Product], [Articul], [Name], [DescriptionProduct], [ID_Category], [Photo], [ID_Manufacture], [Cost], [CurrentDiscount], [MaxDiscount], [QuantityStock], [ID_UnitMeasurement], [ID_Supplier]) VALUES (25, N'X846D3', N'Ситец детский', N'Ситец детский шириной 95 см с изображением на ткани — жираф, полумесяц, пчелки; цветовая гамма: темно-фиолетовая.', 1, N'\Resource\picture.png', 2, N'9300', 3, 25, 5, 1, 3)
INSERT [dbo].[Product] ([ID_Product], [Articul], [Name], [DescriptionProduct], [ID_Category], [Photo], [ID_Manufacture], [Cost], [CurrentDiscount], [MaxDiscount], [QuantityStock], [ID_UnitMeasurement], [ID_Supplier]) VALUES (26, N'N385L2', N'Сатин «Фисташковый» однотонный', N'Сатин «Фисташковый» однотонный шириной 250 см с изображением на ткани цветовая гамма: фисташка.', 2, N'\Resource\picture.png', 1, N'7000', 2, 20, 2, 1, 1)
INSERT [dbo].[Product] ([ID_Product], [Articul], [Name], [DescriptionProduct], [ID_Category], [Photo], [ID_Manufacture], [Cost], [CurrentDiscount], [MaxDiscount], [QuantityStock], [ID_UnitMeasurement], [ID_Supplier]) VALUES (27, N'V378J3', N'Ситец детский', N'Ситец детский шириной 95 см с изображением на ткани — котенок, облака, полумесяц, радуга; цветовая гамма: бледно-розовая, голубая, салатовая, серо-бежевая.', 1, N'\Resource\picture.png', 3, N'2400', 3, 15, 14, 1, 1)
INSERT [dbo].[Product] ([ID_Product], [Articul], [Name], [DescriptionProduct], [ID_Category], [Photo], [ID_Manufacture], [Cost], [CurrentDiscount], [MaxDiscount], [QuantityStock], [ID_UnitMeasurement], [ID_Supplier]) VALUES (28, N'K284U8', N'Бязь детская «Самолеты»', N'Бязь детская «Самолеты» шириной 150 см с изображением на ткани — игрушки, самолетики; цветовая гамма: белая, зеленая, синяя. ', 1, N'\Resource\picture.png', 2, N'5100', 3, 25, 2, 1, 1)
INSERT [dbo].[Product] ([ID_Product], [Articul], [Name], [DescriptionProduct], [ID_Category], [Photo], [ID_Manufacture], [Cost], [CurrentDiscount], [MaxDiscount], [QuantityStock], [ID_UnitMeasurement], [ID_Supplier]) VALUES (29, N'N387I8', N'Полотно вафельное «Кухня»', N'Полотно вафельное «Кухня» шириной 50 см с изображением на ткани — кухня; цветовая гамма: желтая, малина. ', 3, N'\Resource\picture.png', 1, N'1000', 3, 15, 5, 1, 2)
INSERT [dbo].[Product] ([ID_Product], [Articul], [Name], [DescriptionProduct], [ID_Category], [Photo], [ID_Manufacture], [Cost], [CurrentDiscount], [MaxDiscount], [QuantityStock], [ID_UnitMeasurement], [ID_Supplier]) VALUES (30, N'I483H3', N'Ткань поплин «Вивьен»', N'Ткань поплин «Вивьен» шириной 220 см с изображением на ткани — горошек; цветовая гамма: синяя, фисташка.', 2, N'\Resource\picture.png', 1, N'11300', 2, 10, 5, 1, 2)
INSERT [dbo].[Product] ([ID_Product], [Articul], [Name], [DescriptionProduct], [ID_Category], [Photo], [ID_Manufacture], [Cost], [CurrentDiscount], [MaxDiscount], [QuantityStock], [ID_UnitMeasurement], [ID_Supplier]) VALUES (31, N'T981M7', N'тестирование 3', N'вцфрпарапрлод', 1, N'\Resource\picture.png', 1, N'2000', 0, 0, 2, 1, 1)
INSERT [dbo].[Product] ([ID_Product], [Articul], [Name], [DescriptionProduct], [ID_Category], [Photo], [ID_Manufacture], [Cost], [CurrentDiscount], [MaxDiscount], [QuantityStock], [ID_UnitMeasurement], [ID_Supplier]) VALUES (32, N'T365O1', N'тестирование 2', N'рпаопува', 2, N'\Resource\E112C6.jpg', 1, N'150', 0, 0, 3, 1, 1)
GO
INSERT [dbo].[Role] ([ID_Role], [Role]) VALUES (1, N'Администратор')
INSERT [dbo].[Role] ([ID_Role], [Role]) VALUES (2, N'Клиент')
INSERT [dbo].[Role] ([ID_Role], [Role]) VALUES (3, N'Менеджер')
GO
INSERT [dbo].[StatusOrder] ([ID_Status], [Status]) VALUES (1, N'Завершен')
INSERT [dbo].[StatusOrder] ([ID_Status], [Status]) VALUES (2, N'Новый ')
GO
INSERT [dbo].[Supplier] ([ID_Supplier], [Name]) VALUES (1, N'ГК Петров')
INSERT [dbo].[Supplier] ([ID_Supplier], [Name]) VALUES (2, N'ООО Афо-Тек')
INSERT [dbo].[Supplier] ([ID_Supplier], [Name]) VALUES (3, N'Раута')
GO
INSERT [dbo].[UnitMeasurement] ([ID_UnitMeasurement], [Name]) VALUES (1, N'Рулон')
GO
INSERT [dbo].[Users] ([ID_User], [FIO], [Login], [Password], [ID_Role]) VALUES (1, N'Лавров Богдан Львович', N'8lf0g@yandex.ru', N'2L6KZG', 1)
INSERT [dbo].[Users] ([ID_User], [FIO], [Login], [Password], [ID_Role]) VALUES (2, N'Смирнова Полина Фёдоровна', N'1zx8@yandex.ru', N'uzWC67', 1)
INSERT [dbo].[Users] ([ID_User], [FIO], [Login], [Password], [ID_Role]) VALUES (3, N'Полякова София Данииловна', N'x@mail.ru', N'8ntwUp', 1)
INSERT [dbo].[Users] ([ID_User], [FIO], [Login], [Password], [ID_Role]) VALUES (4, N'Чеботарева Марина Данииловна', N'34d@gmail.com', N'YOyhfR', 3)
INSERT [dbo].[Users] ([ID_User], [FIO], [Login], [Password], [ID_Role]) VALUES (5, N'Ермолов Адам Иванович', N'pxacl@mail.ru', N'RSbvHv', 3)
INSERT [dbo].[Users] ([ID_User], [FIO], [Login], [Password], [ID_Role]) VALUES (6, N'Васильев Андрей Кириллович', N'7o1@gmail.com', N'rwVDh9', 3)
INSERT [dbo].[Users] ([ID_User], [FIO], [Login], [Password], [ID_Role]) VALUES (7, N'Маслов Максим Иванович', N'1@gmail.com', N'LdNyos', 2)
INSERT [dbo].[Users] ([ID_User], [FIO], [Login], [Password], [ID_Role]) VALUES (8, N'Симонов Михаил Тимурович', N'iut@gmail.com', N'gynQMT', 2)
INSERT [dbo].[Users] ([ID_User], [FIO], [Login], [Password], [ID_Role]) VALUES (9, N'Павлова Ксения Михайловна', N'e3t@outlook.com', N'AtnDjr', 2)
INSERT [dbo].[Users] ([ID_User], [FIO], [Login], [Password], [ID_Role]) VALUES (10, N'Трифонов Григорий Юрьевич', N'41clb6o2g@yandex.ru', N'JlFRCZ', 2)
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_PickUpPoint] FOREIGN KEY([ID_PickUp])
REFERENCES [dbo].[PickUpPoint] ([ID_PickUp])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_PickUpPoint]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_StatusOrder] FOREIGN KEY([ID_StatusOrder])
REFERENCES [dbo].[StatusOrder] ([ID_Status])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_StatusOrder]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_Users] FOREIGN KEY([ID_Client])
REFERENCES [dbo].[Users] ([ID_User])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_Users]
GO
ALTER TABLE [dbo].[OrderProduct]  WITH CHECK ADD  CONSTRAINT [FK_OrderProduct_Order] FOREIGN KEY([ID_Order])
REFERENCES [dbo].[Order] ([ID_Order])
GO
ALTER TABLE [dbo].[OrderProduct] CHECK CONSTRAINT [FK_OrderProduct_Order]
GO
ALTER TABLE [dbo].[OrderProduct]  WITH CHECK ADD  CONSTRAINT [FK_OrderProduct_Product] FOREIGN KEY([ID_Product])
REFERENCES [dbo].[Product] ([ID_Product])
GO
ALTER TABLE [dbo].[OrderProduct] CHECK CONSTRAINT [FK_OrderProduct_Product]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_CategoryProduct] FOREIGN KEY([ID_Category])
REFERENCES [dbo].[CategoryProduct] ([ID_Category])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_CategoryProduct]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_ManufactureProduct] FOREIGN KEY([ID_Manufacture])
REFERENCES [dbo].[ManufactureProduct] ([ID_Manufacturer])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_ManufactureProduct]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Supplier] FOREIGN KEY([ID_Supplier])
REFERENCES [dbo].[Supplier] ([ID_Supplier])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Supplier]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_UnitMeasurement] FOREIGN KEY([ID_UnitMeasurement])
REFERENCES [dbo].[UnitMeasurement] ([ID_UnitMeasurement])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_UnitMeasurement]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Users_Role] FOREIGN KEY([ID_Role])
REFERENCES [dbo].[Role] ([ID_Role])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_Users_Role]
GO
