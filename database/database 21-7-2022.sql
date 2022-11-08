USE [recharge_db]
GO
/****** Object:  Table [dbo].[tbl_admin_user]    Script Date: 21/07/2022 3:57:24 pm ******/
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
	[user_type] [int] NULL,
	[reg_center_id] [int] NULL,
	[company_id] [int] NULL,
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
/****** Object:  Table [dbo].[tbl_lkpt_boths]    Script Date: 21/07/2022 3:57:24 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_lkpt_boths](
	[both_id] [int] IDENTITY(1,1) NOT NULL,
	[both_number] [int] NULL,
	[lane_number] [int] NULL,
	[both_type] [varchar](50) NULL,
	[both_status] [int] NULL,
	[plaza_id] [int] NULL,
 CONSTRAINT [PK_tbl_lkpt_boths] PRIMARY KEY CLUSTERED 
(
	[both_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_lkpt_cities]    Script Date: 21/07/2022 3:57:24 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_lkpt_cities](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[city_name] [varchar](50) NULL,
	[province_id] [int] NULL,
 CONSTRAINT [PK_tbl_lkpt_cities] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_lkpt_provinces]    Script Date: 21/07/2022 3:57:24 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_lkpt_provinces](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[province_name] [varchar](40) NULL,
 CONSTRAINT [PK_tbl_lkpt_provinces] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_lkpt_reg_centers]    Script Date: 21/07/2022 3:57:24 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_lkpt_reg_centers](
	[reg_center_id] [int] IDENTITY(1,1) NOT NULL,
	[center_name] [varchar](100) NULL,
	[plaza_id] [int] NULL,
 CONSTRAINT [PK_tbl_lkpt_reg_centers] PRIMARY KEY CLUSTERED 
(
	[reg_center_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_lkpt_roles]    Script Date: 21/07/2022 3:57:24 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_lkpt_roles](
	[role_id] [int] IDENTITY(1,1) NOT NULL,
	[role_name] [varchar](100) NULL,
	[role_type] [varchar](100) NULL,
	[status] [int] NULL,
 CONSTRAINT [PK_tbl_lkpt_roles_1] PRIMARY KEY CLUSTERED 
(
	[role_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_lkpt_toll_tax]    Script Date: 21/07/2022 3:57:24 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_lkpt_toll_tax](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[entry_station_name] [varchar](50) NULL,
	[exit_station_name] [varchar](50) NULL,
	[entry_point_id] [int] NULL,
	[exit_point_id] [int] NULL,
	[toll_amount] [int] NULL,
	[total_km] [int] NULL,
	[per_km_charges] [int] NULL,
	[vehicle_type_id] [int] NULL,
	[m_id] [int] NULL,
 CONSTRAINT [PK_tbl_lkpt_toll_tax] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_lkpt_tollplaza]    Script Date: 21/07/2022 3:57:24 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_lkpt_tollplaza](
	[plaza_id] [int] IDENTITY(1,1) NOT NULL,
	[city_name] [varchar](100) NULL,
	[no_of_boths] [int] NULL,
 CONSTRAINT [PK_tbl_lkpt_tollplaza] PRIMARY KEY CLUSTERED 
(
	[plaza_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_lkpt_vehicle_class]    Script Date: 21/07/2022 3:57:24 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_lkpt_vehicle_class](
	[class_id] [int] IDENTITY(1,1) NOT NULL,
	[vehicle_class] [varchar](100) NULL,
 CONSTRAINT [PK_tbl_lkpt_vehicle_class] PRIMARY KEY CLUSTERED 
(
	[class_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_lkpt_vehicle_made]    Script Date: 21/07/2022 3:57:24 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_lkpt_vehicle_made](
	[vehicle_made_id] [int] IDENTITY(1,1) NOT NULL,
	[made_name] [varchar](100) NULL,
 CONSTRAINT [PK_tbl_lkpt_vehicle_made] PRIMARY KEY CLUSTERED 
(
	[vehicle_made_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_lkpt_vehicle_type]    Script Date: 21/07/2022 3:57:24 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_lkpt_vehicle_type](
	[vehicle_type_id] [int] IDENTITY(1,1) NOT NULL,
	[type_name] [varchar](100) NULL,
 CONSTRAINT [PK_tbl_lkpt_vehicle_type] PRIMARY KEY CLUSTERED 
(
	[vehicle_type_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_reg_companies]    Script Date: 21/07/2022 3:57:24 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_reg_companies](
	[company_id] [int] IDENTITY(1,1) NOT NULL,
	[company_name] [varchar](100) NULL,
	[official_number] [varchar](50) NULL,
	[registrant_number] [varchar](50) NULL,
	[registrant_designation] [varchar](100) NULL,
	[registrant_mobile] [varchar](50) NULL,
	[status] [int] NULL,
 CONSTRAINT [PK_tbl_reg_companies] PRIMARY KEY CLUSTERED 
(
	[company_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_reg_fleets]    Script Date: 21/07/2022 3:57:24 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_reg_fleets](
	[fleet_id] [int] IDENTITY(1,1) NOT NULL,
	[fleet_name] [varchar](100) NULL,
	[company_id] [int] NULL,
	[number_of_vehicles] [int] NULL,
	[fleet_type] [varchar](100) NULL,
	[status] [int] NULL,
	[created_by] [int] NULL,
	[created_at] [datetime] NULL,
	[updated_by] [int] NULL,
	[updated_at] [datetime] NULL,
	[is_deleted] [bit] NULL,
 CONSTRAINT [PK_tbl_reg_fleets] PRIMARY KEY CLUSTERED 
(
	[fleet_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_reg_vehicle]    Script Date: 21/07/2022 3:57:24 pm ******/
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
	[owner_mobile_sec] [bigint] NULL,
	[vehicle_owner_name] [varchar](100) NULL,
	[vehicle_owner_cnic] [varchar](50) NULL,
	[vehicle_owner_address] [varchar](400) NULL,
	[remarks] [varchar](700) NULL,
	[reg_center_id] [int] NULL,
	[is_company] [bit] NULL,
	[company_id] [int] NULL,
	[m_tag_token] [varchar](100) NULL,
	[vehicle_chasis_no] [varchar](100) NULL,
	[vehicle_engine_no] [varchar](100) NULL,
	[vehicle_class_id] [int] NULL,
	[province_id] [int] NULL,
	[city_id] [int] NULL,
	[issue_date] [date] NULL,
	[expiry_date] [date] NULL,
	[tag_type_id] [int] NULL,
	[drivers_license] [varchar](100) NULL,
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
/****** Object:  Table [dbo].[tbl_rel_fleet]    Script Date: 21/07/2022 3:57:24 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_rel_fleet](
	[rel_id] [int] IDENTITY(1,1) NOT NULL,
	[fleet_id] [int] NULL,
	[vehicle_id] [int] NULL,
	[created_by] [int] NULL,
	[created_at] [datetime] NULL,
	[updated_by] [int] NULL,
	[updated_at] [datetime] NULL,
	[status] [int] NULL,
	[is_deleted] [bit] NULL,
 CONSTRAINT [PK_tbl_rel_fleet] PRIMARY KEY CLUSTERED 
(
	[rel_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_vehicle_account]    Script Date: 21/07/2022 3:57:24 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_vehicle_account](
	[account_id] [int] IDENTITY(1,1) NOT NULL,
	[open_balance] [int] NULL,
	[payment_type] [varchar](50) NULL,
	[payment_amount] [int] NULL,
	[payment_status] [varchar](50) NULL,
	[payment_method] [varchar](50) NULL,
	[vehicle_id] [int] NULL,
	[fleet_id] [int] NULL,
	[close_balance] [int] NULL,
	[created_at] [datetime] NULL,
	[created_by] [int] NULL,
	[updated_at] [datetime] NULL,
	[updated_by] [int] NULL,
 CONSTRAINT [PK_tbl_vehicle_account] PRIMARY KEY CLUSTERED 
(
	[account_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_vehicle_log]    Script Date: 21/07/2022 3:57:24 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_vehicle_log](
	[log_id] [int] IDENTITY(1,1) NOT NULL,
	[process] [varchar](100) NULL,
	[reg_center_id] [int] NULL,
	[toll_plaza_id] [int] NULL,
	[activity_timedate] [datetime] NULL,
	[vechile_id] [int] NULL,
 CONSTRAINT [PK_tbl_vehicle_log] PRIMARY KEY CLUSTERED 
(
	[log_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_vehicle_toll_history]    Script Date: 21/07/2022 3:57:24 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_vehicle_toll_history](
	[toll_id] [int] IDENTITY(1,1) NOT NULL,
	[ep_id] [int] NULL,
	[ex_id] [int] NULL,
	[total_travel_km] [float] NULL,
	[total_tax] [int] NULL,
	[is_bill_settled] [int] NULL,
	[created_at] [datetime] NULL,
	[created_by] [int] NULL,
	[updated_at] [datetime] NULL,
	[updated_by] [int] NULL,
	[is_registered] [bit] NULL,
	[vehicle_id] [int] NULL,
 CONSTRAINT [PK_tbl_vehicle_toll_history] PRIMARY KEY CLUSTERED 
(
	[toll_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[tbl_admin_user] ON 

INSERT [dbo].[tbl_admin_user] ([user_id], [username], [password], [email], [mobile_number], [role_id], [user_type], [reg_center_id], [company_id], [created_by], [created_at], [updated_by], [updated_at], [is_deleted], [status]) VALUES (3, N'superadmin@admin.com', N'123456', N'mkashi73@gmail.com', N'03239334772', 1, 2, 1, 0, 1, CAST(N'2022-05-16T14:17:00.000' AS DateTime), 1, NULL, 1, 0)
INSERT [dbo].[tbl_admin_user] ([user_id], [username], [password], [email], [mobile_number], [role_id], [user_type], [reg_center_id], [company_id], [created_by], [created_at], [updated_by], [updated_at], [is_deleted], [status]) VALUES (22, N'asim', N'123456', N'asimsaddique0@gmail.com', N'54354535345', 2, NULL, 0, 52, NULL, NULL, 22, NULL, 0, 0)
INSERT [dbo].[tbl_admin_user] ([user_id], [username], [password], [email], [mobile_number], [role_id], [user_type], [reg_center_id], [company_id], [created_by], [created_at], [updated_by], [updated_at], [is_deleted], [status]) VALUES (23, N'mkashi73', N'123456', N'mkashi73@gmail.com', N'3239334772', 2, NULL, 0, 53, 3, NULL, NULL, NULL, 0, 0)
SET IDENTITY_INSERT [dbo].[tbl_admin_user] OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_lkpt_cities] ON 

INSERT [dbo].[tbl_lkpt_cities] ([id], [city_name], [province_id]) VALUES (1, N'Quetta', 4)
INSERT [dbo].[tbl_lkpt_cities] ([id], [city_name], [province_id]) VALUES (2, N'Khuzdar', 4)
INSERT [dbo].[tbl_lkpt_cities] ([id], [city_name], [province_id]) VALUES (3, N'Islamabad', 7)
INSERT [dbo].[tbl_lkpt_cities] ([id], [city_name], [province_id]) VALUES (4, N'Peshawar', 1)
INSERT [dbo].[tbl_lkpt_cities] ([id], [city_name], [province_id]) VALUES (5, N'Mardan', 1)
INSERT [dbo].[tbl_lkpt_cities] ([id], [city_name], [province_id]) VALUES (6, N'Mingora', 1)
INSERT [dbo].[tbl_lkpt_cities] ([id], [city_name], [province_id]) VALUES (7, N'Kohat', 1)
INSERT [dbo].[tbl_lkpt_cities] ([id], [city_name], [province_id]) VALUES (8, N'Abottabad', 1)
INSERT [dbo].[tbl_lkpt_cities] ([id], [city_name], [province_id]) VALUES (9, N'Dera Ismail Khan', 1)
INSERT [dbo].[tbl_lkpt_cities] ([id], [city_name], [province_id]) VALUES (10, N'Nowshera', 1)
INSERT [dbo].[tbl_lkpt_cities] ([id], [city_name], [province_id]) VALUES (20, N'Faisalabad', 2)
INSERT [dbo].[tbl_lkpt_cities] ([id], [city_name], [province_id]) VALUES (21, N'Rawalpindi', 2)
INSERT [dbo].[tbl_lkpt_cities] ([id], [city_name], [province_id]) VALUES (22, N'Multan', 2)
INSERT [dbo].[tbl_lkpt_cities] ([id], [city_name], [province_id]) VALUES (23, N'Gujranwala', 2)
INSERT [dbo].[tbl_lkpt_cities] ([id], [city_name], [province_id]) VALUES (24, N'Sargodha', 2)
INSERT [dbo].[tbl_lkpt_cities] ([id], [city_name], [province_id]) VALUES (25, N'Sialkot', 2)
INSERT [dbo].[tbl_lkpt_cities] ([id], [city_name], [province_id]) VALUES (26, N'Bahawalpur', 2)
INSERT [dbo].[tbl_lkpt_cities] ([id], [city_name], [province_id]) VALUES (27, N'Jhang', 2)
INSERT [dbo].[tbl_lkpt_cities] ([id], [city_name], [province_id]) VALUES (28, N'Sheikhupura', 2)
INSERT [dbo].[tbl_lkpt_cities] ([id], [city_name], [province_id]) VALUES (29, N'Gujrat', 2)
INSERT [dbo].[tbl_lkpt_cities] ([id], [city_name], [province_id]) VALUES (30, N'Kasur', 2)
INSERT [dbo].[tbl_lkpt_cities] ([id], [city_name], [province_id]) VALUES (31, N'Rahim Yar Khan', 2)
INSERT [dbo].[tbl_lkpt_cities] ([id], [city_name], [province_id]) VALUES (32, N'Sahiwal', 2)
INSERT [dbo].[tbl_lkpt_cities] ([id], [city_name], [province_id]) VALUES (33, N'Okara', 2)
INSERT [dbo].[tbl_lkpt_cities] ([id], [city_name], [province_id]) VALUES (34, N'Wah', 2)
INSERT [dbo].[tbl_lkpt_cities] ([id], [city_name], [province_id]) VALUES (35, N'Dera Ghazi Khan', 2)
INSERT [dbo].[tbl_lkpt_cities] ([id], [city_name], [province_id]) VALUES (36, N'Chiniot', 2)
INSERT [dbo].[tbl_lkpt_cities] ([id], [city_name], [province_id]) VALUES (37, N'Kamoke', 2)
INSERT [dbo].[tbl_lkpt_cities] ([id], [city_name], [province_id]) VALUES (38, N'Mandi Burewala', 2)
INSERT [dbo].[tbl_lkpt_cities] ([id], [city_name], [province_id]) VALUES (39, N'Jhelum', 2)
INSERT [dbo].[tbl_lkpt_cities] ([id], [city_name], [province_id]) VALUES (40, N'Sadiqabad', 2)
INSERT [dbo].[tbl_lkpt_cities] ([id], [city_name], [province_id]) VALUES (41, N'Khanewal', 2)
INSERT [dbo].[tbl_lkpt_cities] ([id], [city_name], [province_id]) VALUES (42, N'Hafizabad', 2)
INSERT [dbo].[tbl_lkpt_cities] ([id], [city_name], [province_id]) VALUES (43, N'Muzaffargarh', 2)
INSERT [dbo].[tbl_lkpt_cities] ([id], [city_name], [province_id]) VALUES (44, N'Khanpur', 2)
INSERT [dbo].[tbl_lkpt_cities] ([id], [city_name], [province_id]) VALUES (45, N'Gojra', 2)
INSERT [dbo].[tbl_lkpt_cities] ([id], [city_name], [province_id]) VALUES (46, N'Bahawalnagar', 2)
INSERT [dbo].[tbl_lkpt_cities] ([id], [city_name], [province_id]) VALUES (47, N'Muridke', 2)
INSERT [dbo].[tbl_lkpt_cities] ([id], [city_name], [province_id]) VALUES (48, N'Pak Pattan', 2)
INSERT [dbo].[tbl_lkpt_cities] ([id], [city_name], [province_id]) VALUES (49, N'Jaranwala', 2)
INSERT [dbo].[tbl_lkpt_cities] ([id], [city_name], [province_id]) VALUES (50, N'Chishtian Mandi', 2)
INSERT [dbo].[tbl_lkpt_cities] ([id], [city_name], [province_id]) VALUES (51, N'Daska', 2)
INSERT [dbo].[tbl_lkpt_cities] ([id], [city_name], [province_id]) VALUES (52, N'Mandi Bahauddin', 2)
INSERT [dbo].[tbl_lkpt_cities] ([id], [city_name], [province_id]) VALUES (53, N'Ahmadpur East', 2)
INSERT [dbo].[tbl_lkpt_cities] ([id], [city_name], [province_id]) VALUES (54, N'Kamalia', 2)
INSERT [dbo].[tbl_lkpt_cities] ([id], [city_name], [province_id]) VALUES (55, N'Vihari', 2)
INSERT [dbo].[tbl_lkpt_cities] ([id], [city_name], [province_id]) VALUES (56, N'Wazirabad', 2)
INSERT [dbo].[tbl_lkpt_cities] ([id], [city_name], [province_id]) VALUES (57, N'Mirpur Khas', 6)
INSERT [dbo].[tbl_lkpt_cities] ([id], [city_name], [province_id]) VALUES (58, N'Nawabshah', 6)
INSERT [dbo].[tbl_lkpt_cities] ([id], [city_name], [province_id]) VALUES (59, N'Jacobabad', 6)
INSERT [dbo].[tbl_lkpt_cities] ([id], [city_name], [province_id]) VALUES (60, N'Shikarpur', 6)
INSERT [dbo].[tbl_lkpt_cities] ([id], [city_name], [province_id]) VALUES (61, N'Tando Adam', 6)
INSERT [dbo].[tbl_lkpt_cities] ([id], [city_name], [province_id]) VALUES (62, N'Khairpur', 6)
INSERT [dbo].[tbl_lkpt_cities] ([id], [city_name], [province_id]) VALUES (63, N'Dadu', 6)
INSERT [dbo].[tbl_lkpt_cities] ([id], [city_name], [province_id]) VALUES (64, N'Karachi', 3)
INSERT [dbo].[tbl_lkpt_cities] ([id], [city_name], [province_id]) VALUES (65, N'Hyderabad', 3)
INSERT [dbo].[tbl_lkpt_cities] ([id], [city_name], [province_id]) VALUES (66, N'Sukkur', 3)
INSERT [dbo].[tbl_lkpt_cities] ([id], [city_name], [province_id]) VALUES (67, N'Larkana', 3)
INSERT [dbo].[tbl_lkpt_cities] ([id], [city_name], [province_id]) VALUES (68, N'Bannu', 1)
INSERT [dbo].[tbl_lkpt_cities] ([id], [city_name], [province_id]) VALUES (69, N'Lahore', 2)
INSERT [dbo].[tbl_lkpt_cities] ([id], [city_name], [province_id]) VALUES (70, N'Karak', 1)
INSERT [dbo].[tbl_lkpt_cities] ([id], [city_name], [province_id]) VALUES (71, N'Kharian', 2)
INSERT [dbo].[tbl_lkpt_cities] ([id], [city_name], [province_id]) VALUES (73, N'Sarai Alamgir', 2)
INSERT [dbo].[tbl_lkpt_cities] ([id], [city_name], [province_id]) VALUES (74, N'Lalamusa', 2)
INSERT [dbo].[tbl_lkpt_cities] ([id], [city_name], [province_id]) VALUES (75, N'Chakwal', 2)
INSERT [dbo].[tbl_lkpt_cities] ([id], [city_name], [province_id]) VALUES (76, N'Gujjar Khan', 2)
INSERT [dbo].[tbl_lkpt_cities] ([id], [city_name], [province_id]) VALUES (77, N'Attock', 2)
INSERT [dbo].[tbl_lkpt_cities] ([id], [city_name], [province_id]) VALUES (78, N'Sohawa', 2)
INSERT [dbo].[tbl_lkpt_cities] ([id], [city_name], [province_id]) VALUES (79, N'Dina', 2)
SET IDENTITY_INSERT [dbo].[tbl_lkpt_cities] OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_lkpt_provinces] ON 

INSERT [dbo].[tbl_lkpt_provinces] ([id], [province_name]) VALUES (1, N'Khyber Pakhtunkhwa')
INSERT [dbo].[tbl_lkpt_provinces] ([id], [province_name]) VALUES (2, N'Punjab')
INSERT [dbo].[tbl_lkpt_provinces] ([id], [province_name]) VALUES (3, N'Sindh')
INSERT [dbo].[tbl_lkpt_provinces] ([id], [province_name]) VALUES (4, N'Balochistan')
INSERT [dbo].[tbl_lkpt_provinces] ([id], [province_name]) VALUES (5, N'Gilgit Baltistan')
INSERT [dbo].[tbl_lkpt_provinces] ([id], [province_name]) VALUES (6, N'Azad Kashmir')
INSERT [dbo].[tbl_lkpt_provinces] ([id], [province_name]) VALUES (7, N'Capital Territory')
SET IDENTITY_INSERT [dbo].[tbl_lkpt_provinces] OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_lkpt_reg_centers] ON 

INSERT [dbo].[tbl_lkpt_reg_centers] ([reg_center_id], [center_name], [plaza_id]) VALUES (1, N'Islamabad', 1)
SET IDENTITY_INSERT [dbo].[tbl_lkpt_reg_centers] OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_lkpt_roles] ON 

INSERT [dbo].[tbl_lkpt_roles] ([role_id], [role_name], [role_type], [status]) VALUES (1, N'Super Admin', N'admin', 0)
INSERT [dbo].[tbl_lkpt_roles] ([role_id], [role_name], [role_type], [status]) VALUES (2, N'Company Admin', N'cadmin', 0)
INSERT [dbo].[tbl_lkpt_roles] ([role_id], [role_name], [role_type], [status]) VALUES (3, N'Company User', N'cuser', 0)
INSERT [dbo].[tbl_lkpt_roles] ([role_id], [role_name], [role_type], [status]) VALUES (4, N'HQ User', N'user', 0)
INSERT [dbo].[tbl_lkpt_roles] ([role_id], [role_name], [role_type], [status]) VALUES (5, N'Reg Center User', N'reguser', 0)
SET IDENTITY_INSERT [dbo].[tbl_lkpt_roles] OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_lkpt_tollplaza] ON 

INSERT [dbo].[tbl_lkpt_tollplaza] ([plaza_id], [city_name], [no_of_boths]) VALUES (1, N'Islamabad', NULL)
SET IDENTITY_INSERT [dbo].[tbl_lkpt_tollplaza] OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_lkpt_vehicle_class] ON 

INSERT [dbo].[tbl_lkpt_vehicle_class] ([class_id], [vehicle_class]) VALUES (1, N'F1')
INSERT [dbo].[tbl_lkpt_vehicle_class] ([class_id], [vehicle_class]) VALUES (2, N'F2')
INSERT [dbo].[tbl_lkpt_vehicle_class] ([class_id], [vehicle_class]) VALUES (3, N'F3')
INSERT [dbo].[tbl_lkpt_vehicle_class] ([class_id], [vehicle_class]) VALUES (4, N'F4')
INSERT [dbo].[tbl_lkpt_vehicle_class] ([class_id], [vehicle_class]) VALUES (5, N'F5')
INSERT [dbo].[tbl_lkpt_vehicle_class] ([class_id], [vehicle_class]) VALUES (6, N'F6')
SET IDENTITY_INSERT [dbo].[tbl_lkpt_vehicle_class] OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_lkpt_vehicle_made] ON 

INSERT [dbo].[tbl_lkpt_vehicle_made] ([vehicle_made_id], [made_name]) VALUES (1, N'Toyota')
SET IDENTITY_INSERT [dbo].[tbl_lkpt_vehicle_made] OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_lkpt_vehicle_type] ON 

INSERT [dbo].[tbl_lkpt_vehicle_type] ([vehicle_type_id], [type_name]) VALUES (1, N'Seedan')
SET IDENTITY_INSERT [dbo].[tbl_lkpt_vehicle_type] OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_reg_companies] ON 

INSERT [dbo].[tbl_reg_companies] ([company_id], [company_name], [official_number], [registrant_number], [registrant_designation], [registrant_mobile], [status]) VALUES (1, N'CxJourney', N'051478956', N'0317456897', N'ON', N'3214569888', 2)
INSERT [dbo].[tbl_reg_companies] ([company_id], [company_name], [official_number], [registrant_number], [registrant_designation], [registrant_mobile], [status]) VALUES (2, N'Faisal Movers', N'0516254124', N'0321521545', N'District Manager', N'03239334752', 2)
INSERT [dbo].[tbl_reg_companies] ([company_id], [company_name], [official_number], [registrant_number], [registrant_designation], [registrant_mobile], [status]) VALUES (52, N'LastJurney', N'232212', N'21123232', N'ON', N'2232132', 0)
INSERT [dbo].[tbl_reg_companies] ([company_id], [company_name], [official_number], [registrant_number], [registrant_designation], [registrant_mobile], [status]) VALUES (53, N'CxJourney', N'2532323', N'317456897', N' Official', N'32145698', 0)
INSERT [dbo].[tbl_reg_companies] ([company_id], [company_name], [official_number], [registrant_number], [registrant_designation], [registrant_mobile], [status]) VALUES (54, N'TheMask', N'456544', N'4655464', N'ON', N'465456', 0)
INSERT [dbo].[tbl_reg_companies] ([company_id], [company_name], [official_number], [registrant_number], [registrant_designation], [registrant_mobile], [status]) VALUES (55, N'Traveler-98', N'34545453', N'317456897', N' Official', N'32145698', 0)
SET IDENTITY_INSERT [dbo].[tbl_reg_companies] OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_reg_fleets] ON 

INSERT [dbo].[tbl_reg_fleets] ([fleet_id], [fleet_name], [company_id], [number_of_vehicles], [fleet_type], [status], [created_by], [created_at], [updated_by], [updated_at], [is_deleted]) VALUES (9, N'WoLf Warriors', 53, 58, N'Generic', 0, 0, CAST(N'2022-06-03T09:49:22.000' AS DateTime), NULL, NULL, 0)
INSERT [dbo].[tbl_reg_fleets] ([fleet_id], [fleet_name], [company_id], [number_of_vehicles], [fleet_type], [status], [created_by], [created_at], [updated_by], [updated_at], [is_deleted]) VALUES (11, N'Panda Lamesoul', 53, 58, N'Generic', 0, 0, CAST(N'2022-06-03T09:51:34.000' AS DateTime), 1, CAST(N'2022-07-18T17:58:34.000' AS DateTime), 0)
INSERT [dbo].[tbl_reg_fleets] ([fleet_id], [fleet_name], [company_id], [number_of_vehicles], [fleet_type], [status], [created_by], [created_at], [updated_by], [updated_at], [is_deleted]) VALUES (41, N'Mehran', 53, 45, N'local', 0, NULL, CAST(N'2022-07-19T09:14:23.000' AS DateTime), NULL, NULL, 1)
INSERT [dbo].[tbl_reg_fleets] ([fleet_id], [fleet_name], [company_id], [number_of_vehicles], [fleet_type], [status], [created_by], [created_at], [updated_by], [updated_at], [is_deleted]) VALUES (42, N'ammar', 53, 456, N'1', 1, NULL, CAST(N'2022-07-19T09:37:39.000' AS DateTime), NULL, NULL, 1)
SET IDENTITY_INSERT [dbo].[tbl_reg_fleets] OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_reg_vehicle] ON 

INSERT [dbo].[tbl_reg_vehicle] ([vehicle_id], [vehicle_registration_no], [vehicle_made_id], [vehicle_modal], [vehicle_color], [vehicle_type_id], [owner_mobile_no], [owner_mobile_sec], [vehicle_owner_name], [vehicle_owner_cnic], [vehicle_owner_address], [remarks], [reg_center_id], [is_company], [company_id], [m_tag_token], [vehicle_chasis_no], [vehicle_engine_no], [vehicle_class_id], [province_id], [city_id], [issue_date], [expiry_date], [tag_type_id], [drivers_license], [created_by], [created_at], [updated_by], [updated_at], [is_deleted], [status]) VALUES (1, N'PKR-3565', 1, 0, N'', 1, 0, 0, N' ', N'', N'', N'something', 1, 0, 53, N'', N'', N'', 1, 1, 1, CAST(N'2022-06-24' AS Date), CAST(N'2023-04-12' AS Date), 0, N'', 1, CAST(N'2022-06-24T18:10:04.000' AS DateTime), NULL, NULL, NULL, 0)
INSERT [dbo].[tbl_reg_vehicle] ([vehicle_id], [vehicle_registration_no], [vehicle_made_id], [vehicle_modal], [vehicle_color], [vehicle_type_id], [owner_mobile_no], [owner_mobile_sec], [vehicle_owner_name], [vehicle_owner_cnic], [vehicle_owner_address], [remarks], [reg_center_id], [is_company], [company_id], [m_tag_token], [vehicle_chasis_no], [vehicle_engine_no], [vehicle_class_id], [province_id], [city_id], [issue_date], [expiry_date], [tag_type_id], [drivers_license], [created_by], [created_at], [updated_by], [updated_at], [is_deleted], [status]) VALUES (2, N'LHQ-6584', 1, 0, N'', 1, 0, 0, N' ', N'', N'', N'something', 1, 0, 53, N'', N'', N'', 1, 1, 1, CAST(N'2022-06-24' AS Date), CAST(N'2023-04-12' AS Date), 0, N'', 1, CAST(N'2022-06-24T18:31:02.000' AS DateTime), NULL, NULL, NULL, 0)
INSERT [dbo].[tbl_reg_vehicle] ([vehicle_id], [vehicle_registration_no], [vehicle_made_id], [vehicle_modal], [vehicle_color], [vehicle_type_id], [owner_mobile_no], [owner_mobile_sec], [vehicle_owner_name], [vehicle_owner_cnic], [vehicle_owner_address], [remarks], [reg_center_id], [is_company], [company_id], [m_tag_token], [vehicle_chasis_no], [vehicle_engine_no], [vehicle_class_id], [province_id], [city_id], [issue_date], [expiry_date], [tag_type_id], [drivers_license], [created_by], [created_at], [updated_by], [updated_at], [is_deleted], [status]) VALUES (3, N'AAD-4646', 1, 2007, N'Red', 1, 3239334772, 0, N'Asim Saddique', N'173014678323', N'something', N'something', 1, 0, 53, N'flei-6547-rewf', N'65478932145', N'31321321', 1, 1, 1, CAST(N'2022-06-27' AS Date), CAST(N'2023-04-12' AS Date), 0, N'321654321', 1, CAST(N'2022-06-27T13:32:30.000' AS DateTime), NULL, NULL, NULL, 0)
INSERT [dbo].[tbl_reg_vehicle] ([vehicle_id], [vehicle_registration_no], [vehicle_made_id], [vehicle_modal], [vehicle_color], [vehicle_type_id], [owner_mobile_no], [owner_mobile_sec], [vehicle_owner_name], [vehicle_owner_cnic], [vehicle_owner_address], [remarks], [reg_center_id], [is_company], [company_id], [m_tag_token], [vehicle_chasis_no], [vehicle_engine_no], [vehicle_class_id], [province_id], [city_id], [issue_date], [expiry_date], [tag_type_id], [drivers_license], [created_by], [created_at], [updated_by], [updated_at], [is_deleted], [status]) VALUES (4, N'ICT-1233', 1, 2054, N'Red', 1, 3239334772, 3329601011, N'Muhammad Kashi', N'1730146782323', N'House # 1104, Usmania Street, Muhallah Islamabad,', N'something', 1, 0, 53, N'asdfasdf', N'asdfasdf654asdf654', N'321654654', 1, 1, 1, CAST(N'2022-07-04' AS Date), CAST(N'2023-04-12' AS Date), 0, N'321654654645', 1, CAST(N'2022-07-04T11:07:27.000' AS DateTime), NULL, NULL, NULL, 0)
INSERT [dbo].[tbl_reg_vehicle] ([vehicle_id], [vehicle_registration_no], [vehicle_made_id], [vehicle_modal], [vehicle_color], [vehicle_type_id], [owner_mobile_no], [owner_mobile_sec], [vehicle_owner_name], [vehicle_owner_cnic], [vehicle_owner_address], [remarks], [reg_center_id], [is_company], [company_id], [m_tag_token], [vehicle_chasis_no], [vehicle_engine_no], [vehicle_class_id], [province_id], [city_id], [issue_date], [expiry_date], [tag_type_id], [drivers_license], [created_by], [created_at], [updated_by], [updated_at], [is_deleted], [status]) VALUES (9, N'DFS-7777', 1, 4534, N'sdasa', 1, 566, 566565, N'sdsad', N'454545', N'ssdf', N'something', 1, 0, 53, N'65656565', N'656565', N'6565', 1, 1, 1, CAST(N'2022-07-18' AS Date), CAST(N'2023-04-12' AS Date), 0, N'6565', 1, CAST(N'2022-07-18T15:46:19.000' AS DateTime), NULL, NULL, NULL, 0)
INSERT [dbo].[tbl_reg_vehicle] ([vehicle_id], [vehicle_registration_no], [vehicle_made_id], [vehicle_modal], [vehicle_color], [vehicle_type_id], [owner_mobile_no], [owner_mobile_sec], [vehicle_owner_name], [vehicle_owner_cnic], [vehicle_owner_address], [remarks], [reg_center_id], [is_company], [company_id], [m_tag_token], [vehicle_chasis_no], [vehicle_engine_no], [vehicle_class_id], [province_id], [city_id], [issue_date], [expiry_date], [tag_type_id], [drivers_license], [created_by], [created_at], [updated_by], [updated_at], [is_deleted], [status]) VALUES (10, N'DF-5478', 1, 4534, N'sdasa', 1, 566, 566565, N'sdsad', N'454545', N'ssdf', N'something', 1, 0, 53, N'65656565', N'656565', N'6565', 1, 1, 1, CAST(N'2022-07-18' AS Date), CAST(N'2023-04-12' AS Date), 0, N'6565', 1, CAST(N'2022-07-18T15:46:26.000' AS DateTime), NULL, NULL, NULL, 0)
INSERT [dbo].[tbl_reg_vehicle] ([vehicle_id], [vehicle_registration_no], [vehicle_made_id], [vehicle_modal], [vehicle_color], [vehicle_type_id], [owner_mobile_no], [owner_mobile_sec], [vehicle_owner_name], [vehicle_owner_cnic], [vehicle_owner_address], [remarks], [reg_center_id], [is_company], [company_id], [m_tag_token], [vehicle_chasis_no], [vehicle_engine_no], [vehicle_class_id], [province_id], [city_id], [issue_date], [expiry_date], [tag_type_id], [drivers_license], [created_by], [created_at], [updated_by], [updated_at], [is_deleted], [status]) VALUES (11, N'BA-248', 1, 2011, N'red', 1, 3543, 34535, N'sfsdf', N'45253', N'fgfgh', N'something', 1, 0, 53, N'34535', N'354354', N'354435', 1, 1, 1, CAST(N'2022-07-18' AS Date), CAST(N'2023-04-12' AS Date), 0, N'354453', 1, CAST(N'2022-07-18T15:47:22.000' AS DateTime), NULL, NULL, NULL, 0)
INSERT [dbo].[tbl_reg_vehicle] ([vehicle_id], [vehicle_registration_no], [vehicle_made_id], [vehicle_modal], [vehicle_color], [vehicle_type_id], [owner_mobile_no], [owner_mobile_sec], [vehicle_owner_name], [vehicle_owner_cnic], [vehicle_owner_address], [remarks], [reg_center_id], [is_company], [company_id], [m_tag_token], [vehicle_chasis_no], [vehicle_engine_no], [vehicle_class_id], [province_id], [city_id], [issue_date], [expiry_date], [tag_type_id], [drivers_license], [created_by], [created_at], [updated_by], [updated_at], [is_deleted], [status]) VALUES (38, N'BH-478', 1, 2008, N'red', 1, 4445, 544545, N'asim', N'545645', N'something', N'something', 1, 0, 0, N'sdsdf45', N'sdfs5d', N'645564sda', 1, 1, 1, CAST(N'2022-07-19' AS Date), CAST(N'2023-04-12' AS Date), 0, N'45456456', 1, CAST(N'2022-07-19T10:33:06.000' AS DateTime), NULL, NULL, NULL, 0)
INSERT [dbo].[tbl_reg_vehicle] ([vehicle_id], [vehicle_registration_no], [vehicle_made_id], [vehicle_modal], [vehicle_color], [vehicle_type_id], [owner_mobile_no], [owner_mobile_sec], [vehicle_owner_name], [vehicle_owner_cnic], [vehicle_owner_address], [remarks], [reg_center_id], [is_company], [company_id], [m_tag_token], [vehicle_chasis_no], [vehicle_engine_no], [vehicle_class_id], [province_id], [city_id], [issue_date], [expiry_date], [tag_type_id], [drivers_license], [created_by], [created_at], [updated_by], [updated_at], [is_deleted], [status]) VALUES (41, N'2123', 1, 2019, N'red', 1, 2321, 2321, N'sad', N'22', N'sadsa', N'something', 1, 0, 0, N'2321123', N'1322', N'322321', 3, 1, 1, CAST(N'2022-07-19' AS Date), CAST(N'2023-04-12' AS Date), 0, N'232231', 1, CAST(N'2022-07-19T10:37:05.000' AS DateTime), NULL, NULL, NULL, 0)
INSERT [dbo].[tbl_reg_vehicle] ([vehicle_id], [vehicle_registration_no], [vehicle_made_id], [vehicle_modal], [vehicle_color], [vehicle_type_id], [owner_mobile_no], [owner_mobile_sec], [vehicle_owner_name], [vehicle_owner_cnic], [vehicle_owner_address], [remarks], [reg_center_id], [is_company], [company_id], [m_tag_token], [vehicle_chasis_no], [vehicle_engine_no], [vehicle_class_id], [province_id], [city_id], [issue_date], [expiry_date], [tag_type_id], [drivers_license], [created_by], [created_at], [updated_by], [updated_at], [is_deleted], [status]) VALUES (42, N'45456', 1, 2001, N'ds', 1, 456654, 546654, N'sad', N'554', N'sd', N'something', 1, 0, 0, N'465456', N'456465', N'654465', 2, 1, 1, CAST(N'2022-07-19' AS Date), CAST(N'2023-04-12' AS Date), 0, N'465465', 1, CAST(N'2022-07-19T11:20:26.000' AS DateTime), NULL, NULL, NULL, 0)
INSERT [dbo].[tbl_reg_vehicle] ([vehicle_id], [vehicle_registration_no], [vehicle_made_id], [vehicle_modal], [vehicle_color], [vehicle_type_id], [owner_mobile_no], [owner_mobile_sec], [vehicle_owner_name], [vehicle_owner_cnic], [vehicle_owner_address], [remarks], [reg_center_id], [is_company], [company_id], [m_tag_token], [vehicle_chasis_no], [vehicle_engine_no], [vehicle_class_id], [province_id], [city_id], [issue_date], [expiry_date], [tag_type_id], [drivers_license], [created_by], [created_at], [updated_by], [updated_at], [is_deleted], [status]) VALUES (43, N'4565', 1, 2019, N'red', 1, 564456, 465456, N'sdas', N'45456', N'sdsad', N'something', 1, 0, 0, N'sa54546', N'45645', N'45456', 1, 1, 1, CAST(N'2022-07-19' AS Date), CAST(N'2023-04-12' AS Date), 0, N'456456', 1, CAST(N'2022-07-19T11:57:34.000' AS DateTime), NULL, NULL, NULL, 0)
INSERT [dbo].[tbl_reg_vehicle] ([vehicle_id], [vehicle_registration_no], [vehicle_made_id], [vehicle_modal], [vehicle_color], [vehicle_type_id], [owner_mobile_no], [owner_mobile_sec], [vehicle_owner_name], [vehicle_owner_cnic], [vehicle_owner_address], [remarks], [reg_center_id], [is_company], [company_id], [m_tag_token], [vehicle_chasis_no], [vehicle_engine_no], [vehicle_class_id], [province_id], [city_id], [issue_date], [expiry_date], [tag_type_id], [drivers_license], [created_by], [created_at], [updated_by], [updated_at], [is_deleted], [status]) VALUES (44, N'LE3315', 1, 2011, N'red', 1, 454545, 454545, N'sada', N'21545', N'sdsd', N'something', 1, 0, 0, N'454545', N'4545', N'454545', 1, 1, 1, CAST(N'2022-07-20' AS Date), CAST(N'2023-04-12' AS Date), 0, N'454545', 1, CAST(N'2022-07-20T10:24:46.000' AS DateTime), NULL, NULL, NULL, 0)
INSERT [dbo].[tbl_reg_vehicle] ([vehicle_id], [vehicle_registration_no], [vehicle_made_id], [vehicle_modal], [vehicle_color], [vehicle_type_id], [owner_mobile_no], [owner_mobile_sec], [vehicle_owner_name], [vehicle_owner_cnic], [vehicle_owner_address], [remarks], [reg_center_id], [is_company], [company_id], [m_tag_token], [vehicle_chasis_no], [vehicle_engine_no], [vehicle_class_id], [province_id], [city_id], [issue_date], [expiry_date], [tag_type_id], [drivers_license], [created_by], [created_at], [updated_by], [updated_at], [is_deleted], [status]) VALUES (45, N'LE3315', 1, 2011, N'red', 1, 454545, 454545, N'sada', N'21545', N'sdsd', N'something', 1, 0, 0, N'454545', N'4545', N'454545', 1, 1, 1, CAST(N'2022-07-20' AS Date), CAST(N'2023-04-12' AS Date), 0, N'454545', 1, CAST(N'2022-07-20T10:24:53.000' AS DateTime), NULL, NULL, NULL, 0)
INSERT [dbo].[tbl_reg_vehicle] ([vehicle_id], [vehicle_registration_no], [vehicle_made_id], [vehicle_modal], [vehicle_color], [vehicle_type_id], [owner_mobile_no], [owner_mobile_sec], [vehicle_owner_name], [vehicle_owner_cnic], [vehicle_owner_address], [remarks], [reg_center_id], [is_company], [company_id], [m_tag_token], [vehicle_chasis_no], [vehicle_engine_no], [vehicle_class_id], [province_id], [city_id], [issue_date], [expiry_date], [tag_type_id], [drivers_license], [created_by], [created_at], [updated_by], [updated_at], [is_deleted], [status]) VALUES (46, N'LET15', 1, 2011, N'reed', 1, 454554, 454545, N'asiim', N'54456', N'dfsd', N'something', 1, 0, 0, N'54454', N'455445', N'4545', 1, 1, 1, CAST(N'2022-07-20' AS Date), CAST(N'2023-04-12' AS Date), 0, N'454545', 1, CAST(N'2022-07-20T10:34:03.000' AS DateTime), NULL, NULL, NULL, 0)
INSERT [dbo].[tbl_reg_vehicle] ([vehicle_id], [vehicle_registration_no], [vehicle_made_id], [vehicle_modal], [vehicle_color], [vehicle_type_id], [owner_mobile_no], [owner_mobile_sec], [vehicle_owner_name], [vehicle_owner_cnic], [vehicle_owner_address], [remarks], [reg_center_id], [is_company], [company_id], [m_tag_token], [vehicle_chasis_no], [vehicle_engine_no], [vehicle_class_id], [province_id], [city_id], [issue_date], [expiry_date], [tag_type_id], [drivers_license], [created_by], [created_at], [updated_by], [updated_at], [is_deleted], [status]) VALUES (47, N'LEA9953', 1, 556, N'dsf', 1, 546, 56465, N'sads', N'5455', N'dfsd', N'something', 1, 0, 0, N'54665', N'56456', N'546', 2, 1, 1, CAST(N'2022-07-20' AS Date), CAST(N'2023-04-12' AS Date), 0, N'4556', 1, CAST(N'2022-07-20T10:44:16.000' AS DateTime), NULL, NULL, NULL, 0)
INSERT [dbo].[tbl_reg_vehicle] ([vehicle_id], [vehicle_registration_no], [vehicle_made_id], [vehicle_modal], [vehicle_color], [vehicle_type_id], [owner_mobile_no], [owner_mobile_sec], [vehicle_owner_name], [vehicle_owner_cnic], [vehicle_owner_address], [remarks], [reg_center_id], [is_company], [company_id], [m_tag_token], [vehicle_chasis_no], [vehicle_engine_no], [vehicle_class_id], [province_id], [city_id], [issue_date], [expiry_date], [tag_type_id], [drivers_license], [created_by], [created_at], [updated_by], [updated_at], [is_deleted], [status]) VALUES (48, N'LEA9953', 1, 556, N'dsf', 1, 546, 56465, N'sads', N'5455', N'dfsd', N'something', 1, 0, 0, N'54665', N'56456', N'546', 2, 1, 1, CAST(N'2022-07-20' AS Date), CAST(N'2023-04-12' AS Date), 0, N'4556', 1, CAST(N'2022-07-20T10:44:23.000' AS DateTime), NULL, NULL, NULL, 0)
SET IDENTITY_INSERT [dbo].[tbl_reg_vehicle] OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_rel_fleet] ON 

INSERT [dbo].[tbl_rel_fleet] ([rel_id], [fleet_id], [vehicle_id], [created_by], [created_at], [updated_by], [updated_at], [status], [is_deleted]) VALUES (64, 9, 1, 23, CAST(N'2022-07-18T18:00:49.000' AS DateTime), NULL, NULL, 0, 0)
INSERT [dbo].[tbl_rel_fleet] ([rel_id], [fleet_id], [vehicle_id], [created_by], [created_at], [updated_by], [updated_at], [status], [is_deleted]) VALUES (65, 9, 2, 23, CAST(N'2022-07-18T18:00:49.000' AS DateTime), NULL, NULL, 0, 0)
INSERT [dbo].[tbl_rel_fleet] ([rel_id], [fleet_id], [vehicle_id], [created_by], [created_at], [updated_by], [updated_at], [status], [is_deleted]) VALUES (66, 9, 3, 23, CAST(N'2022-07-18T18:00:49.000' AS DateTime), NULL, NULL, 0, 0)
INSERT [dbo].[tbl_rel_fleet] ([rel_id], [fleet_id], [vehicle_id], [created_by], [created_at], [updated_by], [updated_at], [status], [is_deleted]) VALUES (67, 11, 4, 23, CAST(N'2022-07-19T09:44:01.000' AS DateTime), NULL, NULL, 0, 0)
INSERT [dbo].[tbl_rel_fleet] ([rel_id], [fleet_id], [vehicle_id], [created_by], [created_at], [updated_by], [updated_at], [status], [is_deleted]) VALUES (68, 9, 10, 23, CAST(N'2022-07-21T14:38:53.000' AS DateTime), NULL, NULL, 0, 0)
INSERT [dbo].[tbl_rel_fleet] ([rel_id], [fleet_id], [vehicle_id], [created_by], [created_at], [updated_by], [updated_at], [status], [is_deleted]) VALUES (69, 9, 11, 23, CAST(N'2022-07-21T14:38:53.000' AS DateTime), NULL, NULL, 0, 0)
SET IDENTITY_INSERT [dbo].[tbl_rel_fleet] OFF
GO
