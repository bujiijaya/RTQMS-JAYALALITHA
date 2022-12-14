/*    ==Scripting Parameters==

    Source Server Version : SQL Server 2016 (13.0.4259)
    Source Database Engine Edition : Microsoft SQL Server Enterprise Edition
    Source Database Engine Type : Standalone SQL Server

    Target Server Version : SQL Server 2017
    Target Database Engine Edition : Microsoft SQL Server Standard Edition
    Target Database Engine Type : Standalone SQL Server
*/

USE [master]
GO
/****** Object:  Database [RTQMS]    Script Date: 28-Apr-22 4:47:12 PM ******/
CREATE DATABASE [RTQMS]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'RTQMS', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\DATA\RTQMS.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'RTQMS_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\DATA\RTQMS_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [RTQMS] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [RTQMS].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [RTQMS] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [RTQMS] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [RTQMS] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [RTQMS] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [RTQMS] SET ARITHABORT OFF 
GO
ALTER DATABASE [RTQMS] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [RTQMS] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [RTQMS] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [RTQMS] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [RTQMS] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [RTQMS] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [RTQMS] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [RTQMS] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [RTQMS] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [RTQMS] SET  DISABLE_BROKER 
GO
ALTER DATABASE [RTQMS] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [RTQMS] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [RTQMS] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [RTQMS] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [RTQMS] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [RTQMS] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [RTQMS] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [RTQMS] SET RECOVERY FULL 
GO
ALTER DATABASE [RTQMS] SET  MULTI_USER 
GO
ALTER DATABASE [RTQMS] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [RTQMS] SET DB_CHAINING OFF 
GO
ALTER DATABASE [RTQMS] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [RTQMS] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [RTQMS] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'RTQMS', N'ON'
GO
ALTER DATABASE [RTQMS] SET QUERY_STORE = OFF
GO
USE [RTQMS]
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [RTQMS]
GO
/****** Object:  Synonym [dbo].[Synonym_Primary_Table]    Script Date: 28-Apr-22 4:47:12 PM ******/
CREATE SYNONYM [dbo].[Synonym_Primary_Table] FOR [DESKTOP-UJGKPUD].[OnlineSalesPlatform].[dbo].[tbl_Product]
GO
/****** Object:  UserDefinedFunction [dbo].[GetProductWithDescription]    Script Date: 28-Apr-22 4:47:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Function [dbo].[GetProductWithDescription](@productName nvarchar(200),@Description nvarchar(Max))
Returns nvarchar(max)
as
BEGIN
return @productName + ' | '+@Description;
End
GO
/****** Object:  Table [dbo].[tbl_Product]    Script Date: 28-Apr-22 4:47:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Product](
	[ProductId] [int] IDENTITY(1,1) NOT NULL,
	[ProductName] [nvarchar](200) NULL,
	[Category] [int] NULL,
	[SKU] [nvarchar](50) NULL,
	[Description] [nvarchar](max) NULL,
	[UnitPrice] [decimal](18, 2) NULL,
	[ImageUrl] [nvarchar](max) NULL,
	[UnitsInStock] [int] NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedOn] [datetime] NULL,
	[UpdatedOn] [datetime] NOT NULL,
 CONSTRAINT [PK_tbl_Product] PRIMARY KEY CLUSTERED 
(
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_ProductCategory]    Script Date: 28-Apr-22 4:47:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_ProductCategory](
	[CategoryId] [int] IDENTITY(1,1) NOT NULL,
	[CategoryName] [nvarchar](200) NULL,
	[CategoryDescription] [nvarchar](max) NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedOn] [datetime] NULL,
	[UpdatedOn] [datetime] NOT NULL,
 CONSTRAINT [PK_tbl_ProductCategory] PRIMARY KEY CLUSTERED 
(
	[CategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  View [dbo].[Vw_CustomizedProductSelection]    Script Date: 28-Apr-22 4:47:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[Vw_CustomizedProductSelection]
AS
SELECT        T1.SKU, T1.ProductName AS 'Product', T2.CategoryName AS 'Category', T1.UnitPrice AS 'Cost', T1.UnitsInStock AS 'Stock'
FROM            dbo.tbl_Product AS T1 INNER JOIN
                         dbo.tbl_ProductCategory AS T2 ON T1.Category = T2.CategoryId
GO
/****** Object:  Table [dbo].[CustomerProfile]    Script Date: 28-Apr-22 4:47:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CustomerProfile](
	[CustId] [int] NOT NULL,
	[CustName] [nvarchar](100) NOT NULL,
	[Email] [nvarchar](200) NULL,
	[MobileNumber] [nvarchar](20) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_CustomerAddressDetails]    Script Date: 28-Apr-22 4:47:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_CustomerAddressDetails](
	[AddressID] [int] IDENTITY(1,1) NOT NULL,
	[CustomerId] [int] NULL,
	[Country] [nvarchar](50) NULL,
	[State] [nvarchar](50) NULL,
	[City] [nvarchar](50) NULL,
	[Address1] [nvarchar](300) NULL,
	[Address2] [nvarchar](300) NULL,
	[PinCode] [nvarchar](10) NULL,
	[IsPrimary] [bit] NOT NULL,
 CONSTRAINT [PK_tbl_CustomerAddressDetails] PRIMARY KEY CLUSTERED 
(
	[AddressID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_CustomerCart]    Script Date: 28-Apr-22 4:47:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_CustomerCart](
	[CartId] [int] IDENTITY(1,1) NOT NULL,
	[CustomerId] [int] NULL,
	[Product] [int] NULL,
	[AddedOn] [datetime] NULL,
	[Qty] [int] NULL,
 CONSTRAINT [PK_tbl_CustomerCart] PRIMARY KEY CLUSTERED 
(
	[CartId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_CustomerProfile]    Script Date: 28-Apr-22 4:47:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_CustomerProfile](
	[CustomerID] [int] IDENTITY(1,1) NOT NULL,
	[SysUserId] [int] NULL,
	[FirstName] [nvarchar](200) NULL,
	[LastName] [nvarchar](200) NULL,
	[DOB] [date] NULL,
	[Gender] [nvarchar](15) NULL,
	[Email] [nvarchar](200) NULL,
	[MobileNumber] [nvarchar](20) NULL,
	[IsActive] [bit] NULL,
	[CreatedON] [datetime] NULL,
	[UpdatedOn] [datetime] NULL,
	[Password] [nvarchar](max) NULL,
 CONSTRAINT [PK_tbl_CustomerProfile] PRIMARY KEY CLUSTERED 
(
	[CustomerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_CustomerTransactions]    Script Date: 28-Apr-22 4:47:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_CustomerTransactions](
	[TransactionId] [int] IDENTITY(1,1) NOT NULL,
	[TransactionDate] [datetime] NULL,
	[TransactionAmount] [decimal](18, 2) NULL,
	[NoofProducts] [int] NULL,
	[TransactionStatus] [bit] NOT NULL,
	[ProductId] [int] NULL,
	[CustomerId] [int] NULL,
 CONSTRAINT [PK_tbl_CustomerTransactions] PRIMARY KEY CLUSTERED 
(
	[TransactionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_JobCardDetails]    Script Date: 28-Apr-22 4:47:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_JobCardDetails](
	[JobId] [int] NOT NULL,
	[JobDescription] [nvarchar](500) NULL,
	[VehicleId] [int] NULL,
	[StageId] [int] NULL,
	[AssignedTo] [int] NULL,
	[JobStatus] [nvarchar](50) NULL,
	[UpdatedOn] [datetime] NULL,
 CONSTRAINT [PK_tbl_JobCardDetails] PRIMARY KEY CLUSTERED 
(
	[JobId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_Models]    Script Date: 28-Apr-22 4:47:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Models](
	[ModelId] [int] IDENTITY(1,1) NOT NULL,
	[ModelName] [nvarchar](200) NULL,
	[ModelCategory] [nvarchar](50) NULL,
 CONSTRAINT [PK_tbl_Models] PRIMARY KEY CLUSTERED 
(
	[ModelId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_ProductsRatingByCustomer]    Script Date: 28-Apr-22 4:47:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_ProductsRatingByCustomer](
	[FeedBackId] [int] IDENTITY(1,1) NOT NULL,
	[CustomerId] [int] NULL,
	[ProductId] [int] NULL,
	[Comments] [nvarchar](300) NULL,
	[Rating] [int] NULL,
	[CreatedOn] [datetime] NULL,
 CONSTRAINT [PK_tbl_ProductsRatingByCustomer] PRIMARY KEY CLUSTERED 
(
	[FeedBackId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_QualityChecker]    Script Date: 28-Apr-22 4:47:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_QualityChecker](
	[QualityCheckId] [int] NOT NULL,
	[QualityFactorId] [int] NULL,
	[JobCardNo] [int] NULL,
	[QualityCheckStatus] [nvarchar](20) NULL,
	[Comments] [nvarchar](100) NULL,
	[EngineerWorkedBy] [int] NULL,
	[Supervisor] [int] NULL,
 CONSTRAINT [PK_tbl_QualityChecker] PRIMARY KEY CLUSTERED 
(
	[QualityCheckId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_QualityFactors]    Script Date: 28-Apr-22 4:47:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_QualityFactors](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[QualityFactor] [nvarchar](200) NULL,
	[Description] [nvarchar](300) NULL,
	[QualityCategory] [nvarchar](100) NULL,
	[StageId] [int] NULL,
 CONSTRAINT [PK_tbl_QualityFactors] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_Sites]    Script Date: 28-Apr-22 4:47:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Sites](
	[SiteId] [int] IDENTITY(1,1) NOT NULL,
	[SiteName] [nvarchar](200) NULL,
	[SiteLocation] [nvarchar](50) NULL,
	[Address] [nvarchar](200) NULL,
	[ContactEmail] [nvarchar](200) NULL,
	[ContactNumber] [nvarchar](50) NULL,
 CONSTRAINT [PK_tbl_Sites] PRIMARY KEY CLUSTERED 
(
	[SiteId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_Stages]    Script Date: 28-Apr-22 4:47:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Stages](
	[StageId] [int] IDENTITY(1,1) NOT NULL,
	[StageName] [nvarchar](200) NULL,
	[StageCategory] [nvarchar](100) NULL,
 CONSTRAINT [PK_tbl_Stages] PRIMARY KEY CLUSTERED 
(
	[StageId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_UserProfile]    Script Date: 28-Apr-22 4:47:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_UserProfile](
	[UserId] [int] IDENTITY(1,1) NOT NULL,
	[FullName] [nvarchar](100) NULL,
	[EmailId] [nvarchar](150) NULL,
	[Password] [nvarchar](max) NULL,
	[Role] [int] NULL,
	[IsActive] [bit] NULL,
	[UpdatedOn] [datetime] NULL,
 CONSTRAINT [PK_tbl_UserProfile] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_UserRoles]    Script Date: 28-Apr-22 4:47:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_UserRoles](
	[RoleId] [int] IDENTITY(1,1) NOT NULL,
	[RoleName] [nvarchar](100) NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_tbl_UserRoles] PRIMARY KEY CLUSTERED 
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_Users]    Script Date: 28-Apr-22 4:47:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Users](
	[UserId] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](200) NOT NULL,
	[LastName] [nvarchar](50) NULL,
	[Email] [nvarchar](200) NOT NULL,
	[MobileNumber] [nvarchar](20) NOT NULL,
	[Password] [nvarchar](max) NOT NULL,
	[Role] [nvarchar](50) NULL,
	[Supervisor] [int] NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[UpdatedOn] [datetime] NOT NULL,
 CONSTRAINT [PK_tbl_Users] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_VehicleRegistration]    Script Date: 28-Apr-22 4:47:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_VehicleRegistration](
	[VehicleNo] [int] IDENTITY(1,1) NOT NULL,
	[VehicleRunningNo] [nvarchar](50) NULL,
	[VModel] [int] NULL,
	[SiteNo] [int] NULL,
	[StartDate] [datetime] NULL,
	[EDCDate] [datetime] NULL,
	[Supervisor] [int] NULL,
 CONSTRAINT [PK_tbl_VehicleRegistration] PRIMARY KEY CLUSTERED 
(
	[VehicleNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_VehicleStageProgress]    Script Date: 28-Apr-22 4:47:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_VehicleStageProgress](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[VehicleId] [int] NULL,
	[StageId] [int] NULL,
	[Status] [nvarchar](50) NULL,
	[SupervisorId] [int] NULL,
	[SiteId] [int] NULL,
 CONSTRAINT [PK_tbl_VehicleStageProgress] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[tbl_CustomerAddressDetails] ON 
GO
INSERT [dbo].[tbl_CustomerAddressDetails] ([AddressID], [CustomerId], [Country], [State], [City], [Address1], [Address2], [PinCode], [IsPrimary]) VALUES (1, 1, N'India', N'Karnataka', N'Bangalore', N'#SRICHID, 2nd Cross, 2nd Main, RBI Layout, JP Nagar, Blr', N'', N'560078', 1)
GO
SET IDENTITY_INSERT [dbo].[tbl_CustomerAddressDetails] OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_CustomerCart] ON 
GO
INSERT [dbo].[tbl_CustomerCart] ([CartId], [CustomerId], [Product], [AddedOn], [Qty]) VALUES (3010, 1004, 4004, NULL, 1)
GO
SET IDENTITY_INSERT [dbo].[tbl_CustomerCart] OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_CustomerProfile] ON 
GO
INSERT [dbo].[tbl_CustomerProfile] ([CustomerID], [SysUserId], [FirstName], [LastName], [DOB], [Gender], [Email], [MobileNumber], [IsActive], [CreatedON], [UpdatedOn], [Password]) VALUES (1, NULL, N'Customer', N'G', CAST(N'1990-01-01' AS Date), N'Male', N'reddy@gmail.com', N'45678988', 1, NULL, NULL, N'123')
GO
INSERT [dbo].[tbl_CustomerProfile] ([CustomerID], [SysUserId], [FirstName], [LastName], [DOB], [Gender], [Email], [MobileNumber], [IsActive], [CreatedON], [UpdatedOn], [Password]) VALUES (2, NULL, N'Admin', N'A', CAST(N'1990-06-09' AS Date), N'Female', N'admin@gmail.com', N'986556788', 1, NULL, NULL, N'abc')
GO
INSERT [dbo].[tbl_CustomerProfile] ([CustomerID], [SysUserId], [FirstName], [LastName], [DOB], [Gender], [Email], [MobileNumber], [IsActive], [CreatedON], [UpdatedOn], [Password]) VALUES (3, 6, N'Reddy', N'G', NULL, N'', N'ggrupdates@gmail.com', N'8778777889', 1, CAST(N'2022-11-05T00:00:00.000' AS DateTime), CAST(N'2022-11-05T00:00:00.000' AS DateTime), N'Test')
GO
INSERT [dbo].[tbl_CustomerProfile] ([CustomerID], [SysUserId], [FirstName], [LastName], [DOB], [Gender], [Email], [MobileNumber], [IsActive], [CreatedON], [UpdatedOn], [Password]) VALUES (4, 7, N'Karthik', N'K', NULL, N'', N'karthik@gmail.com', N'9787877678', 1, CAST(N'2022-11-05T00:00:00.000' AS DateTime), CAST(N'2022-11-05T00:00:00.000' AS DateTime), N'Test@123')
GO
INSERT [dbo].[tbl_CustomerProfile] ([CustomerID], [SysUserId], [FirstName], [LastName], [DOB], [Gender], [Email], [MobileNumber], [IsActive], [CreatedON], [UpdatedOn], [Password]) VALUES (5, 8, N'Sullu', N'G', NULL, N'', N'sulochana@gmail.com', N'25235322', 1, CAST(N'2022-11-05T00:00:00.000' AS DateTime), CAST(N'2022-11-05T00:00:00.000' AS DateTime), N'Test@123')
GO
INSERT [dbo].[tbl_CustomerProfile] ([CustomerID], [SysUserId], [FirstName], [LastName], [DOB], [Gender], [Email], [MobileNumber], [IsActive], [CreatedON], [UpdatedOn], [Password]) VALUES (6, 9, N'suma', N'G', NULL, N'', N'suma@gmail.com', N'9367867888', 1, CAST(N'2022-11-05T00:00:00.000' AS DateTime), CAST(N'2022-11-05T00:00:00.000' AS DateTime), N'Test@123')
GO
INSERT [dbo].[tbl_CustomerProfile] ([CustomerID], [SysUserId], [FirstName], [LastName], [DOB], [Gender], [Email], [MobileNumber], [IsActive], [CreatedON], [UpdatedOn], [Password]) VALUES (7, 10, N'TestCustomer', N'C', NULL, N'', N'testcustomer@gmail.com', N'789789789', 1, CAST(N'2022-11-05T00:00:00.000' AS DateTime), CAST(N'2022-11-05T00:00:00.000' AS DateTime), N'Test@123')
GO
INSERT [dbo].[tbl_CustomerProfile] ([CustomerID], [SysUserId], [FirstName], [LastName], [DOB], [Gender], [Email], [MobileNumber], [IsActive], [CreatedON], [UpdatedOn], [Password]) VALUES (1003, 1006, N'Venkatesh', N'SK', NULL, N'', N'venkateshsk@gmail.com', N'9878678879', 1, CAST(N'2022-11-05T00:00:00.000' AS DateTime), CAST(N'2022-11-05T00:00:00.000' AS DateTime), N'Test@123')
GO
INSERT [dbo].[tbl_CustomerProfile] ([CustomerID], [SysUserId], [FirstName], [LastName], [DOB], [Gender], [Email], [MobileNumber], [IsActive], [CreatedON], [UpdatedOn], [Password]) VALUES (1004, 1007, N'Rajesh', N'C', NULL, N'', N'rajesh@gmail.com', N'9567856766', 1, CAST(N'2022-11-05T00:00:00.000' AS DateTime), CAST(N'2022-11-05T00:00:00.000' AS DateTime), N'Test@123')
GO
INSERT [dbo].[tbl_CustomerProfile] ([CustomerID], [SysUserId], [FirstName], [LastName], [DOB], [Gender], [Email], [MobileNumber], [IsActive], [CreatedON], [UpdatedOn], [Password]) VALUES (1005, 2006, N'reddy', N'g', NULL, N'', N'admin@gmail.com', N'567890', 1, CAST(N'2022-11-05T00:00:00.000' AS DateTime), CAST(N'2022-11-05T00:00:00.000' AS DateTime), N'Admin@123')
GO
INSERT [dbo].[tbl_CustomerProfile] ([CustomerID], [SysUserId], [FirstName], [LastName], [DOB], [Gender], [Email], [MobileNumber], [IsActive], [CreatedON], [UpdatedOn], [Password]) VALUES (2005, 5007, N'Reddy', N'Test', NULL, N'', N'testsupervisor@gmail.com', N'890789788', 1, CAST(N'2022-11-05T00:00:00.000' AS DateTime), CAST(N'2022-11-05T00:00:00.000' AS DateTime), N'Test@123')
GO
INSERT [dbo].[tbl_CustomerProfile] ([CustomerID], [SysUserId], [FirstName], [LastName], [DOB], [Gender], [Email], [MobileNumber], [IsActive], [CreatedON], [UpdatedOn], [Password]) VALUES (2006, 5008, N'Reddy', N'Test', NULL, N'', N'testengineer@gmail.com', N'7890789078', 1, CAST(N'2022-11-05T00:00:00.000' AS DateTime), CAST(N'2022-11-05T00:00:00.000' AS DateTime), N'Test@123')
GO
INSERT [dbo].[tbl_CustomerProfile] ([CustomerID], [SysUserId], [FirstName], [LastName], [DOB], [Gender], [Email], [MobileNumber], [IsActive], [CreatedON], [UpdatedOn], [Password]) VALUES (2007, 5009, N'Mubeena', N'E', NULL, N'', N'testengineerm@gmail.com', N'875678977', 1, CAST(N'2022-11-05T00:00:00.000' AS DateTime), CAST(N'2022-11-05T00:00:00.000' AS DateTime), N'Test@123')
GO
SET IDENTITY_INSERT [dbo].[tbl_CustomerProfile] OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_Models] ON 
GO
INSERT [dbo].[tbl_Models] ([ModelId], [ModelName], [ModelCategory]) VALUES (1, N'INNOVA', N'LONG')
GO
INSERT [dbo].[tbl_Models] ([ModelId], [ModelName], [ModelCategory]) VALUES (2, N'Fortuner', N'SUV')
GO
SET IDENTITY_INSERT [dbo].[tbl_Models] OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_Product] ON 
GO
INSERT [dbo].[tbl_Product] ([ProductId], [ProductName], [Category], [SKU], [Description], [UnitPrice], [ImageUrl], [UnitsInStock], [IsActive], [CreatedOn], [UpdatedOn]) VALUES (3002, N'Silk-Saree', 1, N'W4', N'Test', CAST(5000.00 AS Decimal(18, 2)), N'Test', 2, 0, CAST(N'2020-11-09T00:00:00.000' AS DateTime), CAST(N'2020-11-09T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[tbl_Product] ([ProductId], [ProductName], [Category], [SKU], [Description], [UnitPrice], [ImageUrl], [UnitsInStock], [IsActive], [CreatedOn], [UpdatedOn]) VALUES (4002, N'T-Shirt XL', 2, N'M12', N'Men''s Product', CAST(500.00 AS Decimal(18, 2)), N'', 10, 0, CAST(N'2020-11-09T00:00:00.000' AS DateTime), CAST(N'2020-11-09T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[tbl_Product] ([ProductId], [ProductName], [Category], [SKU], [Description], [UnitPrice], [ImageUrl], [UnitsInStock], [IsActive], [CreatedOn], [UpdatedOn]) VALUES (4003, N'T-Shirt XL', 2, N'M1', N'Test', CAST(500.00 AS Decimal(18, 2)), N'', 10, 0, CAST(N'2020-11-09T00:00:00.000' AS DateTime), CAST(N'2020-11-09T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[tbl_Product] ([ProductId], [ProductName], [Category], [SKU], [Description], [UnitPrice], [ImageUrl], [UnitsInStock], [IsActive], [CreatedOn], [UpdatedOn]) VALUES (4004, N'Shirt Kidy', 3, N'K23', N'Kids Product', CAST(1000.00 AS Decimal(18, 2)), N'', 3, 0, CAST(N'2020-11-09T00:00:00.000' AS DateTime), CAST(N'2020-11-09T00:00:00.000' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[tbl_Product] OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_ProductCategory] ON 
GO
INSERT [dbo].[tbl_ProductCategory] ([CategoryId], [CategoryName], [CategoryDescription], [IsActive], [CreatedOn], [UpdatedOn]) VALUES (1, N'Women', N'Women Products', 1, CAST(N'2020-11-08T00:00:00.000' AS DateTime), CAST(N'2020-11-08T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[tbl_ProductCategory] ([CategoryId], [CategoryName], [CategoryDescription], [IsActive], [CreatedOn], [UpdatedOn]) VALUES (2, N'Men', N'Men Products', 1, CAST(N'2020-11-08T00:00:00.000' AS DateTime), CAST(N'2020-11-08T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[tbl_ProductCategory] ([CategoryId], [CategoryName], [CategoryDescription], [IsActive], [CreatedOn], [UpdatedOn]) VALUES (3, N'Kids', N'Kids Products', 1, CAST(N'2020-08-13T00:00:00.000' AS DateTime), CAST(N'2020-08-13T19:22:50.717' AS DateTime))
GO
INSERT [dbo].[tbl_ProductCategory] ([CategoryId], [CategoryName], [CategoryDescription], [IsActive], [CreatedOn], [UpdatedOn]) VALUES (1003, N'Others', N'Others', 1, CAST(N'2020-08-14T00:00:00.000' AS DateTime), CAST(N'2020-08-14T19:38:50.457' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[tbl_ProductCategory] OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_QualityFactors] ON 
GO
INSERT [dbo].[tbl_QualityFactors] ([Id], [QualityFactor], [Description], [QualityCategory], [StageId]) VALUES (1, N'Verify Raw meterial', N'Verify Raw meterial', N'Quality', 1)
GO
INSERT [dbo].[tbl_QualityFactors] ([Id], [QualityFactor], [Description], [QualityCategory], [StageId]) VALUES (2, N'Check Quality of material', N'Check Quality of material', N'Quality', 1)
GO
INSERT [dbo].[tbl_QualityFactors] ([Id], [QualityFactor], [Description], [QualityCategory], [StageId]) VALUES (3, N'Quantity Checking', N'Quantity Checking', N'Quantity', 1)
GO
INSERT [dbo].[tbl_QualityFactors] ([Id], [QualityFactor], [Description], [QualityCategory], [StageId]) VALUES (4, N'Collect the parts', N'Collect the parts', N'Bodysetup', 2)
GO
INSERT [dbo].[tbl_QualityFactors] ([Id], [QualityFactor], [Description], [QualityCategory], [StageId]) VALUES (5, N'Fit the parts', N'Fit the parts', N'Bodysetup', 2)
GO
INSERT [dbo].[tbl_QualityFactors] ([Id], [QualityFactor], [Description], [QualityCategory], [StageId]) VALUES (6, N'Verify the setup', N'Verify the setup', N'Bodysetup', 2)
GO
SET IDENTITY_INSERT [dbo].[tbl_QualityFactors] OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_Sites] ON 
GO
INSERT [dbo].[tbl_Sites] ([SiteId], [SiteName], [SiteLocation], [Address], [ContactEmail], [ContactNumber]) VALUES (1, N'BIDIDI', N'Bangalore', N'RamNagar, Bangalore', N'bididitoyota@gmail.com', N'9789678909')
GO
INSERT [dbo].[tbl_Sites] ([SiteId], [SiteName], [SiteLocation], [Address], [ContactEmail], [ContactNumber]) VALUES (2, N'TIRUPATHI', N'THIRUPATHI', N'Renigunta, Tirupathi', N'tpttoyota@gmail.com', N'7897887887')
GO
INSERT [dbo].[tbl_Sites] ([SiteId], [SiteName], [SiteLocation], [Address], [ContactEmail], [ContactNumber]) VALUES (1002, N'SITE-3', N'', N'#123, Street 12', N'chennai@gmail.com', N'8884118489')
GO
INSERT [dbo].[tbl_Sites] ([SiteId], [SiteName], [SiteLocation], [Address], [ContactEmail], [ContactNumber]) VALUES (1003, N'MPL', N'Madanapalle', N'NTR Circle', N'mplsite@gmail.com', N'9978978998')
GO
SET IDENTITY_INSERT [dbo].[tbl_Sites] OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_Stages] ON 
GO
INSERT [dbo].[tbl_Stages] ([StageId], [StageName], [StageCategory]) VALUES (1, N'STAGE-1', N'Raw Material')
GO
INSERT [dbo].[tbl_Stages] ([StageId], [StageName], [StageCategory]) VALUES (2, N'STAGE-2', N'BODY Setup')
GO
INSERT [dbo].[tbl_Stages] ([StageId], [StageName], [StageCategory]) VALUES (3, N'STAGE-3', N'ENGINE FITTING')
GO
INSERT [dbo].[tbl_Stages] ([StageId], [StageName], [StageCategory]) VALUES (4, N'STAGE-4', N'TOP FITTING')
GO
INSERT [dbo].[tbl_Stages] ([StageId], [StageName], [StageCategory]) VALUES (5, N'STAGE-5', N'MIRROR FITTING')
GO
INSERT [dbo].[tbl_Stages] ([StageId], [StageName], [StageCategory]) VALUES (6, N'STAGE-6', N'OVERALL CHECKING')
GO
SET IDENTITY_INSERT [dbo].[tbl_Stages] OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_Users] ON 
GO
INSERT [dbo].[tbl_Users] ([UserId], [FirstName], [LastName], [Email], [MobileNumber], [Password], [Role], [Supervisor], [IsActive], [CreatedOn], [UpdatedOn]) VALUES (3007, N'Admin', N'S', N'admin@gmail.com', N'8907898908', N'Admin@123', N'Admin', 3007, 1, CAST(N'2022-04-25T00:00:00.000' AS DateTime), CAST(N'2022-04-25T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[tbl_Users] ([UserId], [FirstName], [LastName], [Email], [MobileNumber], [Password], [Role], [Supervisor], [IsActive], [CreatedOn], [UpdatedOn]) VALUES (3008, N'Venkatesh', N'B', N'venkatesh@gmail.com', N'5678967897', N'Test@123', N'Supervisor', 3008, 1, CAST(N'2022-04-24T00:00:00.000' AS DateTime), CAST(N'2022-04-24T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[tbl_Users] ([UserId], [FirstName], [LastName], [Email], [MobileNumber], [Password], [Role], [Supervisor], [IsActive], [CreatedOn], [UpdatedOn]) VALUES (4006, N'Ramesh', N'K', N'ramesh@gmail.com', N'9868978789', N'Test@123', N'Engineer', 3008, 1, CAST(N'2022-04-28T00:00:00.000' AS DateTime), CAST(N'2022-04-28T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[tbl_Users] ([UserId], [FirstName], [LastName], [Email], [MobileNumber], [Password], [Role], [Supervisor], [IsActive], [CreatedOn], [UpdatedOn]) VALUES (4008, N'Mubeena', N'G', N'mubeena@gmail.com', N'6798067899', N'Test@123', N'Supervisor', 4008, 1, CAST(N'2022-04-26T00:00:00.000' AS DateTime), CAST(N'2022-04-26T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[tbl_Users] ([UserId], [FirstName], [LastName], [Email], [MobileNumber], [Password], [Role], [Supervisor], [IsActive], [CreatedOn], [UpdatedOn]) VALUES (5007, N'Reddy', N'Test', N'testsupervisor@gmail.com', N'890789788', N'Test@123', N'Supervisor', NULL, 1, CAST(N'2022-11-05T00:00:00.000' AS DateTime), CAST(N'2022-11-05T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[tbl_Users] ([UserId], [FirstName], [LastName], [Email], [MobileNumber], [Password], [Role], [Supervisor], [IsActive], [CreatedOn], [UpdatedOn]) VALUES (5008, N'Reddy', N'Test', N'testengineer@gmail.com', N'7890789078', N'Test@123', N'Engineer', NULL, 1, CAST(N'2022-11-05T00:00:00.000' AS DateTime), CAST(N'2022-11-05T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[tbl_Users] ([UserId], [FirstName], [LastName], [Email], [MobileNumber], [Password], [Role], [Supervisor], [IsActive], [CreatedOn], [UpdatedOn]) VALUES (5009, N'Mubeena', N'E', N'testengineerm@gmail.com', N'875678977', N'Test@123', N'Engineer', NULL, 1, CAST(N'2022-11-05T00:00:00.000' AS DateTime), CAST(N'2022-11-05T00:00:00.000' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[tbl_Users] OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_VehicleRegistration] ON 
GO
INSERT [dbo].[tbl_VehicleRegistration] ([VehicleNo], [VehicleRunningNo], [VModel], [SiteNo], [StartDate], [EDCDate], [Supervisor]) VALUES (1, N'M-123', 1, 1, CAST(N'2022-01-01T00:00:00.000' AS DateTime), NULL, 3008)
GO
INSERT [dbo].[tbl_VehicleRegistration] ([VehicleNo], [VehicleRunningNo], [VModel], [SiteNo], [StartDate], [EDCDate], [Supervisor]) VALUES (2, N'M-454', 2, 1, CAST(N'2022-02-05T00:00:00.000' AS DateTime), NULL, 4008)
GO
SET IDENTITY_INSERT [dbo].[tbl_VehicleRegistration] OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_VehicleStageProgress] ON 
GO
INSERT [dbo].[tbl_VehicleStageProgress] ([Id], [VehicleId], [StageId], [Status], [SupervisorId], [SiteId]) VALUES (1, 1, 1, N'Completed', 3008, 1)
GO
INSERT [dbo].[tbl_VehicleStageProgress] ([Id], [VehicleId], [StageId], [Status], [SupervisorId], [SiteId]) VALUES (2, 1, 2, N'InProgress', 3008, 1)
GO
INSERT [dbo].[tbl_VehicleStageProgress] ([Id], [VehicleId], [StageId], [Status], [SupervisorId], [SiteId]) VALUES (1002, 2, 1, N'InProgress', 3008, 1)
GO
SET IDENTITY_INSERT [dbo].[tbl_VehicleStageProgress] OFF
GO
ALTER TABLE [dbo].[tbl_CustomerAddressDetails] ADD  CONSTRAINT [DF_tbl_CustomerAddressDetails_IsPrimary]  DEFAULT ((1)) FOR [IsPrimary]
GO
ALTER TABLE [dbo].[tbl_CustomerProfile] ADD  CONSTRAINT [DF_tbl_CustomerProfile_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[tbl_CustomerTransactions] ADD  CONSTRAINT [DF_tbl_CustomerTransactions_TransactionStatus]  DEFAULT ((0)) FOR [TransactionStatus]
GO
ALTER TABLE [dbo].[tbl_Product] ADD  CONSTRAINT [DF_tbl_Product_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[tbl_Product] ADD  CONSTRAINT [DF_tbl_Product_UpdatedOn]  DEFAULT (getdate()) FOR [UpdatedOn]
GO
ALTER TABLE [dbo].[tbl_ProductCategory] ADD  CONSTRAINT [DF_tbl_ProductCategory_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[tbl_ProductCategory] ADD  CONSTRAINT [DF_tbl_ProductCategory_UpdatedOn]  DEFAULT (getdate()) FOR [UpdatedOn]
GO
ALTER TABLE [dbo].[tbl_UserRoles] ADD  CONSTRAINT [DF_tbl_UserRoles_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[tbl_CustomerAddressDetails]  WITH CHECK ADD  CONSTRAINT [FK_tbl_CustomerAddressDetails_tbl_CustomerProfile] FOREIGN KEY([CustomerId])
REFERENCES [dbo].[tbl_CustomerProfile] ([CustomerID])
GO
ALTER TABLE [dbo].[tbl_CustomerAddressDetails] CHECK CONSTRAINT [FK_tbl_CustomerAddressDetails_tbl_CustomerProfile]
GO
ALTER TABLE [dbo].[tbl_CustomerCart]  WITH CHECK ADD  CONSTRAINT [FK_tbl_CustomerCart_tbl_CustomerProfile] FOREIGN KEY([CustomerId])
REFERENCES [dbo].[tbl_CustomerProfile] ([CustomerID])
GO
ALTER TABLE [dbo].[tbl_CustomerCart] CHECK CONSTRAINT [FK_tbl_CustomerCart_tbl_CustomerProfile]
GO
ALTER TABLE [dbo].[tbl_CustomerCart]  WITH CHECK ADD  CONSTRAINT [FK_tbl_CustomerCart_tbl_Product] FOREIGN KEY([Product])
REFERENCES [dbo].[tbl_Product] ([ProductId])
GO
ALTER TABLE [dbo].[tbl_CustomerCart] CHECK CONSTRAINT [FK_tbl_CustomerCart_tbl_Product]
GO
ALTER TABLE [dbo].[tbl_JobCardDetails]  WITH CHECK ADD  CONSTRAINT [FK_tbl_JobCardDetails_tbl_Stages] FOREIGN KEY([StageId])
REFERENCES [dbo].[tbl_Stages] ([StageId])
GO
ALTER TABLE [dbo].[tbl_JobCardDetails] CHECK CONSTRAINT [FK_tbl_JobCardDetails_tbl_Stages]
GO
ALTER TABLE [dbo].[tbl_JobCardDetails]  WITH CHECK ADD  CONSTRAINT [FK_tbl_JobCardDetails_tbl_UserProfile] FOREIGN KEY([AssignedTo])
REFERENCES [dbo].[tbl_UserProfile] ([UserId])
GO
ALTER TABLE [dbo].[tbl_JobCardDetails] CHECK CONSTRAINT [FK_tbl_JobCardDetails_tbl_UserProfile]
GO
ALTER TABLE [dbo].[tbl_JobCardDetails]  WITH CHECK ADD  CONSTRAINT [FK_tbl_JobCardDetails_tbl_VehicleRegistration] FOREIGN KEY([VehicleId])
REFERENCES [dbo].[tbl_VehicleRegistration] ([VehicleNo])
GO
ALTER TABLE [dbo].[tbl_JobCardDetails] CHECK CONSTRAINT [FK_tbl_JobCardDetails_tbl_VehicleRegistration]
GO
ALTER TABLE [dbo].[tbl_Product]  WITH CHECK ADD  CONSTRAINT [FK_tbl_Product_tbl_ProductCategory] FOREIGN KEY([Category])
REFERENCES [dbo].[tbl_ProductCategory] ([CategoryId])
GO
ALTER TABLE [dbo].[tbl_Product] CHECK CONSTRAINT [FK_tbl_Product_tbl_ProductCategory]
GO
ALTER TABLE [dbo].[tbl_ProductsRatingByCustomer]  WITH CHECK ADD  CONSTRAINT [FK_tbl_ProductsRatingByCustomer_tbl_CustomerProfile] FOREIGN KEY([CustomerId])
REFERENCES [dbo].[tbl_CustomerProfile] ([CustomerID])
GO
ALTER TABLE [dbo].[tbl_ProductsRatingByCustomer] CHECK CONSTRAINT [FK_tbl_ProductsRatingByCustomer_tbl_CustomerProfile]
GO
ALTER TABLE [dbo].[tbl_ProductsRatingByCustomer]  WITH CHECK ADD  CONSTRAINT [FK_tbl_ProductsRatingByCustomer_tbl_Product] FOREIGN KEY([ProductId])
REFERENCES [dbo].[tbl_Product] ([ProductId])
GO
ALTER TABLE [dbo].[tbl_ProductsRatingByCustomer] CHECK CONSTRAINT [FK_tbl_ProductsRatingByCustomer_tbl_Product]
GO
ALTER TABLE [dbo].[tbl_QualityChecker]  WITH CHECK ADD  CONSTRAINT [FK_tbl_QualityChecker_tbl_JobCardDetails] FOREIGN KEY([JobCardNo])
REFERENCES [dbo].[tbl_UserProfile] ([UserId])
GO
ALTER TABLE [dbo].[tbl_QualityChecker] CHECK CONSTRAINT [FK_tbl_QualityChecker_tbl_JobCardDetails]
GO
ALTER TABLE [dbo].[tbl_QualityChecker]  WITH CHECK ADD  CONSTRAINT [FK_tbl_QualityChecker_tbl_QualityFactors] FOREIGN KEY([Supervisor])
REFERENCES [dbo].[tbl_UserProfile] ([UserId])
GO
ALTER TABLE [dbo].[tbl_QualityChecker] CHECK CONSTRAINT [FK_tbl_QualityChecker_tbl_QualityFactors]
GO
ALTER TABLE [dbo].[tbl_QualityFactors]  WITH CHECK ADD  CONSTRAINT [FK_tbl_QualityFactors_tbl_Stages] FOREIGN KEY([StageId])
REFERENCES [dbo].[tbl_Stages] ([StageId])
GO
ALTER TABLE [dbo].[tbl_QualityFactors] CHECK CONSTRAINT [FK_tbl_QualityFactors_tbl_Stages]
GO
ALTER TABLE [dbo].[tbl_UserProfile]  WITH CHECK ADD  CONSTRAINT [FK_tbl_UserProfile_tbl_UserRoles] FOREIGN KEY([Role])
REFERENCES [dbo].[tbl_UserRoles] ([RoleId])
GO
ALTER TABLE [dbo].[tbl_UserProfile] CHECK CONSTRAINT [FK_tbl_UserProfile_tbl_UserRoles]
GO
ALTER TABLE [dbo].[tbl_VehicleRegistration]  WITH CHECK ADD  CONSTRAINT [FK_tbl_VehicleRegistration_tbl_Models] FOREIGN KEY([VModel])
REFERENCES [dbo].[tbl_Models] ([ModelId])
GO
ALTER TABLE [dbo].[tbl_VehicleRegistration] CHECK CONSTRAINT [FK_tbl_VehicleRegistration_tbl_Models]
GO
ALTER TABLE [dbo].[tbl_VehicleRegistration]  WITH CHECK ADD  CONSTRAINT [FK_tbl_VehicleRegistration_tbl_Sites] FOREIGN KEY([SiteNo])
REFERENCES [dbo].[tbl_Sites] ([SiteId])
GO
ALTER TABLE [dbo].[tbl_VehicleRegistration] CHECK CONSTRAINT [FK_tbl_VehicleRegistration_tbl_Sites]
GO
/****** Object:  StoredProcedure [dbo].[Sp_GetAllProducts]    Script Date: 28-Apr-22 4:47:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Reddy
-- Create date: 14-08-2020
-- Description:	To Select All Products
-- =============================================
CREATE PROCEDURE [dbo].[Sp_GetAllProducts] 	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    Select * from tbl_Product
END
GO
/****** Object:  StoredProcedure [dbo].[Sp_GetCustomerTransactions]    Script Date: 28-Apr-22 4:47:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Reddy
-- Create date: 17/08/2020
-- Description:	To Get Customer History Transactions
-- =============================================
CREATE PROCEDURE [dbo].[Sp_GetCustomerTransactions]
	@CustomerId int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	Select * from tbl_CustomerTransactions where CustomerId =@CustomerId
END
GO
/****** Object:  StoredProcedure [dbo].[Sp_GetProductFeedBack]    Script Date: 28-Apr-22 4:47:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Reddy
-- Create date: 17/08/2020
-- Description:	To Get Products Feedback
-- =============================================
CREATE PROCEDURE [dbo].[Sp_GetProductFeedBack]
	@ProductId int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	Select * from tbl_ProductsRatingByCustomer where ProductId=@ProductId
END
GO
/****** Object:  StoredProcedure [dbo].[Sp_GetProductsByCategory]    Script Date: 28-Apr-22 4:47:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[Sp_GetProductsByCategory]
@Category int
AS
if (@Category =0)
BEGIN
Select * from tbl_Product
END
ELSE
BEGIN
Select * from tbl_Product where Category =@Category
END

GO
/****** Object:  StoredProcedure [dbo].[Sp_SaveorUpdateCustomer]    Script Date: 28-Apr-22 4:47:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Reddy
-- Create date: 14-08-2020
-- Description:	Save/Update Customer Profile
-- =============================================
Create PROCEDURE [dbo].[Sp_SaveorUpdateCustomer] 
    @CustomerId int =0,
	@FirstName nvarchar(200),
	@LastName nvarchar(200),
	@DOB date,
	@Gender nvarchar(15),
	@Email nvarchar(200),
	@MobileNumber nvarchar(20),
	@Password nvarchar(max),
	@CreatedOn datetime
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	If @CustomerId=0
	BEGIN

	Insert into tbl_CustomerProfile(FirstName, LastName,DOB ,Gender ,Email ,MobileNumber ,Password,CreatedOn)
	Values(@FirstName, @LastName,@DOB ,@Gender ,@Email ,@MobileNumber ,@Password,@CreatedOn)

	END
	ELSE
	BEGIN
	
	Update tbl_CustomerProfile  set FirstName=@FirstName , 
	LastName=@LastName ,
	DOB=@DOB  ,
	Gender=@Gender  ,
	Email =@Email ,
	MobileNumber =@MobileNumber ,
	[Password]=@Password where CustomerID =@CustomerId 

	END

    -- Insert statements for procedure here
	
END
GO
/****** Object:  StoredProcedure [dbo].[Sp_SaveProductCategory]    Script Date: 28-Apr-22 4:47:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Reddy
-- Create date: 14-08-2020
-- Description:	Save ProductCategory
-- =============================================
CREATE PROCEDURE [dbo].[Sp_SaveProductCategory] 
	@CategoryName nvarchar(200),
	@Description nvarchar(max),
	@CreatedOn datetime
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	Insert into tbl_ProductCategory(CategoryName, CategoryDescription,CreatedOn)
	Values(@CategoryName ,@Description ,@CreatedOn)
END
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "T1"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "T2"
            Begin Extent = 
               Top = 6
               Left = 246
               Bottom = 136
               Right = 443
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Vw_CustomizedProductSelection'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Vw_CustomizedProductSelection'
GO
USE [master]
GO
ALTER DATABASE [RTQMS] SET  READ_WRITE 
GO
