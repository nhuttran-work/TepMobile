USE [master]
GO
/****** Object:  Database [CloudKitchen]    Script Date: 12/8/2023 10:50:23 PM ******/
CREATE DATABASE [CloudKitchen]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'CloudKitchen', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSV_SHTP\MSSQL\DATA\CloudKitchen.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'CloudKitchen_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSV_SHTP\MSSQL\DATA\CloudKitchen_log.ldf' , SIZE = 73728KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [CloudKitchen] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [CloudKitchen].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [CloudKitchen] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [CloudKitchen] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [CloudKitchen] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [CloudKitchen] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [CloudKitchen] SET ARITHABORT OFF 
GO
ALTER DATABASE [CloudKitchen] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [CloudKitchen] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [CloudKitchen] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [CloudKitchen] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [CloudKitchen] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [CloudKitchen] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [CloudKitchen] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [CloudKitchen] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [CloudKitchen] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [CloudKitchen] SET  DISABLE_BROKER 
GO
ALTER DATABASE [CloudKitchen] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [CloudKitchen] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [CloudKitchen] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [CloudKitchen] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [CloudKitchen] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [CloudKitchen] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [CloudKitchen] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [CloudKitchen] SET RECOVERY FULL 
GO
ALTER DATABASE [CloudKitchen] SET  MULTI_USER 
GO
ALTER DATABASE [CloudKitchen] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [CloudKitchen] SET DB_CHAINING OFF 
GO
ALTER DATABASE [CloudKitchen] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [CloudKitchen] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [CloudKitchen] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [CloudKitchen] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [CloudKitchen] SET QUERY_STORE = OFF
GO
USE [CloudKitchen]
GO
/****** Object:  User [cloudkitchen]    Script Date: 12/8/2023 10:50:23 PM ******/
CREATE USER [cloudkitchen] FOR LOGIN [cloudkitchen] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 12/8/2023 10:50:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Accounts]    Script Date: 12/8/2023 10:50:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Accounts](
	[AccountId] [int] IDENTITY(1,1) NOT NULL,
	[Email] [varchar](100) NOT NULL,
	[Password] [varchar](50) NOT NULL,
	[Status] [int] NOT NULL,
	[IsConfirmed] [bit] NOT NULL,
	[RoleId] [int] NOT NULL,
 CONSTRAINT [PK_Accounts] PRIMARY KEY CLUSTERED 
(
	[AccountId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BankingAccounts]    Script Date: 12/8/2023 10:50:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BankingAccounts](
	[BankingAccountId] [int] IDENTITY(1,1) NOT NULL,
	[NumberAccount] [varchar](20) NOT NULL,
	[Status] [int] NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[LogoUrl] [varchar](max) NOT NULL,
	[KitchenCenterId] [int] NOT NULL,
 CONSTRAINT [PK_BankingAccounts] PRIMARY KEY CLUSTERED 
(
	[BankingAccountId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BrandAccounts]    Script Date: 12/8/2023 10:50:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BrandAccounts](
	[BrandId] [int] NOT NULL,
	[AccountId] [int] NOT NULL,
 CONSTRAINT [PK_BrandAccounts] PRIMARY KEY CLUSTERED 
(
	[BrandId] ASC,
	[AccountId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Brands]    Script Date: 12/8/2023 10:50:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Brands](
	[BrandId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](120) NOT NULL,
	[Address] [nvarchar](255) NOT NULL,
	[Logo] [varchar](max) NOT NULL,
	[Status] [int] NOT NULL,
	[BrandManagerEmail] [varchar](100) NOT NULL,
 CONSTRAINT [PK_Brands] PRIMARY KEY CLUSTERED 
(
	[BrandId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CashierMoneyExchanges]    Script Date: 12/8/2023 10:50:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CashierMoneyExchanges](
	[ExchangeId] [int] NOT NULL,
	[CashierId] [int] NOT NULL,
 CONSTRAINT [PK_CashierMoneyExchanges] PRIMARY KEY CLUSTERED 
(
	[ExchangeId] ASC,
	[CashierId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cashiers]    Script Date: 12/8/2023 10:50:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cashiers](
	[AccountId] [int] NOT NULL,
	[FullName] [nvarchar](80) NOT NULL,
	[Gender] [bit] NOT NULL,
	[DateOfBirth] [datetime2](7) NOT NULL,
	[Avatar] [varchar](max) NOT NULL,
	[CitizenNumber] [varchar](12) NOT NULL,
	[WalletId] [int] NOT NULL,
	[KitchenCenterId] [int] NOT NULL,
 CONSTRAINT [PK_Cashiers] PRIMARY KEY CLUSTERED 
(
	[AccountId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 12/8/2023 10:50:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[CategoryId] [int] IDENTITY(1,1) NOT NULL,
	[Code] [varchar](20) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[Type] [nvarchar](20) NOT NULL,
	[DisplayOrder] [int] NOT NULL,
	[Description] [nvarchar](100) NOT NULL,
	[ImageUrl] [varchar](max) NOT NULL,
	[Status] [int] NOT NULL,
	[BrandId] [int] NOT NULL,
 CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED 
(
	[CategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Configurations]    Script Date: 12/8/2023 10:50:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Configurations](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ScrawlingOrderStartTime] [time](7) NOT NULL,
	[ScrawlingOrderEndTime] [time](7) NOT NULL,
	[ScrawlingMoneyExchangeToKitchenCenter] [time](7) NOT NULL,
	[ScrawlingMoneyExchangeToStore] [time](7) NOT NULL,
 CONSTRAINT [PK_Configurations] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ExtraCategories]    Script Date: 12/8/2023 10:50:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ExtraCategories](
	[CategoryId] [int] IDENTITY(1,1) NOT NULL,
	[Status] [int] NOT NULL,
	[ExtraCategoryId] [int] NOT NULL,
	[ProductCategoryId] [int] NOT NULL,
 CONSTRAINT [PK_ExtraCategories] PRIMARY KEY CLUSTERED 
(
	[CategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KitchenCenterMoneyExchanges]    Script Date: 12/8/2023 10:50:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KitchenCenterMoneyExchanges](
	[ExchangeId] [int] NOT NULL,
	[KitchenCenterId] [int] NOT NULL,
 CONSTRAINT [PK_KitchenCenterMoneyExchanges] PRIMARY KEY CLUSTERED 
(
	[ExchangeId] ASC,
	[KitchenCenterId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KitchenCenters]    Script Date: 12/8/2023 10:50:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KitchenCenters](
	[KitchenCenterId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[Address] [nvarchar](255) NOT NULL,
	[Status] [int] NOT NULL,
	[Logo] [varchar](max) NOT NULL,
	[WalletId] [int] NOT NULL,
	[ManagerId] [int] NOT NULL,
 CONSTRAINT [PK_KitchenCenters] PRIMARY KEY CLUSTERED 
(
	[KitchenCenterId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MoneyExchanges]    Script Date: 12/8/2023 10:50:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MoneyExchanges](
	[ExchangeId] [int] IDENTITY(1,1) NOT NULL,
	[Amount] [decimal](9, 2) NOT NULL,
	[ExchangeType] [nvarchar](30) NOT NULL,
	[Content] [nvarchar](300) NOT NULL,
	[Status] [int] NOT NULL,
	[SenderId] [int] NOT NULL,
	[ReceiveId] [int] NOT NULL,
	[ExchangeImage] [varchar](max) NULL,
 CONSTRAINT [PK_MoneyExchanges] PRIMARY KEY CLUSTERED 
(
	[ExchangeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetails]    Script Date: 12/8/2023 10:50:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetails](
	[OrderDetailId] [int] IDENTITY(1,1) NOT NULL,
	[SellingPrice] [decimal](9, 2) NOT NULL,
	[Quantity] [int] NOT NULL,
	[Note] [nvarchar](200) NOT NULL,
	[DiscountPrice] [decimal](9, 2) NOT NULL,
	[MasterOrderDetailId] [int] NULL,
	[OrderId] [int] NOT NULL,
	[ProductId] [int] NOT NULL,
 CONSTRAINT [PK_OrderDetails] PRIMARY KEY CLUSTERED 
(
	[OrderDetailId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderHistories]    Script Date: 12/8/2023 10:50:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderHistories](
	[OrderHistoryId] [int] IDENTITY(1,1) NOT NULL,
	[Image] [varchar](max) NULL,
	[CreatedDate] [datetime2](7) NOT NULL,
	[SystemStatus] [varchar](20) NOT NULL,
	[PartnerOrderStatus] [varchar](20) NOT NULL,
	[OrderId] [int] NOT NULL,
 CONSTRAINT [PK_OrderHistories] PRIMARY KEY CLUSTERED 
(
	[OrderHistoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 12/8/2023 10:50:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[OrderPartnerId] [varchar](100) NOT NULL,
	[ShipperName] [nvarchar](100) NOT NULL,
	[ShipperPhone] [varchar](10) NOT NULL,
	[CustomerName] [nvarchar](100) NOT NULL,
	[CustomerPhone] [varchar](10) NOT NULL,
	[Note] [nvarchar](500) NULL,
	[PaymentMethod] [varchar](10) NOT NULL,
	[DeliveryFee] [decimal](9, 2) NOT NULL,
	[SubTotalPrice] [decimal](9, 2) NOT NULL,
	[TotalStoreDiscount] [decimal](9, 2) NOT NULL,
	[FinalTotalPrice] [decimal](9, 2) NOT NULL,
	[PromotionPrice] [decimal](9, 2) NOT NULL,
	[TaxPartnerCommission] [real] NOT NULL,
	[Tax] [real] NOT NULL,
	[SystemStatus] [varchar](20) NOT NULL,
	[PartnerId] [int] NOT NULL,
	[StoreId] [int] NOT NULL,
	[DisplayId] [varchar](100) NOT NULL,
	[Address] [nvarchar](250) NOT NULL,
	[Cutlery] [int] NULL,
	[PartnerOrderStatus] [varchar](20) NOT NULL,
	[ConfirmedBy] [int] NULL,
	[RejectedReason] [nvarchar](200) NULL,
	[StorePartnerCommission] [real] NOT NULL,
 CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PartnerProducts]    Script Date: 12/8/2023 10:50:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PartnerProducts](
	[ProductId] [int] NOT NULL,
	[PartnerId] [int] NOT NULL,
	[StoreId] [int] NOT NULL,
	[CreatedDate] [datetime2](7) NOT NULL,
	[MappedDate] [datetime2](7) NOT NULL,
	[ProductCode] [varchar](50) NOT NULL,
	[Status] [int] NOT NULL,
	[Price] [decimal](9, 2) NOT NULL,
	[UpdatedDate] [datetime2](7) NULL,
 CONSTRAINT [PK_PartnerProducts] PRIMARY KEY CLUSTERED 
(
	[ProductId] ASC,
	[PartnerId] ASC,
	[StoreId] ASC,
	[CreatedDate] ASC,
	[MappedDate] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Partners]    Script Date: 12/8/2023 10:50:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Partners](
	[PartnerId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Logo] [varchar](max) NULL,
	[WebUrl] [varchar](max) NULL,
	[Status] [int] NOT NULL,
	[TaxCommission] [real] NOT NULL,
 CONSTRAINT [PK_Partners] PRIMARY KEY CLUSTERED 
(
	[PartnerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 12/8/2023 10:50:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[ProductId] [int] IDENTITY(1,1) NOT NULL,
	[Code] [varchar](20) NOT NULL,
	[Name] [nvarchar](120) NOT NULL,
	[Description] [nvarchar](1000) NOT NULL,
	[SellingPrice] [decimal](9, 2) NOT NULL,
	[DiscountPrice] [decimal](9, 2) NOT NULL,
	[Size] [varchar](5) NULL,
	[Type] [nvarchar](20) NOT NULL,
	[Status] [int] NOT NULL,
	[Image] [varchar](max) NOT NULL,
	[DisplayOrder] [int] NOT NULL,
	[ParentProductId] [int] NULL,
	[HistoricalPrice] [decimal](9, 2) NOT NULL,
	[CategoryId] [int] NOT NULL,
	[BrandId] [int] NOT NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 12/8/2023 10:50:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[RoleId] [int] IDENTITY(1,1) NOT NULL,
	[RoleName] [varchar](80) NOT NULL,
 CONSTRAINT [PK_Roles] PRIMARY KEY CLUSTERED 
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ShipperPayments]    Script Date: 12/8/2023 10:50:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ShipperPayments](
	[PaymentId] [int] IDENTITY(1,1) NOT NULL,
	[Status] [int] NOT NULL,
	[Content] [nvarchar](300) NOT NULL,
	[Amount] [decimal](9, 2) NOT NULL,
	[CreateDate] [datetime2](7) NOT NULL,
	[CreateBy] [int] NOT NULL,
	[PaymentMethod] [varchar](20) NOT NULL,
	[OrderId] [int] NOT NULL,
	[KCBankingAccountId] [int] NULL,
 CONSTRAINT [PK_ShipperPayments] PRIMARY KEY CLUSTERED 
(
	[PaymentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StoreAccounts]    Script Date: 12/8/2023 10:50:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StoreAccounts](
	[StoreId] [int] NOT NULL,
	[AccountId] [int] NOT NULL,
 CONSTRAINT [PK_StoreAccounts] PRIMARY KEY CLUSTERED 
(
	[StoreId] ASC,
	[AccountId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StoreMoneyExchanges]    Script Date: 12/8/2023 10:50:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StoreMoneyExchanges](
	[ExchangeId] [int] NOT NULL,
	[StoreId] [int] NOT NULL,
 CONSTRAINT [PK_StoreMoneyExchanges] PRIMARY KEY CLUSTERED 
(
	[ExchangeId] ASC,
	[StoreId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StorePartners]    Script Date: 12/8/2023 10:50:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StorePartners](
	[StoreId] [int] NOT NULL,
	[PartnerId] [int] NOT NULL,
	[CreatedDate] [datetime2](7) NOT NULL,
	[UserName] [varchar](100) NOT NULL,
	[Password] [varchar](50) NOT NULL,
	[Commission] [real] NOT NULL,
	[Status] [int] NOT NULL,
 CONSTRAINT [PK_StorePartners] PRIMARY KEY CLUSTERED 
(
	[StoreId] ASC,
	[PartnerId] ASC,
	[CreatedDate] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Stores]    Script Date: 12/8/2023 10:50:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Stores](
	[StoreId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](80) NOT NULL,
	[Status] [int] NOT NULL,
	[Logo] [varchar](max) NOT NULL,
	[StoreManagerEmail] [varchar](100) NOT NULL,
	[RejectedReason] [nvarchar](250) NULL,
	[BrandId] [int] NOT NULL,
	[KitchenCenterId] [int] NOT NULL,
	[WalletId] [int] NULL,
 CONSTRAINT [PK_Stores] PRIMARY KEY CLUSTERED 
(
	[StoreId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Transactions]    Script Date: 12/8/2023 10:50:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Transactions](
	[TracsactionId] [int] IDENTITY(1,1) NOT NULL,
	[TransactionTime] [datetime2](7) NOT NULL,
	[Status] [int] NOT NULL,
	[ExchangeId] [int] NULL,
	[WalletId] [int] NOT NULL,
	[PaymentId] [int] NULL,
 CONSTRAINT [PK_Transactions] PRIMARY KEY CLUSTERED 
(
	[TracsactionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserDevices]    Script Date: 12/8/2023 10:50:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserDevices](
	[UserDeviceId] [int] IDENTITY(1,1) NOT NULL,
	[FCMToken] [varchar](max) NOT NULL,
	[AccountId] [int] NOT NULL,
 CONSTRAINT [PK_UserDevices] PRIMARY KEY CLUSTERED 
(
	[UserDeviceId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Wallets]    Script Date: 12/8/2023 10:50:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Wallets](
	[WalletId] [int] IDENTITY(1,1) NOT NULL,
	[Balance] [decimal](9, 2) NOT NULL,
 CONSTRAINT [PK_Wallets] PRIMARY KEY CLUSTERED 
(
	[WalletId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Index [IX_Accounts_RoleId]    Script Date: 12/8/2023 10:50:23 PM ******/
CREATE NONCLUSTERED INDEX [IX_Accounts_RoleId] ON [dbo].[Accounts]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_BankingAccounts_KitchenCenterId]    Script Date: 12/8/2023 10:50:23 PM ******/
CREATE NONCLUSTERED INDEX [IX_BankingAccounts_KitchenCenterId] ON [dbo].[BankingAccounts]
(
	[KitchenCenterId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_BrandAccounts_AccountId]    Script Date: 12/8/2023 10:50:23 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_BrandAccounts_AccountId] ON [dbo].[BrandAccounts]
(
	[AccountId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_CashierMoneyExchanges_CashierId]    Script Date: 12/8/2023 10:50:23 PM ******/
CREATE NONCLUSTERED INDEX [IX_CashierMoneyExchanges_CashierId] ON [dbo].[CashierMoneyExchanges]
(
	[CashierId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_CashierMoneyExchanges_ExchangeId]    Script Date: 12/8/2023 10:50:23 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_CashierMoneyExchanges_ExchangeId] ON [dbo].[CashierMoneyExchanges]
(
	[ExchangeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Cashiers_KitchenCenterId]    Script Date: 12/8/2023 10:50:23 PM ******/
CREATE NONCLUSTERED INDEX [IX_Cashiers_KitchenCenterId] ON [dbo].[Cashiers]
(
	[KitchenCenterId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Cashiers_WalletId]    Script Date: 12/8/2023 10:50:23 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Cashiers_WalletId] ON [dbo].[Cashiers]
(
	[WalletId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Categories_BrandId]    Script Date: 12/8/2023 10:50:23 PM ******/
CREATE NONCLUSTERED INDEX [IX_Categories_BrandId] ON [dbo].[Categories]
(
	[BrandId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_ExtraCategories_ExtraCategoryId]    Script Date: 12/8/2023 10:50:23 PM ******/
CREATE NONCLUSTERED INDEX [IX_ExtraCategories_ExtraCategoryId] ON [dbo].[ExtraCategories]
(
	[ExtraCategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_ExtraCategories_ProductCategoryId]    Script Date: 12/8/2023 10:50:23 PM ******/
CREATE NONCLUSTERED INDEX [IX_ExtraCategories_ProductCategoryId] ON [dbo].[ExtraCategories]
(
	[ProductCategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_KitchenCenterMoneyExchanges_ExchangeId]    Script Date: 12/8/2023 10:50:23 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_KitchenCenterMoneyExchanges_ExchangeId] ON [dbo].[KitchenCenterMoneyExchanges]
(
	[ExchangeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_KitchenCenterMoneyExchanges_KitchenCenterId]    Script Date: 12/8/2023 10:50:23 PM ******/
CREATE NONCLUSTERED INDEX [IX_KitchenCenterMoneyExchanges_KitchenCenterId] ON [dbo].[KitchenCenterMoneyExchanges]
(
	[KitchenCenterId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_KitchenCenters_ManagerId]    Script Date: 12/8/2023 10:50:23 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_KitchenCenters_ManagerId] ON [dbo].[KitchenCenters]
(
	[ManagerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_KitchenCenters_WalletId]    Script Date: 12/8/2023 10:50:23 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_KitchenCenters_WalletId] ON [dbo].[KitchenCenters]
(
	[WalletId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_OrderDetails_MasterOrderDetailId]    Script Date: 12/8/2023 10:50:23 PM ******/
CREATE NONCLUSTERED INDEX [IX_OrderDetails_MasterOrderDetailId] ON [dbo].[OrderDetails]
(
	[MasterOrderDetailId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_OrderDetails_OrderId]    Script Date: 12/8/2023 10:50:23 PM ******/
CREATE NONCLUSTERED INDEX [IX_OrderDetails_OrderId] ON [dbo].[OrderDetails]
(
	[OrderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_OrderDetails_ProductId]    Script Date: 12/8/2023 10:50:23 PM ******/
CREATE NONCLUSTERED INDEX [IX_OrderDetails_ProductId] ON [dbo].[OrderDetails]
(
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_OrderHistories_OrderId]    Script Date: 12/8/2023 10:50:23 PM ******/
CREATE NONCLUSTERED INDEX [IX_OrderHistories_OrderId] ON [dbo].[OrderHistories]
(
	[OrderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Orders_PartnerId]    Script Date: 12/8/2023 10:50:23 PM ******/
CREATE NONCLUSTERED INDEX [IX_Orders_PartnerId] ON [dbo].[Orders]
(
	[PartnerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Orders_StoreId]    Script Date: 12/8/2023 10:50:23 PM ******/
CREATE NONCLUSTERED INDEX [IX_Orders_StoreId] ON [dbo].[Orders]
(
	[StoreId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_PartnerProducts_StoreId_PartnerId_CreatedDate]    Script Date: 12/8/2023 10:50:23 PM ******/
CREATE NONCLUSTERED INDEX [IX_PartnerProducts_StoreId_PartnerId_CreatedDate] ON [dbo].[PartnerProducts]
(
	[StoreId] ASC,
	[PartnerId] ASC,
	[CreatedDate] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Products_BrandId]    Script Date: 12/8/2023 10:50:23 PM ******/
CREATE NONCLUSTERED INDEX [IX_Products_BrandId] ON [dbo].[Products]
(
	[BrandId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Products_CategoryId]    Script Date: 12/8/2023 10:50:23 PM ******/
CREATE NONCLUSTERED INDEX [IX_Products_CategoryId] ON [dbo].[Products]
(
	[CategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Products_ParentProductId]    Script Date: 12/8/2023 10:50:23 PM ******/
CREATE NONCLUSTERED INDEX [IX_Products_ParentProductId] ON [dbo].[Products]
(
	[ParentProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_ShipperPayments_KCBankingAccountId]    Script Date: 12/8/2023 10:50:23 PM ******/
CREATE NONCLUSTERED INDEX [IX_ShipperPayments_KCBankingAccountId] ON [dbo].[ShipperPayments]
(
	[KCBankingAccountId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_ShipperPayments_OrderId]    Script Date: 12/8/2023 10:50:23 PM ******/
CREATE NONCLUSTERED INDEX [IX_ShipperPayments_OrderId] ON [dbo].[ShipperPayments]
(
	[OrderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_StoreAccounts_AccountId]    Script Date: 12/8/2023 10:50:23 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_StoreAccounts_AccountId] ON [dbo].[StoreAccounts]
(
	[AccountId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_StoreMoneyExchanges_ExchangeId]    Script Date: 12/8/2023 10:50:23 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_StoreMoneyExchanges_ExchangeId] ON [dbo].[StoreMoneyExchanges]
(
	[ExchangeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_StoreMoneyExchanges_StoreId]    Script Date: 12/8/2023 10:50:23 PM ******/
CREATE NONCLUSTERED INDEX [IX_StoreMoneyExchanges_StoreId] ON [dbo].[StoreMoneyExchanges]
(
	[StoreId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_StorePartners_PartnerId]    Script Date: 12/8/2023 10:50:23 PM ******/
CREATE NONCLUSTERED INDEX [IX_StorePartners_PartnerId] ON [dbo].[StorePartners]
(
	[PartnerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Stores_BrandId]    Script Date: 12/8/2023 10:50:23 PM ******/
CREATE NONCLUSTERED INDEX [IX_Stores_BrandId] ON [dbo].[Stores]
(
	[BrandId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Stores_KitchenCenterId]    Script Date: 12/8/2023 10:50:23 PM ******/
CREATE NONCLUSTERED INDEX [IX_Stores_KitchenCenterId] ON [dbo].[Stores]
(
	[KitchenCenterId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Stores_WalletId]    Script Date: 12/8/2023 10:50:23 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Stores_WalletId] ON [dbo].[Stores]
(
	[WalletId] ASC
)
WHERE ([WalletId] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Transactions_ExchangeId]    Script Date: 12/8/2023 10:50:23 PM ******/
CREATE NONCLUSTERED INDEX [IX_Transactions_ExchangeId] ON [dbo].[Transactions]
(
	[ExchangeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Transactions_PaymentId]    Script Date: 12/8/2023 10:50:23 PM ******/
CREATE NONCLUSTERED INDEX [IX_Transactions_PaymentId] ON [dbo].[Transactions]
(
	[PaymentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Transactions_WalletId]    Script Date: 12/8/2023 10:50:23 PM ******/
CREATE NONCLUSTERED INDEX [IX_Transactions_WalletId] ON [dbo].[Transactions]
(
	[WalletId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_UserDevices_AccountId]    Script Date: 12/8/2023 10:50:23 PM ******/
CREATE NONCLUSTERED INDEX [IX_UserDevices_AccountId] ON [dbo].[UserDevices]
(
	[AccountId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Accounts]  WITH CHECK ADD  CONSTRAINT [FK_Accounts_Roles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[Roles] ([RoleId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Accounts] CHECK CONSTRAINT [FK_Accounts_Roles_RoleId]
GO
ALTER TABLE [dbo].[BankingAccounts]  WITH CHECK ADD  CONSTRAINT [FK_BankingAccounts_KitchenCenters_KitchenCenterId] FOREIGN KEY([KitchenCenterId])
REFERENCES [dbo].[KitchenCenters] ([KitchenCenterId])
GO
ALTER TABLE [dbo].[BankingAccounts] CHECK CONSTRAINT [FK_BankingAccounts_KitchenCenters_KitchenCenterId]
GO
ALTER TABLE [dbo].[BrandAccounts]  WITH CHECK ADD  CONSTRAINT [FK_BrandAccounts_Accounts_AccountId] FOREIGN KEY([AccountId])
REFERENCES [dbo].[Accounts] ([AccountId])
GO
ALTER TABLE [dbo].[BrandAccounts] CHECK CONSTRAINT [FK_BrandAccounts_Accounts_AccountId]
GO
ALTER TABLE [dbo].[BrandAccounts]  WITH CHECK ADD  CONSTRAINT [FK_BrandAccounts_Brands_BrandId] FOREIGN KEY([BrandId])
REFERENCES [dbo].[Brands] ([BrandId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[BrandAccounts] CHECK CONSTRAINT [FK_BrandAccounts_Brands_BrandId]
GO
ALTER TABLE [dbo].[CashierMoneyExchanges]  WITH CHECK ADD  CONSTRAINT [FK_CashierMoneyExchanges_Cashiers_CashierId] FOREIGN KEY([CashierId])
REFERENCES [dbo].[Cashiers] ([AccountId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[CashierMoneyExchanges] CHECK CONSTRAINT [FK_CashierMoneyExchanges_Cashiers_CashierId]
GO
ALTER TABLE [dbo].[CashierMoneyExchanges]  WITH CHECK ADD  CONSTRAINT [FK_CashierMoneyExchanges_MoneyExchanges_ExchangeId] FOREIGN KEY([ExchangeId])
REFERENCES [dbo].[MoneyExchanges] ([ExchangeId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[CashierMoneyExchanges] CHECK CONSTRAINT [FK_CashierMoneyExchanges_MoneyExchanges_ExchangeId]
GO
ALTER TABLE [dbo].[Cashiers]  WITH CHECK ADD  CONSTRAINT [FK_Cashiers_Accounts_AccountId] FOREIGN KEY([AccountId])
REFERENCES [dbo].[Accounts] ([AccountId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Cashiers] CHECK CONSTRAINT [FK_Cashiers_Accounts_AccountId]
GO
ALTER TABLE [dbo].[Cashiers]  WITH CHECK ADD  CONSTRAINT [FK_Cashiers_KitchenCenters_KitchenCenterId] FOREIGN KEY([KitchenCenterId])
REFERENCES [dbo].[KitchenCenters] ([KitchenCenterId])
GO
ALTER TABLE [dbo].[Cashiers] CHECK CONSTRAINT [FK_Cashiers_KitchenCenters_KitchenCenterId]
GO
ALTER TABLE [dbo].[Cashiers]  WITH CHECK ADD  CONSTRAINT [FK_Cashiers_Wallets_WalletId] FOREIGN KEY([WalletId])
REFERENCES [dbo].[Wallets] ([WalletId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Cashiers] CHECK CONSTRAINT [FK_Cashiers_Wallets_WalletId]
GO
ALTER TABLE [dbo].[Categories]  WITH CHECK ADD  CONSTRAINT [FK_Categories_Brands_BrandId] FOREIGN KEY([BrandId])
REFERENCES [dbo].[Brands] ([BrandId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Categories] CHECK CONSTRAINT [FK_Categories_Brands_BrandId]
GO
ALTER TABLE [dbo].[ExtraCategories]  WITH CHECK ADD  CONSTRAINT [FK_ExtraCategories_Categories_ExtraCategoryId] FOREIGN KEY([ExtraCategoryId])
REFERENCES [dbo].[Categories] ([CategoryId])
GO
ALTER TABLE [dbo].[ExtraCategories] CHECK CONSTRAINT [FK_ExtraCategories_Categories_ExtraCategoryId]
GO
ALTER TABLE [dbo].[ExtraCategories]  WITH CHECK ADD  CONSTRAINT [FK_ExtraCategories_Categories_ProductCategoryId] FOREIGN KEY([ProductCategoryId])
REFERENCES [dbo].[Categories] ([CategoryId])
GO
ALTER TABLE [dbo].[ExtraCategories] CHECK CONSTRAINT [FK_ExtraCategories_Categories_ProductCategoryId]
GO
ALTER TABLE [dbo].[KitchenCenterMoneyExchanges]  WITH CHECK ADD  CONSTRAINT [FK_KitchenCenterMoneyExchanges_KitchenCenters_KitchenCenterId] FOREIGN KEY([KitchenCenterId])
REFERENCES [dbo].[KitchenCenters] ([KitchenCenterId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[KitchenCenterMoneyExchanges] CHECK CONSTRAINT [FK_KitchenCenterMoneyExchanges_KitchenCenters_KitchenCenterId]
GO
ALTER TABLE [dbo].[KitchenCenterMoneyExchanges]  WITH CHECK ADD  CONSTRAINT [FK_KitchenCenterMoneyExchanges_MoneyExchanges_ExchangeId] FOREIGN KEY([ExchangeId])
REFERENCES [dbo].[MoneyExchanges] ([ExchangeId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[KitchenCenterMoneyExchanges] CHECK CONSTRAINT [FK_KitchenCenterMoneyExchanges_MoneyExchanges_ExchangeId]
GO
ALTER TABLE [dbo].[KitchenCenters]  WITH CHECK ADD  CONSTRAINT [FK_KitchenCenters_Accounts_ManagerId] FOREIGN KEY([ManagerId])
REFERENCES [dbo].[Accounts] ([AccountId])
GO
ALTER TABLE [dbo].[KitchenCenters] CHECK CONSTRAINT [FK_KitchenCenters_Accounts_ManagerId]
GO
ALTER TABLE [dbo].[KitchenCenters]  WITH CHECK ADD  CONSTRAINT [FK_KitchenCenters_Wallets_WalletId] FOREIGN KEY([WalletId])
REFERENCES [dbo].[Wallets] ([WalletId])
GO
ALTER TABLE [dbo].[KitchenCenters] CHECK CONSTRAINT [FK_KitchenCenters_Wallets_WalletId]
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetails_OrderDetails_MasterOrderDetailId] FOREIGN KEY([MasterOrderDetailId])
REFERENCES [dbo].[OrderDetails] ([OrderDetailId])
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK_OrderDetails_OrderDetails_MasterOrderDetailId]
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetails_Orders_OrderId] FOREIGN KEY([OrderId])
REFERENCES [dbo].[Orders] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK_OrderDetails_Orders_OrderId]
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetails_Products_ProductId] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Products] ([ProductId])
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK_OrderDetails_Products_ProductId]
GO
ALTER TABLE [dbo].[OrderHistories]  WITH CHECK ADD  CONSTRAINT [FK_OrderHistories_Orders_OrderId] FOREIGN KEY([OrderId])
REFERENCES [dbo].[Orders] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[OrderHistories] CHECK CONSTRAINT [FK_OrderHistories_Orders_OrderId]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Partners_PartnerId] FOREIGN KEY([PartnerId])
REFERENCES [dbo].[Partners] ([PartnerId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Partners_PartnerId]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Stores_StoreId] FOREIGN KEY([StoreId])
REFERENCES [dbo].[Stores] ([StoreId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Stores_StoreId]
GO
ALTER TABLE [dbo].[PartnerProducts]  WITH CHECK ADD  CONSTRAINT [FK_PartnerProducts_Products_ProductId] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Products] ([ProductId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[PartnerProducts] CHECK CONSTRAINT [FK_PartnerProducts_Products_ProductId]
GO
ALTER TABLE [dbo].[PartnerProducts]  WITH CHECK ADD  CONSTRAINT [FK_PartnerProducts_StorePartners_StoreId_PartnerId_CreatedDate] FOREIGN KEY([StoreId], [PartnerId], [CreatedDate])
REFERENCES [dbo].[StorePartners] ([StoreId], [PartnerId], [CreatedDate])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[PartnerProducts] CHECK CONSTRAINT [FK_PartnerProducts_StorePartners_StoreId_PartnerId_CreatedDate]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_Brands_BrandId] FOREIGN KEY([BrandId])
REFERENCES [dbo].[Brands] ([BrandId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_Brands_BrandId]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_Categories_CategoryId] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Categories] ([CategoryId])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_Categories_CategoryId]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_Products_ParentProductId] FOREIGN KEY([ParentProductId])
REFERENCES [dbo].[Products] ([ProductId])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_Products_ParentProductId]
GO
ALTER TABLE [dbo].[ShipperPayments]  WITH CHECK ADD  CONSTRAINT [FK_ShipperPayments_BankingAccounts_KCBankingAccountId] FOREIGN KEY([KCBankingAccountId])
REFERENCES [dbo].[BankingAccounts] ([BankingAccountId])
GO
ALTER TABLE [dbo].[ShipperPayments] CHECK CONSTRAINT [FK_ShipperPayments_BankingAccounts_KCBankingAccountId]
GO
ALTER TABLE [dbo].[ShipperPayments]  WITH CHECK ADD  CONSTRAINT [FK_ShipperPayments_Orders_OrderId] FOREIGN KEY([OrderId])
REFERENCES [dbo].[Orders] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ShipperPayments] CHECK CONSTRAINT [FK_ShipperPayments_Orders_OrderId]
GO
ALTER TABLE [dbo].[StoreAccounts]  WITH CHECK ADD  CONSTRAINT [FK_StoreAccounts_Accounts_AccountId] FOREIGN KEY([AccountId])
REFERENCES [dbo].[Accounts] ([AccountId])
GO
ALTER TABLE [dbo].[StoreAccounts] CHECK CONSTRAINT [FK_StoreAccounts_Accounts_AccountId]
GO
ALTER TABLE [dbo].[StoreAccounts]  WITH CHECK ADD  CONSTRAINT [FK_StoreAccounts_Stores_StoreId] FOREIGN KEY([StoreId])
REFERENCES [dbo].[Stores] ([StoreId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[StoreAccounts] CHECK CONSTRAINT [FK_StoreAccounts_Stores_StoreId]
GO
ALTER TABLE [dbo].[StoreMoneyExchanges]  WITH CHECK ADD  CONSTRAINT [FK_StoreMoneyExchanges_MoneyExchanges_ExchangeId] FOREIGN KEY([ExchangeId])
REFERENCES [dbo].[MoneyExchanges] ([ExchangeId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[StoreMoneyExchanges] CHECK CONSTRAINT [FK_StoreMoneyExchanges_MoneyExchanges_ExchangeId]
GO
ALTER TABLE [dbo].[StoreMoneyExchanges]  WITH CHECK ADD  CONSTRAINT [FK_StoreMoneyExchanges_Stores_StoreId] FOREIGN KEY([StoreId])
REFERENCES [dbo].[Stores] ([StoreId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[StoreMoneyExchanges] CHECK CONSTRAINT [FK_StoreMoneyExchanges_Stores_StoreId]
GO
ALTER TABLE [dbo].[StorePartners]  WITH CHECK ADD  CONSTRAINT [FK_StorePartners_Partners_PartnerId] FOREIGN KEY([PartnerId])
REFERENCES [dbo].[Partners] ([PartnerId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[StorePartners] CHECK CONSTRAINT [FK_StorePartners_Partners_PartnerId]
GO
ALTER TABLE [dbo].[StorePartners]  WITH CHECK ADD  CONSTRAINT [FK_StorePartners_Stores_StoreId] FOREIGN KEY([StoreId])
REFERENCES [dbo].[Stores] ([StoreId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[StorePartners] CHECK CONSTRAINT [FK_StorePartners_Stores_StoreId]
GO
ALTER TABLE [dbo].[Stores]  WITH CHECK ADD  CONSTRAINT [FK_Stores_Brands_BrandId] FOREIGN KEY([BrandId])
REFERENCES [dbo].[Brands] ([BrandId])
GO
ALTER TABLE [dbo].[Stores] CHECK CONSTRAINT [FK_Stores_Brands_BrandId]
GO
ALTER TABLE [dbo].[Stores]  WITH CHECK ADD  CONSTRAINT [FK_Stores_KitchenCenters_KitchenCenterId] FOREIGN KEY([KitchenCenterId])
REFERENCES [dbo].[KitchenCenters] ([KitchenCenterId])
GO
ALTER TABLE [dbo].[Stores] CHECK CONSTRAINT [FK_Stores_KitchenCenters_KitchenCenterId]
GO
ALTER TABLE [dbo].[Stores]  WITH CHECK ADD  CONSTRAINT [FK_Stores_Wallets_WalletId] FOREIGN KEY([WalletId])
REFERENCES [dbo].[Wallets] ([WalletId])
GO
ALTER TABLE [dbo].[Stores] CHECK CONSTRAINT [FK_Stores_Wallets_WalletId]
GO
ALTER TABLE [dbo].[Transactions]  WITH CHECK ADD  CONSTRAINT [FK_Transactions_MoneyExchanges_ExchangeId] FOREIGN KEY([ExchangeId])
REFERENCES [dbo].[MoneyExchanges] ([ExchangeId])
GO
ALTER TABLE [dbo].[Transactions] CHECK CONSTRAINT [FK_Transactions_MoneyExchanges_ExchangeId]
GO
ALTER TABLE [dbo].[Transactions]  WITH CHECK ADD  CONSTRAINT [FK_Transactions_ShipperPayments_PaymentId] FOREIGN KEY([PaymentId])
REFERENCES [dbo].[ShipperPayments] ([PaymentId])
GO
ALTER TABLE [dbo].[Transactions] CHECK CONSTRAINT [FK_Transactions_ShipperPayments_PaymentId]
GO
ALTER TABLE [dbo].[Transactions]  WITH CHECK ADD  CONSTRAINT [FK_Transactions_Wallets_WalletId] FOREIGN KEY([WalletId])
REFERENCES [dbo].[Wallets] ([WalletId])
GO
ALTER TABLE [dbo].[Transactions] CHECK CONSTRAINT [FK_Transactions_Wallets_WalletId]
GO
ALTER TABLE [dbo].[UserDevices]  WITH CHECK ADD  CONSTRAINT [FK_UserDevices_Accounts_AccountId] FOREIGN KEY([AccountId])
REFERENCES [dbo].[Accounts] ([AccountId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[UserDevices] CHECK CONSTRAINT [FK_UserDevices_Accounts_AccountId]
GO
USE [master]
GO
ALTER DATABASE [CloudKitchen] SET  READ_WRITE 
GO
