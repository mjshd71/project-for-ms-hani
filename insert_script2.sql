USE [master]
GO
/****** Object:  Database [dbdrugs]    Script Date: 2025-03-15 23:12:40 ******/
CREATE DATABASE [dbdrugs]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'dbdrugs', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.TECHNOTO\MSSQL\DATA\dbdrugs.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'dbdrugs_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.TECHNOTO\MSSQL\DATA\dbdrugs_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [dbdrugs] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [dbdrugs].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [dbdrugs] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [dbdrugs] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [dbdrugs] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [dbdrugs] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [dbdrugs] SET ARITHABORT OFF 
GO
ALTER DATABASE [dbdrugs] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [dbdrugs] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [dbdrugs] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [dbdrugs] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [dbdrugs] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [dbdrugs] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [dbdrugs] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [dbdrugs] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [dbdrugs] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [dbdrugs] SET  ENABLE_BROKER 
GO
ALTER DATABASE [dbdrugs] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [dbdrugs] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [dbdrugs] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [dbdrugs] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [dbdrugs] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [dbdrugs] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [dbdrugs] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [dbdrugs] SET RECOVERY FULL 
GO
ALTER DATABASE [dbdrugs] SET  MULTI_USER 
GO
ALTER DATABASE [dbdrugs] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [dbdrugs] SET DB_CHAINING OFF 
GO
ALTER DATABASE [dbdrugs] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [dbdrugs] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [dbdrugs] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [dbdrugs] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'dbdrugs', N'ON'
GO
ALTER DATABASE [dbdrugs] SET QUERY_STORE = ON
GO
ALTER DATABASE [dbdrugs] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [dbdrugs]
GO
/****** Object:  Table [dbo].[commerical_tbl]    Script Date: 2025-03-15 23:12:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[commerical_tbl](
	[commerical_Id] [int] IDENTITY(1,1) NOT NULL,
	[commerical_name] [nvarchar](70) NULL,
	[company_Id] [int] NULL,
	[drug_Id] [int] NULL,
	[commerical_price] [money] NULL,
PRIMARY KEY CLUSTERED 
(
	[commerical_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[company_tbl]    Script Date: 2025-03-15 23:12:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[company_tbl](
	[company_Id] [int] IDENTITY(1,1) NOT NULL,
	[company_name] [nvarchar](70) NULL,
	[country_Id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[company_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[country_tbl]    Script Date: 2025-03-15 23:12:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[country_tbl](
	[country_Id] [int] IDENTITY(1,1) NOT NULL,
	[country_name] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[country_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[drug_tbl]    Script Date: 2025-03-15 23:12:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[drug_tbl](
	[drug_Id] [int] IDENTITY(1,1) NOT NULL,
	[drug_genericName] [nvarchar](70) NULL,
	[type_Id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[drug_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[insurance_tbl]    Script Date: 2025-03-15 23:12:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[insurance_tbl](
	[insurance_id] [int] IDENTITY(1,1) NOT NULL,
	[insurance_Name] [nvarchar](70) NULL,
PRIMARY KEY CLUSTERED 
(
	[insurance_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[order_tbl]    Script Date: 2025-03-15 23:12:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[order_tbl](
	[order_Id] [int] IDENTITY(1,1) NOT NULL,
	[prescription_Id] [int] NULL,
	[commerical_Id] [int] NULL,
	[order_measure] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[order_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[prescription_tbl]    Script Date: 2025-03-15 23:12:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[prescription_tbl](
	[prescription_Id] [int] IDENTITY(1,1) NOT NULL,
	[prescription_name] [nvarchar](70) NULL,
	[prescription_family] [nvarchar](70) NULL,
	[prescription_date] [date] NULL,
	[insurance_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[prescription_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[type_tbl]    Script Date: 2025-03-15 23:12:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[type_tbl](
	[type_Id] [int] IDENTITY(1,1) NOT NULL,
	[type_Name] [nvarchar](70) NULL,
PRIMARY KEY CLUSTERED 
(
	[type_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[commerical_tbl]  WITH CHECK ADD  CONSTRAINT [fk_company_commerical] FOREIGN KEY([company_Id])
REFERENCES [dbo].[company_tbl] ([company_Id])
GO
ALTER TABLE [dbo].[commerical_tbl] CHECK CONSTRAINT [fk_company_commerical]
GO
ALTER TABLE [dbo].[commerical_tbl]  WITH CHECK ADD  CONSTRAINT [fk_drug_commerical] FOREIGN KEY([drug_Id])
REFERENCES [dbo].[drug_tbl] ([drug_Id])
GO
ALTER TABLE [dbo].[commerical_tbl] CHECK CONSTRAINT [fk_drug_commerical]
GO
ALTER TABLE [dbo].[company_tbl]  WITH CHECK ADD  CONSTRAINT [fk_country_company] FOREIGN KEY([country_Id])
REFERENCES [dbo].[country_tbl] ([country_Id])
GO
ALTER TABLE [dbo].[company_tbl] CHECK CONSTRAINT [fk_country_company]
GO
ALTER TABLE [dbo].[drug_tbl]  WITH CHECK ADD  CONSTRAINT [fk_type_drug] FOREIGN KEY([type_Id])
REFERENCES [dbo].[type_tbl] ([type_Id])
GO
ALTER TABLE [dbo].[drug_tbl] CHECK CONSTRAINT [fk_type_drug]
GO
ALTER TABLE [dbo].[order_tbl]  WITH CHECK ADD  CONSTRAINT [fk_commerical_order] FOREIGN KEY([commerical_Id])
REFERENCES [dbo].[commerical_tbl] ([commerical_Id])
GO
ALTER TABLE [dbo].[order_tbl] CHECK CONSTRAINT [fk_commerical_order]
GO
ALTER TABLE [dbo].[order_tbl]  WITH CHECK ADD  CONSTRAINT [fk_prescription_order] FOREIGN KEY([prescription_Id])
REFERENCES [dbo].[prescription_tbl] ([prescription_Id])
GO
ALTER TABLE [dbo].[order_tbl] CHECK CONSTRAINT [fk_prescription_order]
GO
ALTER TABLE [dbo].[prescription_tbl]  WITH CHECK ADD  CONSTRAINT [fk_insurance_prescription] FOREIGN KEY([insurance_id])
REFERENCES [dbo].[insurance_tbl] ([insurance_id])
GO
ALTER TABLE [dbo].[prescription_tbl] CHECK CONSTRAINT [fk_insurance_prescription]
GO
/****** Object:  StoredProcedure [dbo].[GetMostExpensiveDrug]    Script Date: 2025-03-15 23:12:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[GetMostExpensiveDrug]
    @company_Id int
AS
BEGIN
    select top 1
        c.commerical_name AS' داروی_تجاری',
        c.commerical_price AS' قیمت'
    from 
        commerical_tbl c
    where 
        c.company_Id = @company_Id
   order by 
        c.commerical_price desc;
END
GO
USE [master]
GO
ALTER DATABASE [dbdrugs] SET  READ_WRITE 
GO
