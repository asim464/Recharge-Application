USE [recharge_db]
GO
/****** Object:  Table [dbo].[tbl_admin_user]    Script Date: 4/25/2022 3:57:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_admin_user](
	[user_id] [int] IDENTITY(1,1) NOT NULL,
	[username] [varchar](100) NOT NULL,
	[password] [varchar](100) NOT NULL,
	[email] [varchar](100) NULL,
	[mobile_number] [varchar](50) NULL,
	[role_id] [int] NULL,
	[created_by] [int] NULL,
	[created_at] [datetime] NULL,
	[updated_by] [int] NULL,
	[updated_at] [datetime] NULL,
	[is_deleted] [bit] NULL,
	[status] [int] NULL,
 CONSTRAINT [PK_tbl_admin_user] PRIMARY KEY CLUSTERED 
(
	[user_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_reg_companies]    Script Date: 4/25/2022 3:57:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_reg_companies](
	[company_id] [int] NULL,
	[company_name] [varchar](100) NULL,
	[official_number] [varchar](50) NULL,
	[registrant_number] [varchar](50) NULL,
	[registrant_designation] [varchar](100) NULL,
	[registrant_mobile] [varchar](50) NULL,
	[status] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_reg_vehicle]    Script Date: 4/25/2022 3:57:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_reg_vehicle](
	[vehicle_id] [int] IDENTITY(1,1) NOT NULL,
	[vehicle_registration_no] [varchar](100) NULL,
	[vehicle_made_id] [int] NULL,
	[vehicle_modal] [int] NULL,
	[vehicle_color] [varchar](50) NULL,
	[vehicle_type_id] [int] NULL,
	[owner_mobile_no] [bigint] NULL,
	[vehicle_owner_name] [varchar](100) NULL,
	[vehicle_owner_cnic] [varchar](50) NULL,
	[reg_center_id] [int] NULL,
	[is_company] [bit] NULL,
	[company_id] [int] NULL,
	[m_tag_token] [varchar](100) NULL,
	[vehicle_chasis_no] [varchar](100) NULL,
	[vehicle_class_id] [int] NULL,
	[issue_date] [date] NULL,
	[expiry_date] [date] NULL,
	[tag_type_id] [int] NULL,
	[created_by] [int] NULL,
	[created_at] [datetime] NULL,
	[updated_by] [int] NULL,
	[updated_at] [datetime] NULL,
	[is_deleted] [bit] NULL,
	[status] [int] NULL,
 CONSTRAINT [PK_tbl_vehicle_registration] PRIMARY KEY CLUSTERED 
(
	[vehicle_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[tbl_admin_user] ON 

INSERT [dbo].[tbl_admin_user] ([user_id], [username], [password], [email], [mobile_number], [role_id], [created_by], [created_at], [updated_by], [updated_at], [is_deleted], [status]) VALUES (1, N'superadmin', N'Admin@123', N'mkashi73@gmail.com', N'03239334772', 1, 1, CAST(N'2022-04-20T15:19:01.477' AS DateTime), NULL, NULL, 0, 0)
SET IDENTITY_INSERT [dbo].[tbl_admin_user] OFF
GO
