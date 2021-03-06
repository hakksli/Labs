USE [master]
GO
/****** Object:  Database [GulaDB]    Script Date: 2015-05-13 17:00:40 ******/
CREATE DATABASE [GulaDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'GulaDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\GulaDB.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'GulaDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\GulaDB_log.ldf' , SIZE = 2048KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [GulaDB] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [GulaDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [GulaDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [GulaDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [GulaDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [GulaDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [GulaDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [GulaDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [GulaDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [GulaDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [GulaDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [GulaDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [GulaDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [GulaDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [GulaDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [GulaDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [GulaDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [GulaDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [GulaDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [GulaDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [GulaDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [GulaDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [GulaDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [GulaDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [GulaDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [GulaDB] SET  MULTI_USER 
GO
ALTER DATABASE [GulaDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [GulaDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [GulaDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [GulaDB] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [GulaDB] SET DELAYED_DURABILITY = DISABLED 
GO
USE [GulaDB]
GO
/****** Object:  Table [dbo].[Address]    Script Date: 2015-05-13 17:00:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Address](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Street] [nvarchar](max) NOT NULL,
	[Zip] [nvarchar](10) NOT NULL,
	[City] [nvarchar](max) NOT NULL,
	[CountryId] [int] NOT NULL,
	[IsHome] [bit] NOT NULL,
 CONSTRAINT [PK_Address] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Company]    Script Date: 2015-05-13 17:00:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Company](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[AddressId] [int] NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
	[OfficePhoneNumber] [nvarchar](50) NOT NULL,
	[Email] [nvarchar](max) NOT NULL,
	[Logo] [nvarchar](max) NULL,
 CONSTRAINT [PK_Company] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Country]    Script Date: 2015-05-13 17:00:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Country](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Country] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[People]    Script Date: 2015-05-13 17:00:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[People](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](max) NOT NULL,
	[LastName] [nvarchar](max) NOT NULL,
	[CompanyId] [int] NULL,
	[AddressId] [int] NOT NULL,
	[MobilePhoneNumber] [nvarchar](max) NOT NULL,
	[Email] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_People] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Product]    Script Date: 2015-05-13 17:00:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
	[Image] [nvarchar](max) NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ProductsInCompany]    Script Date: 2015-05-13 17:00:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductsInCompany](
	[ProductId] [int] NOT NULL,
	[CompanyId] [int] NOT NULL,
 CONSTRAINT [PK_ProductsInCompany] PRIMARY KEY CLUSTERED 
(
	[ProductId] ASC,
	[CompanyId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  View [dbo].[CompanyInfo]    Script Date: 2015-05-13 17:00:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[CompanyInfo]
AS
SELECT Id, Name, AddressId, Description, OfficePhoneNumber, Email, Logo
FROM     dbo.Company

GO
SET IDENTITY_INSERT [dbo].[Address] ON 

INSERT [dbo].[Address] ([Id], [Street], [Zip], [City], [CountryId], [IsHome]) VALUES (1, N'Slottsskogsgatan 42', N'41453', N'Gothenburg', 1, 1)
INSERT [dbo].[Address] ([Id], [Street], [Zip], [City], [CountryId], [IsHome]) VALUES (2, N'Långedragsvägen 72', N'42661', N'Gothenburg', 1, 1)
INSERT [dbo].[Address] ([Id], [Street], [Zip], [City], [CountryId], [IsHome]) VALUES (3, N'Sockerbruket', N'11111', N'Gothenburg', 1, 0)
INSERT [dbo].[Address] ([Id], [Street], [Zip], [City], [CountryId], [IsHome]) VALUES (4, N'Undulatburen 3', N'12345', N'Östersund', 1, 0)
INSERT [dbo].[Address] ([Id], [Street], [Zip], [City], [CountryId], [IsHome]) VALUES (5, N'Didzioji 10', N'02222', N'Vilnius', 5, 0)
INSERT [dbo].[Address] ([Id], [Street], [Zip], [City], [CountryId], [IsHome]) VALUES (6, N'Hemlighetsgatan 44', N'12589', N'Gothenburg', 1, 1)
INSERT [dbo].[Address] ([Id], [Street], [Zip], [City], [CountryId], [IsHome]) VALUES (7, N'Kvalmgatan 2', N'57526', N'Oslo', 3, 1)
INSERT [dbo].[Address] ([Id], [Street], [Zip], [City], [CountryId], [IsHome]) VALUES (8, N'Muminslottet', N'57782', N'Mariehamn', 2, 1)
INSERT [dbo].[Address] ([Id], [Street], [Zip], [City], [CountryId], [IsHome]) VALUES (9, N'Pölsebo', N'26785', N'Copenhagen', 4, 1)
INSERT [dbo].[Address] ([Id], [Street], [Zip], [City], [CountryId], [IsHome]) VALUES (11, N'Soumilaja 5', N'54985', N'Helsinki', 2, 0)
SET IDENTITY_INSERT [dbo].[Address] OFF
SET IDENTITY_INSERT [dbo].[Company] ON 

INSERT [dbo].[Company] ([Id], [Name], [AddressId], [Description], [OfficePhoneNumber], [Email], [Logo]) VALUES (1, N'Elektron', 3, N'Music Machines', N'031546258', N'info@elektron.se', N'elektronLogo.png')
INSERT [dbo].[Company] ([Id], [Name], [AddressId], [Description], [OfficePhoneNumber], [Email], [Logo]) VALUES (2, N'WingNuts', 4, N'Fågelburar', N'024525656', N'info@wingnuts.se', NULL)
INSERT [dbo].[Company] ([Id], [Name], [AddressId], [Description], [OfficePhoneNumber], [Email], [Logo]) VALUES (3, N'SecretGames', 5, N'Gamez', N'549855625', N'info@secretgames.lt', NULL)
INSERT [dbo].[Company] ([Id], [Name], [AddressId], [Description], [OfficePhoneNumber], [Email], [Logo]) VALUES (4, N'Fina möbler AB', 11, N'Möbler', N'845662562', N'info@finamobler.fi', NULL)
SET IDENTITY_INSERT [dbo].[Company] OFF
SET IDENTITY_INSERT [dbo].[Country] ON 

INSERT [dbo].[Country] ([Id], [Name]) VALUES (1, N'Sweden')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (2, N'Finland')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (3, N'Norway')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (4, N'Denmark')
INSERT [dbo].[Country] ([Id], [Name]) VALUES (5, N'Lithuania')
SET IDENTITY_INSERT [dbo].[Country] OFF
SET IDENTITY_INSERT [dbo].[People] ON 

INSERT [dbo].[People] ([Id], [FirstName], [LastName], [CompanyId], [AddressId], [MobilePhoneNumber], [Email]) VALUES (1, N'Johannes', N'Larsson', 2, 2, N'0700000000', N'jojje@jojje.se')
INSERT [dbo].[People] ([Id], [FirstName], [LastName], [CompanyId], [AddressId], [MobilePhoneNumber], [Email]) VALUES (2, N'Peter', N'Pan', NULL, 2, N'0701569978', N'pan@hotmail.com')
INSERT [dbo].[People] ([Id], [FirstName], [LastName], [CompanyId], [AddressId], [MobilePhoneNumber], [Email]) VALUES (3, N'Mikael', N'Mannika', 2, 1, N'0706876596', N'mikael@mjm.se')
INSERT [dbo].[People] ([Id], [FirstName], [LastName], [CompanyId], [AddressId], [MobilePhoneNumber], [Email]) VALUES (4, N'Viktorija', N'Krapaviciute', 1, 6, N'0727536987', N'h0pi@kopy.se')
INSERT [dbo].[People] ([Id], [FirstName], [LastName], [CompanyId], [AddressId], [MobilePhoneNumber], [Email]) VALUES (5, N'Teemu', N'Selänne', 4, 8, N'0734526998', N'teemu@fina.fi')
SET IDENTITY_INSERT [dbo].[People] OFF
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([Id], [Name], [Description], [Image]) VALUES (1, N'Mono machine', N'Synthesizer', N'monomachine.png')
INSERT [dbo].[Product] ([Id], [Name], [Description], [Image]) VALUES (2, N'Undulat', N'Fågel', NULL)
INSERT [dbo].[Product] ([Id], [Name], [Description], [Image]) VALUES (3, N'Bloody war 3', N'Video game', NULL)
SET IDENTITY_INSERT [dbo].[Product] OFF
ALTER TABLE [dbo].[Address]  WITH CHECK ADD  CONSTRAINT [FK_Address_Country] FOREIGN KEY([CountryId])
REFERENCES [dbo].[Country] ([Id])
GO
ALTER TABLE [dbo].[Address] CHECK CONSTRAINT [FK_Address_Country]
GO
ALTER TABLE [dbo].[Company]  WITH CHECK ADD  CONSTRAINT [FK_Company_Address] FOREIGN KEY([AddressId])
REFERENCES [dbo].[Address] ([Id])
GO
ALTER TABLE [dbo].[Company] CHECK CONSTRAINT [FK_Company_Address]
GO
ALTER TABLE [dbo].[People]  WITH CHECK ADD  CONSTRAINT [FK_People_Address] FOREIGN KEY([AddressId])
REFERENCES [dbo].[Address] ([Id])
GO
ALTER TABLE [dbo].[People] CHECK CONSTRAINT [FK_People_Address]
GO
ALTER TABLE [dbo].[People]  WITH CHECK ADD  CONSTRAINT [FK_People_Company] FOREIGN KEY([CompanyId])
REFERENCES [dbo].[Company] ([Id])
GO
ALTER TABLE [dbo].[People] CHECK CONSTRAINT [FK_People_Company]
GO
ALTER TABLE [dbo].[ProductsInCompany]  WITH CHECK ADD  CONSTRAINT [FK_ProductsInCompany_Company] FOREIGN KEY([CompanyId])
REFERENCES [dbo].[Company] ([Id])
GO
ALTER TABLE [dbo].[ProductsInCompany] CHECK CONSTRAINT [FK_ProductsInCompany_Company]
GO
ALTER TABLE [dbo].[ProductsInCompany]  WITH CHECK ADD  CONSTRAINT [FK_ProductsInCompany_Product] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Product] ([Id])
GO
ALTER TABLE [dbo].[ProductsInCompany] CHECK CONSTRAINT [FK_ProductsInCompany_Product]
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
         Begin Table = "Company"
            Begin Extent = 
               Top = 7
               Left = 48
               Bottom = 170
               Right = 278
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'CompanyInfo'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'CompanyInfo'
GO
USE [master]
GO
ALTER DATABASE [GulaDB] SET  READ_WRITE 
GO
