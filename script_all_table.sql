USE [dbhani]
GO
/****** Object:  Table [dbo].[commerical_tbl]    Script Date: 2025-03-15 22:09:01 ******/
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
/****** Object:  Table [dbo].[company_tbl]    Script Date: 2025-03-15 22:09:01 ******/
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
/****** Object:  Table [dbo].[country_tbl]    Script Date: 2025-03-15 22:09:01 ******/
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
/****** Object:  Table [dbo].[drug_tbl]    Script Date: 2025-03-15 22:09:01 ******/
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
/****** Object:  Table [dbo].[insurance_tbl]    Script Date: 2025-03-15 22:09:01 ******/
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
/****** Object:  Table [dbo].[order_tbl]    Script Date: 2025-03-15 22:09:01 ******/
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
/****** Object:  Table [dbo].[prescription_tbl]    Script Date: 2025-03-15 22:09:01 ******/
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
/****** Object:  Table [dbo].[type_tbl]    Script Date: 2025-03-15 22:09:01 ******/
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
