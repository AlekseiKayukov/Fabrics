USE [master]
GO
/****** Object:  Database [Trade]    Script Date: 27.03.2024 19:49:19 ******/
CREATE DATABASE [Trade]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Trade', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Trade.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Trade_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Trade_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Trade] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Trade].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Trade] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Trade] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Trade] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Trade] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Trade] SET ARITHABORT OFF 
GO
ALTER DATABASE [Trade] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Trade] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Trade] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Trade] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Trade] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Trade] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Trade] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Trade] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Trade] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Trade] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Trade] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Trade] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Trade] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Trade] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Trade] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Trade] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Trade] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Trade] SET RECOVERY FULL 
GO
ALTER DATABASE [Trade] SET  MULTI_USER 
GO
ALTER DATABASE [Trade] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Trade] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Trade] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Trade] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Trade] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Trade] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'Trade', N'ON'
GO
ALTER DATABASE [Trade] SET QUERY_STORE = OFF
GO
USE [Trade]
GO
/****** Object:  Table [dbo].[Address]    Script Date: 27.03.2024 19:49:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Address](
	[Id] [int] NOT NULL,
	[StreetId] [int] NOT NULL,
	[House] [nvarchar](50) NULL,
 CONSTRAINT [PK_Address] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 27.03.2024 19:49:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[Id] [int] NOT NULL,
	[Category] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[City]    Script Date: 27.03.2024 19:49:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[City](
	[Id] [int] NOT NULL,
	[City] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_City] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Manufacturer]    Script Date: 27.03.2024 19:49:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Manufacturer](
	[Id] [int] NOT NULL,
	[Manufacturer] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Manufacturer] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 27.03.2024 19:49:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[Id] [int] NOT NULL,
	[ProductId] [nvarchar](50) NOT NULL,
	[OrderDate] [date] NOT NULL,
	[DeliveryData] [date] NOT NULL,
	[PointId] [int] NOT NULL,
	[UserId] [int] NULL,
	[Code] [int] NOT NULL,
	[StatusId] [int] NOT NULL,
	[Count] [int] NOT NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Point]    Script Date: 27.03.2024 19:49:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Point](
	[Id] [int] NOT NULL,
	[PostCode] [int] NOT NULL,
	[CityId] [int] NOT NULL,
	[AddressId] [int] NOT NULL,
 CONSTRAINT [PK_Point] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 27.03.2024 19:49:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[Id] [nvarchar](50) NOT NULL,
	[Title] [nvarchar](50) NOT NULL,
	[UnitId] [int] NOT NULL,
	[Price] [money] NOT NULL,
	[MaxDiscount] [float] NOT NULL,
	[ManufacturerId] [int] NOT NULL,
	[SupplierId] [int] NOT NULL,
	[CategoryId] [int] NOT NULL,
	[CurrentDiscount] [int] NOT NULL,
	[CountWorkhouse] [int] NOT NULL,
	[Description] [nvarchar](200) NOT NULL,
	[PathImage] [nvarchar](50) NULL,
	[Image] [image] NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 27.03.2024 19:49:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[Id] [int] NOT NULL,
	[Role] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Status]    Script Date: 27.03.2024 19:49:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Status](
	[Id] [int] NOT NULL,
	[Status] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Status] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Street]    Script Date: 27.03.2024 19:49:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Street](
	[Id] [int] NOT NULL,
	[Street] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Street] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Supplier]    Script Date: 27.03.2024 19:49:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Supplier](
	[Id] [int] NOT NULL,
	[Supplier] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Supplier] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Unit]    Script Date: 27.03.2024 19:49:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Unit](
	[Id] [int] NOT NULL,
	[Unit] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Unit] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 27.03.2024 19:49:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[Id] [int] NOT NULL,
	[RoleId] [int] NOT NULL,
	[FullName] [nvarchar](50) NOT NULL,
	[Login] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Address] ([Id], [StreetId], [House]) VALUES (1, 1, NULL)
INSERT [dbo].[Address] ([Id], [StreetId], [House]) VALUES (2, 2, N'32')
INSERT [dbo].[Address] ([Id], [StreetId], [House]) VALUES (3, 3, N'41')
INSERT [dbo].[Address] ([Id], [StreetId], [House]) VALUES (4, 4, N'28')
INSERT [dbo].[Address] ([Id], [StreetId], [House]) VALUES (5, 5, N'32')
INSERT [dbo].[Address] ([Id], [StreetId], [House]) VALUES (6, 6, N'44')
INSERT [dbo].[Address] ([Id], [StreetId], [House]) VALUES (7, 7, N'1')
INSERT [dbo].[Address] ([Id], [StreetId], [House]) VALUES (8, 7, N'20')
INSERT [dbo].[Address] ([Id], [StreetId], [House]) VALUES (9, 7, N'43')
INSERT [dbo].[Address] ([Id], [StreetId], [House]) VALUES (10, 8, N'17')
INSERT [dbo].[Address] ([Id], [StreetId], [House]) VALUES (11, 8, N'26')
INSERT [dbo].[Address] ([Id], [StreetId], [House]) VALUES (12, 9, N'44')
INSERT [dbo].[Address] ([Id], [StreetId], [House]) VALUES (13, 9, N'47')
INSERT [dbo].[Address] ([Id], [StreetId], [House]) VALUES (14, 10, N'26')
INSERT [dbo].[Address] ([Id], [StreetId], [House]) VALUES (15, 11, N'50')
INSERT [dbo].[Address] ([Id], [StreetId], [House]) VALUES (16, 12, N'30')
INSERT [dbo].[Address] ([Id], [StreetId], [House]) VALUES (17, 13, N'12')
INSERT [dbo].[Address] ([Id], [StreetId], [House]) VALUES (18, 14, N'19')
INSERT [dbo].[Address] ([Id], [StreetId], [House]) VALUES (19, 15, N'19')
INSERT [dbo].[Address] ([Id], [StreetId], [House]) VALUES (20, 16, N'49')
INSERT [dbo].[Address] ([Id], [StreetId], [House]) VALUES (21, 17, N'46')
INSERT [dbo].[Address] ([Id], [StreetId], [House]) VALUES (22, 18, N'8')
INSERT [dbo].[Address] ([Id], [StreetId], [House]) VALUES (23, 19, N'35')
INSERT [dbo].[Address] ([Id], [StreetId], [House]) VALUES (24, 20, N'4')
INSERT [dbo].[Address] ([Id], [StreetId], [House]) VALUES (25, 21, N'46')
INSERT [dbo].[Address] ([Id], [StreetId], [House]) VALUES (26, 22, N'13')
INSERT [dbo].[Address] ([Id], [StreetId], [House]) VALUES (27, 23, N'25')
INSERT [dbo].[Address] ([Id], [StreetId], [House]) VALUES (28, 24, N'46')
INSERT [dbo].[Address] ([Id], [StreetId], [House]) VALUES (29, 25, N'30')
INSERT [dbo].[Address] ([Id], [StreetId], [House]) VALUES (30, 26, N'43')
INSERT [dbo].[Address] ([Id], [StreetId], [House]) VALUES (31, 27, N'8')
INSERT [dbo].[Address] ([Id], [StreetId], [House]) VALUES (32, 28, N'1')
INSERT [dbo].[Address] ([Id], [StreetId], [House]) VALUES (33, 28, N'3')
INSERT [dbo].[Address] ([Id], [StreetId], [House]) VALUES (34, 29, N'50')
INSERT [dbo].[Address] ([Id], [StreetId], [House]) VALUES (35, 30, N'24')
INSERT [dbo].[Address] ([Id], [StreetId], [House]) VALUES (36, 30, N'40')
GO
INSERT [dbo].[Category] ([Id], [Category]) VALUES (1, N'Детские ткани')
INSERT [dbo].[Category] ([Id], [Category]) VALUES (2, N'Постельные ткани')
INSERT [dbo].[Category] ([Id], [Category]) VALUES (3, N'Ткани для изделий')
GO
INSERT [dbo].[City] ([Id], [City]) VALUES (1, N'Кропоткин')
GO
INSERT [dbo].[Manufacturer] ([Id], [Manufacturer]) VALUES (1, N'БТК Текстиль')
INSERT [dbo].[Manufacturer] ([Id], [Manufacturer]) VALUES (2, N'Империя ткани')
INSERT [dbo].[Manufacturer] ([Id], [Manufacturer]) VALUES (3, N'Комильфо')
INSERT [dbo].[Manufacturer] ([Id], [Manufacturer]) VALUES (4, N'Май Фабрик')
GO
INSERT [dbo].[Order] ([Id], [ProductId], [OrderDate], [DeliveryData], [PointId], [UserId], [Code], [StatusId], [Count]) VALUES (1, N'B111C5', CAST(N'2022-05-10' AS Date), CAST(N'2022-05-16' AS Date), 27, 4, 811, 2, 5)
INSERT [dbo].[Order] ([Id], [ProductId], [OrderDate], [DeliveryData], [PointId], [UserId], [Code], [StatusId], [Count]) VALUES (2, N'T238C7', CAST(N'2022-05-10' AS Date), CAST(N'2022-05-16' AS Date), 27, 4, 811, 2, 7)
INSERT [dbo].[Order] ([Id], [ProductId], [OrderDate], [DeliveryData], [PointId], [UserId], [Code], [StatusId], [Count]) VALUES (3, N'E112C6', CAST(N'2022-05-11' AS Date), CAST(N'2022-05-17' AS Date), 5, NULL, 812, 2, 5)
INSERT [dbo].[Order] ([Id], [ProductId], [OrderDate], [DeliveryData], [PointId], [UserId], [Code], [StatusId], [Count]) VALUES (4, N'T238C7', CAST(N'2022-05-11' AS Date), CAST(N'2022-05-17' AS Date), 5, NULL, 812, 2, 9)
INSERT [dbo].[Order] ([Id], [ProductId], [OrderDate], [DeliveryData], [PointId], [UserId], [Code], [StatusId], [Count]) VALUES (5, N'M112C8', CAST(N'2022-05-12' AS Date), CAST(N'2022-05-18' AS Date), 29, NULL, 813, 2, 4)
INSERT [dbo].[Order] ([Id], [ProductId], [OrderDate], [DeliveryData], [PointId], [UserId], [Code], [StatusId], [Count]) VALUES (6, N'L293S9', CAST(N'2022-05-12' AS Date), CAST(N'2022-05-18' AS Date), 29, NULL, 813, 2, 8)
INSERT [dbo].[Order] ([Id], [ProductId], [OrderDate], [DeliveryData], [PointId], [UserId], [Code], [StatusId], [Count]) VALUES (7, N'M294G9', CAST(N'2022-05-13' AS Date), CAST(N'2022-05-19' AS Date), 10, NULL, 814, 2, 6)
INSERT [dbo].[Order] ([Id], [ProductId], [OrderDate], [DeliveryData], [PointId], [UserId], [Code], [StatusId], [Count]) VALUES (8, N'S384K2', CAST(N'2022-05-13' AS Date), CAST(N'2022-05-19' AS Date), 10, NULL, 814, 2, 1)
INSERT [dbo].[Order] ([Id], [ProductId], [OrderDate], [DeliveryData], [PointId], [UserId], [Code], [StatusId], [Count]) VALUES (9, N'W874J3', CAST(N'2022-05-14' AS Date), CAST(N'2022-05-20' AS Date), 31, 8, 815, 2, 2)
INSERT [dbo].[Order] ([Id], [ProductId], [OrderDate], [DeliveryData], [PointId], [UserId], [Code], [StatusId], [Count]) VALUES (10, N'Q836H4', CAST(N'2022-05-14' AS Date), CAST(N'2022-05-20' AS Date), 31, 8, 815, 2, 1)
INSERT [dbo].[Order] ([Id], [ProductId], [OrderDate], [DeliveryData], [PointId], [UserId], [Code], [StatusId], [Count]) VALUES (11, N'O947D8', CAST(N'2022-05-15' AS Date), CAST(N'2022-05-21' AS Date), 32, NULL, 816, 2, 4)
INSERT [dbo].[Order] ([Id], [ProductId], [OrderDate], [DeliveryData], [PointId], [UserId], [Code], [StatusId], [Count]) VALUES (12, N'R983K4', CAST(N'2022-05-15' AS Date), CAST(N'2022-05-21' AS Date), 32, NULL, 816, 2, 1)
INSERT [dbo].[Order] ([Id], [ProductId], [OrderDate], [DeliveryData], [PointId], [UserId], [Code], [StatusId], [Count]) VALUES (13, N'H497J3', CAST(N'2022-05-16' AS Date), CAST(N'2022-05-22' AS Date), 20, NULL, 817, 2, 2)
INSERT [dbo].[Order] ([Id], [ProductId], [OrderDate], [DeliveryData], [PointId], [UserId], [Code], [StatusId], [Count]) VALUES (14, N'N394K2', CAST(N'2022-05-16' AS Date), CAST(N'2022-05-22' AS Date), 20, NULL, 817, 2, 5)
INSERT [dbo].[Order] ([Id], [ProductId], [OrderDate], [DeliveryData], [PointId], [UserId], [Code], [StatusId], [Count]) VALUES (15, N'X846D3', CAST(N'2022-05-17' AS Date), CAST(N'2022-05-23' AS Date), 34, 5, 818, 1, 1)
INSERT [dbo].[Order] ([Id], [ProductId], [OrderDate], [DeliveryData], [PointId], [UserId], [Code], [StatusId], [Count]) VALUES (16, N'P495H8', CAST(N'2022-05-17' AS Date), CAST(N'2022-05-23' AS Date), 34, 5, 818, 1, 3)
INSERT [dbo].[Order] ([Id], [ProductId], [OrderDate], [DeliveryData], [PointId], [UserId], [Code], [StatusId], [Count]) VALUES (17, N'V378J3', CAST(N'2022-05-18' AS Date), CAST(N'2022-05-24' AS Date), 35, 9, 819, 2, 2)
INSERT [dbo].[Order] ([Id], [ProductId], [OrderDate], [DeliveryData], [PointId], [UserId], [Code], [StatusId], [Count]) VALUES (18, N'K284U8', CAST(N'2022-05-18' AS Date), CAST(N'2022-05-24' AS Date), 35, 9, 819, 2, 3)
INSERT [dbo].[Order] ([Id], [ProductId], [OrderDate], [DeliveryData], [PointId], [UserId], [Code], [StatusId], [Count]) VALUES (19, N'N387I8', CAST(N'2022-05-19' AS Date), CAST(N'2022-05-25' AS Date), 36, NULL, 820, 1, 6)
INSERT [dbo].[Order] ([Id], [ProductId], [OrderDate], [DeliveryData], [PointId], [UserId], [Code], [StatusId], [Count]) VALUES (20, N'I483H3', CAST(N'2022-05-19' AS Date), CAST(N'2022-05-25' AS Date), 36, NULL, 820, 1, 7)
GO
INSERT [dbo].[Point] ([Id], [PostCode], [CityId], [AddressId]) VALUES (1, 344288, 1, 32)
INSERT [dbo].[Point] ([Id], [PostCode], [CityId], [AddressId]) VALUES (2, 614164, 1, 29)
INSERT [dbo].[Point] ([Id], [PostCode], [CityId], [AddressId]) VALUES (3, 394242, 1, 9)
INSERT [dbo].[Point] ([Id], [PostCode], [CityId], [AddressId]) VALUES (4, 660540, 1, 27)
INSERT [dbo].[Point] ([Id], [PostCode], [CityId], [AddressId]) VALUES (5, 125837, 1, 36)
INSERT [dbo].[Point] ([Id], [PostCode], [CityId], [AddressId]) VALUES (6, 125703, 1, 20)
INSERT [dbo].[Point] ([Id], [PostCode], [CityId], [AddressId]) VALUES (7, 625283, 1, 21)
INSERT [dbo].[Point] ([Id], [PostCode], [CityId], [AddressId]) VALUES (8, 614611, 1, 15)
INSERT [dbo].[Point] ([Id], [PostCode], [CityId], [AddressId]) VALUES (9, 454311, 1, 18)
INSERT [dbo].[Point] ([Id], [PostCode], [CityId], [AddressId]) VALUES (10, 660007, 1, 19)
INSERT [dbo].[Point] ([Id], [PostCode], [CityId], [AddressId]) VALUES (11, 603036, 1, 24)
INSERT [dbo].[Point] ([Id], [PostCode], [CityId], [AddressId]) VALUES (12, 450983, 1, 11)
INSERT [dbo].[Point] ([Id], [PostCode], [CityId], [AddressId]) VALUES (13, 394782, 1, 33)
INSERT [dbo].[Point] ([Id], [PostCode], [CityId], [AddressId]) VALUES (14, 603002, 1, 4)
INSERT [dbo].[Point] ([Id], [PostCode], [CityId], [AddressId]) VALUES (15, 450558, 1, 16)
INSERT [dbo].[Point] ([Id], [PostCode], [CityId], [AddressId]) VALUES (16, 394060, 1, 30)
INSERT [dbo].[Point] ([Id], [PostCode], [CityId], [AddressId]) VALUES (17, 410661, 1, 34)
INSERT [dbo].[Point] ([Id], [PostCode], [CityId], [AddressId]) VALUES (18, 625590, 1, 8)
INSERT [dbo].[Point] ([Id], [PostCode], [CityId], [AddressId]) VALUES (19, 625683, 1, 1)
INSERT [dbo].[Point] ([Id], [PostCode], [CityId], [AddressId]) VALUES (20, 400562, 1, 5)
INSERT [dbo].[Point] ([Id], [PostCode], [CityId], [AddressId]) VALUES (21, 614510, 1, 13)
INSERT [dbo].[Point] ([Id], [PostCode], [CityId], [AddressId]) VALUES (22, 410542, 1, 25)
INSERT [dbo].[Point] ([Id], [PostCode], [CityId], [AddressId]) VALUES (23, 620839, 1, 31)
INSERT [dbo].[Point] ([Id], [PostCode], [CityId], [AddressId]) VALUES (24, 443890, 1, 7)
INSERT [dbo].[Point] ([Id], [PostCode], [CityId], [AddressId]) VALUES (25, 603379, 1, 28)
INSERT [dbo].[Point] ([Id], [PostCode], [CityId], [AddressId]) VALUES (26, 603721, 1, 3)
INSERT [dbo].[Point] ([Id], [PostCode], [CityId], [AddressId]) VALUES (27, 410172, 1, 26)
INSERT [dbo].[Point] ([Id], [PostCode], [CityId], [AddressId]) VALUES (28, 420151, 1, 2)
INSERT [dbo].[Point] ([Id], [PostCode], [CityId], [AddressId]) VALUES (29, 125061, 1, 22)
INSERT [dbo].[Point] ([Id], [PostCode], [CityId], [AddressId]) VALUES (30, 630370, 1, 35)
INSERT [dbo].[Point] ([Id], [PostCode], [CityId], [AddressId]) VALUES (31, 614753, 1, 23)
INSERT [dbo].[Point] ([Id], [PostCode], [CityId], [AddressId]) VALUES (32, 426030, 1, 12)
INSERT [dbo].[Point] ([Id], [PostCode], [CityId], [AddressId]) VALUES (33, 450375, 1, 6)
INSERT [dbo].[Point] ([Id], [PostCode], [CityId], [AddressId]) VALUES (34, 625560, 1, 17)
INSERT [dbo].[Point] ([Id], [PostCode], [CityId], [AddressId]) VALUES (35, 630201, 1, 10)
INSERT [dbo].[Point] ([Id], [PostCode], [CityId], [AddressId]) VALUES (36, 190949, 1, 14)
GO
INSERT [dbo].[Product] ([Id], [Title], [UnitId], [Price], [MaxDiscount], [ManufacturerId], [SupplierId], [CategoryId], [CurrentDiscount], [CountWorkhouse], [Description], [PathImage], [Image]) VALUES (N'B111C5', N'Поплин «Розовый жемчуг»', 1, 8500.0000, 5, 1, 3, 2, 4, 6, N'Поплин «Розовый жемчуг» шириной 220 см с изображением на ткани — крупные цветы, чайная роза; цветовая гамма: бледно-розовая.', N'B111C5.JPEG', NULL)
INSERT [dbo].[Product] ([Id], [Title], [UnitId], [Price], [MaxDiscount], [ManufacturerId], [SupplierId], [CategoryId], [CurrentDiscount], [CountWorkhouse], [Description], [PathImage], [Image]) VALUES (N'C384D8', N'Сатин «Дымчатая роза» однотонный', 1, 1133.0000, 10, 2, 3, 2, 3, 4, N'Сатин «Дымчатая роза» однотонный шириной 250 см с изображением на ткани цветовая гамма: розовый зефир.', NULL, NULL)
INSERT [dbo].[Product] ([Id], [Title], [UnitId], [Price], [MaxDiscount], [ManufacturerId], [SupplierId], [CategoryId], [CurrentDiscount], [CountWorkhouse], [Description], [PathImage], [Image]) VALUES (N'D938K3', N'Фланель однотонная светлая', 1, 1300.0000, 10, 4, 1, 3, 4, 10, N'Фланель однотонная светлая оптом шириной 90 см с изображением на ткани — однотонное; цветовая гамма: голубая, желтая, розовая, сирень, фисташка.', NULL, NULL)
INSERT [dbo].[Product] ([Id], [Title], [UnitId], [Price], [MaxDiscount], [ManufacturerId], [SupplierId], [CategoryId], [CurrentDiscount], [CountWorkhouse], [Description], [PathImage], [Image]) VALUES (N'E112C6', N'Муслин «Bej»', 1, 10500.0000, 15, 2, 2, 1, 3, 13, N'Муслин «Bej» однотонный шириной 140+/-5 см с изображением на ткани — однотонный; цветовая гамма: кофе с молоком.', N'E112C6.JPG', NULL)
INSERT [dbo].[Product] ([Id], [Title], [UnitId], [Price], [MaxDiscount], [ManufacturerId], [SupplierId], [CategoryId], [CurrentDiscount], [CountWorkhouse], [Description], [PathImage], [Image]) VALUES (N'F374S8', N'Фланель рубашечная', 1, 2100.0000, 5, 1, 3, 3, 2, 5, N'Фланель рубашечная шириной 150 см с изображением на ткани — клетка; цветовая гамма: светло-коричневая, синий-королевский.', NULL, NULL)
INSERT [dbo].[Product] ([Id], [Title], [UnitId], [Price], [MaxDiscount], [ManufacturerId], [SupplierId], [CategoryId], [CurrentDiscount], [CountWorkhouse], [Description], [PathImage], [Image]) VALUES (N'H483D9', N'Фланель детская H483D9', 1, 318.0000, 5, 3, 2, 1, 2, 18, N'Фланель детская 21212-2 шириной 90 см с изображением на ткани — россыпь звездочек; цветовая гамма: баклажан, оранжевый, розовая.', NULL, NULL)
INSERT [dbo].[Product] ([Id], [Title], [UnitId], [Price], [MaxDiscount], [ManufacturerId], [SupplierId], [CategoryId], [CurrentDiscount], [CountWorkhouse], [Description], [PathImage], [Image]) VALUES (N'H497J3', N'Ситец детский', 1, 523.0000, 5, 1, 1, 1, 2, 8, N'Ситец детский шириной 95 см с изображением на ткани — котята, сердечки; цветовая гамма: белоземельная, оранжевый.', NULL, NULL)
INSERT [dbo].[Product] ([Id], [Title], [UnitId], [Price], [MaxDiscount], [ManufacturerId], [SupplierId], [CategoryId], [CurrentDiscount], [CountWorkhouse], [Description], [PathImage], [Image]) VALUES (N'I483H3', N'Ткань поплин «Вивьен»', 1, 11300.0000, 10, 1, 2, 2, 2, 5, N'Ткань поплин «Вивьен» шириной 220 см с изображением на ткани — горошек; цветовая гамма: синяя, фисташка.', NULL, NULL)
INSERT [dbo].[Product] ([Id], [Title], [UnitId], [Price], [MaxDiscount], [ManufacturerId], [SupplierId], [CategoryId], [CurrentDiscount], [CountWorkhouse], [Description], [PathImage], [Image]) VALUES (N'K284U8', N'Бязь детская «Самолеты»', 1, 5100.0000, 25, 2, 1, 1, 3, 2, N'Бязь детская «Самолеты» шириной 150 см с изображением на ткани — игрушки, самолетики; цветовая гамма: белая, зеленая, синяя. ', NULL, NULL)
INSERT [dbo].[Product] ([Id], [Title], [UnitId], [Price], [MaxDiscount], [ManufacturerId], [SupplierId], [CategoryId], [CurrentDiscount], [CountWorkhouse], [Description], [PathImage], [Image]) VALUES (N'K839K3', N'Плюш белый в клетку', 1, 765.0000, 5, 2, 1, 1, 2, 3, N'Плюш белый в клетку шириной 180 см с изображением на ткани — клетка, однотонный; цветовая гамма: белая, однотонная.', N'K839K3.JPG ', NULL)
INSERT [dbo].[Product] ([Id], [Title], [UnitId], [Price], [MaxDiscount], [ManufacturerId], [SupplierId], [CategoryId], [CurrentDiscount], [CountWorkhouse], [Description], [PathImage], [Image]) VALUES (N'L293S9', N'Плюш розовый гладкий', 1, 30000.0000, 40, 3, 3, 1, 3, 2, N'Плюш розовый гладкий шириной 180 см с изображением на ткани — однотонный; цветовая гамма: однотонная, розовая.', N'L293S9.JPG', NULL)
INSERT [dbo].[Product] ([Id], [Title], [UnitId], [Price], [MaxDiscount], [ManufacturerId], [SupplierId], [CategoryId], [CurrentDiscount], [CountWorkhouse], [Description], [PathImage], [Image]) VALUES (N'M112C8', N'Бязь детская «Совята»', 1, 26000.0000, 20, 2, 3, 1, 2, 14, N'Бязь детская «Совята» шириной 150 см с изображением на ткани — совы; цветовая гамма: бордо, желтая, салатовая.', N'M112C8.JPG', NULL)
INSERT [dbo].[Product] ([Id], [Title], [UnitId], [Price], [MaxDiscount], [ManufacturerId], [SupplierId], [CategoryId], [CurrentDiscount], [CountWorkhouse], [Description], [PathImage], [Image]) VALUES (N'M294G9', N'Полотно вафельное «8 марта»', 1, 5130.0000, 5, 2, 3, 3, 2, 1, N'Полотно вафельное «8 марта» шириной 50 см с изображением на ткани — белые розы; цветовая гамма: розовая.', N'M294G9.JPG', NULL)
INSERT [dbo].[Product] ([Id], [Title], [UnitId], [Price], [MaxDiscount], [ManufacturerId], [SupplierId], [CategoryId], [CurrentDiscount], [CountWorkhouse], [Description], [PathImage], [Image]) VALUES (N'M398S9', N'Поплин Мокко', 1, 1800.0000, 15, 4, 1, 2, 2, 6, N'Поплин Мокко 220 см шириной 220 см с изображением на ткани — однотонное; цветовая гамма: коричневая, кофе, шоколад.', N'M398S9.JPG', NULL)
INSERT [dbo].[Product] ([Id], [Title], [UnitId], [Price], [MaxDiscount], [ManufacturerId], [SupplierId], [CategoryId], [CurrentDiscount], [CountWorkhouse], [Description], [PathImage], [Image]) VALUES (N'N283K3', N'Сатин «Миндальный» однотонный', 1, 6500.0000, 5, 3, 3, 2, 3, 7, N'Сатин «Миндальный» однотонный шириной 250 см с изображением на ткани цветовая гамма: миндаль. ', N'N283K3.JPG', NULL)
INSERT [dbo].[Product] ([Id], [Title], [UnitId], [Price], [MaxDiscount], [ManufacturerId], [SupplierId], [CategoryId], [CurrentDiscount], [CountWorkhouse], [Description], [PathImage], [Image]) VALUES (N'N385L2', N'Сатин «Фисташковый» однотонный', 1, 7000.0000, 20, 1, 1, 2, 2, 2, N'Сатин «Фисташковый» однотонный шириной 250 см с изображением на ткани цветовая гамма: фисташка.', NULL, NULL)
INSERT [dbo].[Product] ([Id], [Title], [UnitId], [Price], [MaxDiscount], [ManufacturerId], [SupplierId], [CategoryId], [CurrentDiscount], [CountWorkhouse], [Description], [PathImage], [Image]) VALUES (N'N387I8', N'Полотно вафельное «Кухня»', 1, 1000.0000, 15, 1, 2, 3, 3, 5, N'Полотно вафельное «Кухня» шириной 50 см с изображением на ткани — кухня; цветовая гамма: желтая, малина. ', NULL, NULL)
INSERT [dbo].[Product] ([Id], [Title], [UnitId], [Price], [MaxDiscount], [ManufacturerId], [SupplierId], [CategoryId], [CurrentDiscount], [CountWorkhouse], [Description], [PathImage], [Image]) VALUES (N'N394K2', N'Ткань поплин «Лакшери»', 1, 30660.0000, 10, 2, 2, 2, 4, 15, N'Ткань поплин «Лакшери» шириной 220 см с изображением на ткани — надписи, сердечки; цветовая гамма: белая, красная, черная. ', NULL, NULL)
INSERT [dbo].[Product] ([Id], [Title], [UnitId], [Price], [MaxDiscount], [ManufacturerId], [SupplierId], [CategoryId], [CurrentDiscount], [CountWorkhouse], [Description], [PathImage], [Image]) VALUES (N'O947D8', N'Ткань для скатертей под рогожку', 1, 3550.0000, 10, 4, 2, 3, 3, 9, N'Ткань для скатертей под рогожку «рис 18825» шириной 150 см с изображением на ткани — ромашки, россыпь цветов; цветовая гамма: красная, синяя.', NULL, NULL)
INSERT [dbo].[Product] ([Id], [Title], [UnitId], [Price], [MaxDiscount], [ManufacturerId], [SupplierId], [CategoryId], [CurrentDiscount], [CountWorkhouse], [Description], [PathImage], [Image]) VALUES (N'P495H8', N'Поплин «Густав»', 1, 1000.0000, 15, 3, 3, 2, 2, 14, N'Поплин «Густав» шириной 220 см с изображением на ткани — листья, папортник; цветовая гамма: зеленая, светло-серая.', NULL, NULL)
INSERT [dbo].[Product] ([Id], [Title], [UnitId], [Price], [MaxDiscount], [ManufacturerId], [SupplierId], [CategoryId], [CurrentDiscount], [CountWorkhouse], [Description], [PathImage], [Image]) VALUES (N'Q836H4', N'Фланель рубашечная', 1, 1350.0000, 5, 4, 3, 3, 4, 7, N'Фланель арт 535 рубашечная шириной 150 см с изображением на ткани — клетка; цветовая гамма: светло-коричневая, синий-королевский.', NULL, NULL)
INSERT [dbo].[Product] ([Id], [Title], [UnitId], [Price], [MaxDiscount], [ManufacturerId], [SupplierId], [CategoryId], [CurrentDiscount], [CountWorkhouse], [Description], [PathImage], [Image]) VALUES (N'R748K3', N'Поплин Морская волна', 1, 2300.0000, 15, 4, 1, 2, 2, 6, N'Поплин Морская волна 220 см шириной 220 см с изображением на ткани — однотонное; цветовая гамма: аквамарин, бирюзовая.', NULL, NULL)
INSERT [dbo].[Product] ([Id], [Title], [UnitId], [Price], [MaxDiscount], [ManufacturerId], [SupplierId], [CategoryId], [CurrentDiscount], [CountWorkhouse], [Description], [PathImage], [Image]) VALUES (N'R983K4', N'Сатин «Серо-бежевый» однотонный', 1, 1645.0000, 15, 2, 2, 2, 2, 13, N'Сатин «Серо-бежевый» однотонный шириной 250 см с изображением на ткани цветовая гамма: серо-бежевая.', NULL, NULL)
INSERT [dbo].[Product] ([Id], [Title], [UnitId], [Price], [MaxDiscount], [ManufacturerId], [SupplierId], [CategoryId], [CurrentDiscount], [CountWorkhouse], [Description], [PathImage], [Image]) VALUES (N'S384K2', N'Фланель черная', 1, 69000.0000, 40, 1, 1, 3, 4, 2, N'Фланель черная оптом шириной 90 см с изображением на ткани — однотонное; цветовая гамма: черная.', N'S384K2.JPG', NULL)
INSERT [dbo].[Product] ([Id], [Title], [UnitId], [Price], [MaxDiscount], [ManufacturerId], [SupplierId], [CategoryId], [CurrentDiscount], [CountWorkhouse], [Description], [PathImage], [Image]) VALUES (N'T238C7', N'Муслин «Gri»', 1, 6500.0000, 15, 1, 2, 1, 2, 12, N'Муслин «Gri» однотонный шириной 140+/-5 см с изображением на ткани — однотонный; цветовая гамма: серая.', N'T238C7.JPG', NULL)
INSERT [dbo].[Product] ([Id], [Title], [UnitId], [Price], [MaxDiscount], [ManufacturerId], [SupplierId], [CategoryId], [CurrentDiscount], [CountWorkhouse], [Description], [PathImage], [Image]) VALUES (N'U947E9', N'Муслин белый горошек на однотонном фоне', 1, 3411.0000, 10, 2, 1, 1, 3, 4, N'Муслин белый горошек на однотонном фоне шириной 150 см с изображением на ткани — мелкий горошек; цветовая гамма: желтая.', NULL, NULL)
INSERT [dbo].[Product] ([Id], [Title], [UnitId], [Price], [MaxDiscount], [ManufacturerId], [SupplierId], [CategoryId], [CurrentDiscount], [CountWorkhouse], [Description], [PathImage], [Image]) VALUES (N'V378J3', N'Ситец детский', 1, 2400.0000, 15, 3, 1, 1, 3, 14, N'Ситец детский шириной 95 см с изображением на ткани — котенок, облака, полумесяц, радуга; цветовая гамма: бледно-розовая, голубая, салатовая, серо-бежевая.', NULL, NULL)
INSERT [dbo].[Product] ([Id], [Title], [UnitId], [Price], [MaxDiscount], [ManufacturerId], [SupplierId], [CategoryId], [CurrentDiscount], [CountWorkhouse], [Description], [PathImage], [Image]) VALUES (N'W874J3', N'Ткань поплин «Натурель»', 1, 1600.0000, 5, 1, 1, 2, 3, 9, N'Ткань поплин «Натурель» шириной 220 см с изображением на ткани — мелкие цветы; цветовая гамма: пепельная, розовая. ', NULL, NULL)
INSERT [dbo].[Product] ([Id], [Title], [UnitId], [Price], [MaxDiscount], [ManufacturerId], [SupplierId], [CategoryId], [CurrentDiscount], [CountWorkhouse], [Description], [PathImage], [Image]) VALUES (N'X846D3', N'Ситец детский', 1, 9300.0000, 25, 2, 3, 1, 3, 5, N'Ситец детский шириной 95 см с изображением на ткани — жираф, полумесяц, пчелки; цветовая гамма: темно-фиолетовая.', NULL, NULL)
INSERT [dbo].[Product] ([Id], [Title], [UnitId], [Price], [MaxDiscount], [ManufacturerId], [SupplierId], [CategoryId], [CurrentDiscount], [CountWorkhouse], [Description], [PathImage], [Image]) VALUES (N'Z937S2', N'Поплин Голубой', 1, 9000.0000, 10, 1, 3, 2, 2, 15, N'Поплин Голубой 220 см шириной 220 см с изображением на ткани — однотонное; цветовая гамма: голубая.', NULL, NULL)
GO
INSERT [dbo].[Role] ([Id], [Role]) VALUES (1, N'Администратор')
INSERT [dbo].[Role] ([Id], [Role]) VALUES (2, N'Клиент')
INSERT [dbo].[Role] ([Id], [Role]) VALUES (3, N'Менеджер')
GO
INSERT [dbo].[Status] ([Id], [Status]) VALUES (1, N'Завершен')
INSERT [dbo].[Status] ([Id], [Status]) VALUES (2, N'Новый')
GO
INSERT [dbo].[Street] ([Id], [Street]) VALUES (1, N'8 Марта')
INSERT [dbo].[Street] ([Id], [Street]) VALUES (2, N'Вишневая')
INSERT [dbo].[Street] ([Id], [Street]) VALUES (3, N'Гоголя')
INSERT [dbo].[Street] ([Id], [Street]) VALUES (4, N'Дзержинского')
INSERT [dbo].[Street] ([Id], [Street]) VALUES (5, N'Зеленая')
INSERT [dbo].[Street] ([Id], [Street]) VALUES (6, N'Клубная')
INSERT [dbo].[Street] ([Id], [Street]) VALUES (7, N'Коммунистическая')
INSERT [dbo].[Street] ([Id], [Street]) VALUES (8, N'Комсомольская')
INSERT [dbo].[Street] ([Id], [Street]) VALUES (9, N'Маяковского')
INSERT [dbo].[Street] ([Id], [Street]) VALUES (10, N'Мичурина')
INSERT [dbo].[Street] ([Id], [Street]) VALUES (11, N'Молодежная')
INSERT [dbo].[Street] ([Id], [Street]) VALUES (12, N'Набережная')
INSERT [dbo].[Street] ([Id], [Street]) VALUES (13, N'Некрасова')
INSERT [dbo].[Street] ([Id], [Street]) VALUES (14, N'Новая')
INSERT [dbo].[Street] ([Id], [Street]) VALUES (15, N'Октябрьская')
INSERT [dbo].[Street] ([Id], [Street]) VALUES (16, N'Партизанская')
INSERT [dbo].[Street] ([Id], [Street]) VALUES (17, N'Победы')
INSERT [dbo].[Street] ([Id], [Street]) VALUES (18, N'Подгорная')
INSERT [dbo].[Street] ([Id], [Street]) VALUES (19, N'Полевая')
INSERT [dbo].[Street] ([Id], [Street]) VALUES (20, N'Садовая')
INSERT [dbo].[Street] ([Id], [Street]) VALUES (21, N'Светлая')
INSERT [dbo].[Street] ([Id], [Street]) VALUES (22, N'Северная')
INSERT [dbo].[Street] ([Id], [Street]) VALUES (23, N'Солнечная')
INSERT [dbo].[Street] ([Id], [Street]) VALUES (24, N'Спортивная')
INSERT [dbo].[Street] ([Id], [Street]) VALUES (25, N'Степная')
INSERT [dbo].[Street] ([Id], [Street]) VALUES (26, N'Фрунзе')
INSERT [dbo].[Street] ([Id], [Street]) VALUES (27, N'Цветочная')
INSERT [dbo].[Street] ([Id], [Street]) VALUES (28, N'Чехова')
INSERT [dbo].[Street] ([Id], [Street]) VALUES (29, N'Школьная')
INSERT [dbo].[Street] ([Id], [Street]) VALUES (30, N'Шоссейная')
GO
INSERT [dbo].[Supplier] ([Id], [Supplier]) VALUES (1, N'ГК Петров')
INSERT [dbo].[Supplier] ([Id], [Supplier]) VALUES (2, N'ООО Афо-Тек')
INSERT [dbo].[Supplier] ([Id], [Supplier]) VALUES (3, N'Раута')
GO
INSERT [dbo].[Unit] ([Id], [Unit]) VALUES (1, N'Рулон')
GO
INSERT [dbo].[User] ([Id], [RoleId], [FullName], [Login], [Password]) VALUES (1, 3, N'Васильев Андрей Кириллович', N'7o1@gmail.com', N'rwVDh9')
INSERT [dbo].[User] ([Id], [RoleId], [FullName], [Login], [Password]) VALUES (2, 3, N'Ермолов Адам Иванович', N'pxacl@mail.ru', N'RSbvHv')
INSERT [dbo].[User] ([Id], [RoleId], [FullName], [Login], [Password]) VALUES (3, 1, N'Лавров Богдан Львович', N'8lf0g@yandex.ru', N'2L6KZG')
INSERT [dbo].[User] ([Id], [RoleId], [FullName], [Login], [Password]) VALUES (4, 2, N'Маслов Максим Иванович', N'1@gmail.com', N'LdNyos')
INSERT [dbo].[User] ([Id], [RoleId], [FullName], [Login], [Password]) VALUES (5, 2, N'Павлова Ксения Михайловна', N'e3t@outlook.com', N'AtnDjr')
INSERT [dbo].[User] ([Id], [RoleId], [FullName], [Login], [Password]) VALUES (6, 1, N'Полякова София Данииловна', N'x@mail.ru', N'8ntwUp')
INSERT [dbo].[User] ([Id], [RoleId], [FullName], [Login], [Password]) VALUES (7, 2, N'Симонов Михаил Тимурович', N'iut@gmail.com', N'gynQMT')
INSERT [dbo].[User] ([Id], [RoleId], [FullName], [Login], [Password]) VALUES (8, 1, N'Смирнова Полина Фёдоровна', N'1zx8@yandex.ru', N'uzWC67')
INSERT [dbo].[User] ([Id], [RoleId], [FullName], [Login], [Password]) VALUES (9, 2, N'Трифонов Григорий Юрьевич', N'41clb6o2g@yandex.ru', N'JlFRCZ')
INSERT [dbo].[User] ([Id], [RoleId], [FullName], [Login], [Password]) VALUES (10, 3, N'Чеботарева Марина Данииловна', N'34d@gmail.com', N'YOyhfR')
GO
ALTER TABLE [dbo].[Address]  WITH CHECK ADD  CONSTRAINT [FK_Address_Street] FOREIGN KEY([StreetId])
REFERENCES [dbo].[Street] ([Id])
GO
ALTER TABLE [dbo].[Address] CHECK CONSTRAINT [FK_Address_Street]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_Point] FOREIGN KEY([PointId])
REFERENCES [dbo].[Point] ([Id])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_Point]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_Product] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Product] ([Id])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_Product]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_Status] FOREIGN KEY([StatusId])
REFERENCES [dbo].[Status] ([Id])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_Status]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_User] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_User]
GO
ALTER TABLE [dbo].[Point]  WITH CHECK ADD  CONSTRAINT [FK_Point_Address] FOREIGN KEY([AddressId])
REFERENCES [dbo].[Address] ([Id])
GO
ALTER TABLE [dbo].[Point] CHECK CONSTRAINT [FK_Point_Address]
GO
ALTER TABLE [dbo].[Point]  WITH CHECK ADD  CONSTRAINT [FK_Point_City] FOREIGN KEY([CityId])
REFERENCES [dbo].[City] ([Id])
GO
ALTER TABLE [dbo].[Point] CHECK CONSTRAINT [FK_Point_City]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Category] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Category] ([Id])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Category]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Manufacturer] FOREIGN KEY([ManufacturerId])
REFERENCES [dbo].[Manufacturer] ([Id])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Manufacturer]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Supplier] FOREIGN KEY([SupplierId])
REFERENCES [dbo].[Supplier] ([Id])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Supplier]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Unit] FOREIGN KEY([UnitId])
REFERENCES [dbo].[Unit] ([Id])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Unit]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK_User_Role] FOREIGN KEY([RoleId])
REFERENCES [dbo].[Role] ([Id])
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK_User_Role]
GO
USE [master]
GO
ALTER DATABASE [Trade] SET  READ_WRITE 
GO
