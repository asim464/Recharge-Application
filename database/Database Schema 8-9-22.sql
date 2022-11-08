USE [recharge_db]
GO
/****** Object:  Table [dbo].[tbl_admin_menu]    Script Date: 08/09/2022 3:13:02 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_admin_menu](
	[menu_id] [int] IDENTITY(1,1) NOT NULL,
	[menu_name] [varchar](100) NULL,
	[menu_icon] [varchar](100) NULL,
	[menu_url] [varchar](200) NULL,
	[is_parent] [bit] NULL,
	[parent_menu_id] [int] NULL,
	[created_by] [int] NULL,
	[created_at] [datetime] NULL,
	[updated_by] [int] NULL,
	[updated_at] [datetime] NULL,
 CONSTRAINT [PK_tbl_admin_menu] PRIMARY KEY CLUSTERED 
(
	[menu_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_admin_menu_rel]    Script Date: 08/09/2022 3:13:02 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_admin_menu_rel](
	[menu_rel_id] [int] IDENTITY(1,1) NOT NULL,
	[menu_id] [int] NULL,
	[role_id] [int] NULL,
	[rel_string] [varchar](50) NULL,
 CONSTRAINT [PK_tbl_admin_menu_rel] PRIMARY KEY CLUSTERED 
(
	[menu_rel_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_admin_user]    Script Date: 08/09/2022 3:13:02 pm ******/
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
/****** Object:  Table [dbo].[tbl_lkpt_boths]    Script Date: 08/09/2022 3:13:02 pm ******/
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
/****** Object:  Table [dbo].[tbl_lkpt_cities]    Script Date: 08/09/2022 3:13:02 pm ******/
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
/****** Object:  Table [dbo].[tbl_lkpt_provinces]    Script Date: 08/09/2022 3:13:02 pm ******/
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
/****** Object:  Table [dbo].[tbl_lkpt_reg_centers]    Script Date: 08/09/2022 3:13:02 pm ******/
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
/****** Object:  Table [dbo].[tbl_lkpt_roles]    Script Date: 08/09/2022 3:13:02 pm ******/
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
/****** Object:  Table [dbo].[tbl_lkpt_toll_tax]    Script Date: 08/09/2022 3:13:02 pm ******/
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
/****** Object:  Table [dbo].[tbl_lkpt_tollplaza]    Script Date: 08/09/2022 3:13:02 pm ******/
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
/****** Object:  Table [dbo].[tbl_lkpt_vehicle_class]    Script Date: 08/09/2022 3:13:02 pm ******/
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
/****** Object:  Table [dbo].[tbl_lkpt_vehicle_made]    Script Date: 08/09/2022 3:13:02 pm ******/
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
/****** Object:  Table [dbo].[tbl_lkpt_vehicle_type]    Script Date: 08/09/2022 3:13:02 pm ******/
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
/****** Object:  Table [dbo].[tbl_reg_companies]    Script Date: 08/09/2022 3:13:02 pm ******/
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
/****** Object:  Table [dbo].[tbl_reg_fleets]    Script Date: 08/09/2022 3:13:02 pm ******/
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
/****** Object:  Table [dbo].[tbl_reg_vehicle]    Script Date: 08/09/2022 3:13:02 pm ******/
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
/****** Object:  Table [dbo].[tbl_rel_fleet]    Script Date: 08/09/2022 3:13:02 pm ******/
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
/****** Object:  Table [dbo].[tbl_vehicle_account]    Script Date: 08/09/2022 3:13:02 pm ******/
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
/****** Object:  Table [dbo].[tbl_vehicle_log]    Script Date: 08/09/2022 3:13:02 pm ******/
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
/****** Object:  Table [dbo].[tbl_vehicle_mtag_rel]    Script Date: 08/09/2022 3:13:02 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_vehicle_mtag_rel](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[vehicle_id] [int] NULL,
	[mtag_token] [varchar](100) NULL,
 CONSTRAINT [PK_tbl_vehicle_mtag_rel] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_vehicle_toll_history]    Script Date: 08/09/2022 3:13:02 pm ******/
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
SET IDENTITY_INSERT [dbo].[tbl_admin_menu] ON 

INSERT [dbo].[tbl_admin_menu] ([menu_id], [menu_name], [menu_icon], [menu_url], [is_parent], [parent_menu_id], [created_by], [created_at], [updated_by], [updated_at]) VALUES (23, N'Dashboard', N'home', N'/dashboard', 0, 0, 3, CAST(N'2022-08-11T16:56:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[tbl_admin_menu] ([menu_id], [menu_name], [menu_icon], [menu_url], [is_parent], [parent_menu_id], [created_by], [created_at], [updated_by], [updated_at]) VALUES (24, N'User Management', N'users', N'/usermanagement', 0, 0, 3, CAST(N'2022-08-04T13:48:42.000' AS DateTime), NULL, NULL)
INSERT [dbo].[tbl_admin_menu] ([menu_id], [menu_name], [menu_icon], [menu_url], [is_parent], [parent_menu_id], [created_by], [created_at], [updated_by], [updated_at]) VALUES (26, N'Role Management', N'award', N'/add_roles', 0, 0, 23, CAST(N'2022-08-10T15:45:01.000' AS DateTime), NULL, NULL)
INSERT [dbo].[tbl_admin_menu] ([menu_id], [menu_name], [menu_icon], [menu_url], [is_parent], [parent_menu_id], [created_by], [created_at], [updated_by], [updated_at]) VALUES (27, N'User Permission', N'user-check', N'/menu_manage', 0, 0, 3, CAST(N'2022-08-19T10:39:32.000' AS DateTime), NULL, NULL)
INSERT [dbo].[tbl_admin_menu] ([menu_id], [menu_name], [menu_icon], [menu_url], [is_parent], [parent_menu_id], [created_by], [created_at], [updated_by], [updated_at]) VALUES (28, N'Menu Management', N'align-justify', N'/management', 0, 0, 3, CAST(N'2022-08-04T13:55:03.000' AS DateTime), NULL, NULL)
INSERT [dbo].[tbl_admin_menu] ([menu_id], [menu_name], [menu_icon], [menu_url], [is_parent], [parent_menu_id], [created_by], [created_at], [updated_by], [updated_at]) VALUES (29, N'Vehicle Registration', N'truck', N'/register', 0, 0, 23, CAST(N'2022-08-10T13:20:51.000' AS DateTime), NULL, NULL)
INSERT [dbo].[tbl_admin_menu] ([menu_id], [menu_name], [menu_icon], [menu_url], [is_parent], [parent_menu_id], [created_by], [created_at], [updated_by], [updated_at]) VALUES (30, N'Company Management', N'book-open', N'/company', 0, 0, 3, CAST(N'2022-08-04T13:56:30.000' AS DateTime), NULL, NULL)
INSERT [dbo].[tbl_admin_menu] ([menu_id], [menu_name], [menu_icon], [menu_url], [is_parent], [parent_menu_id], [created_by], [created_at], [updated_by], [updated_at]) VALUES (32, N'Add Fleets', N'folder-plus', N'/fleets', 0, 0, 23, CAST(N'2022-08-10T15:45:58.000' AS DateTime), NULL, NULL)
INSERT [dbo].[tbl_admin_menu] ([menu_id], [menu_name], [menu_icon], [menu_url], [is_parent], [parent_menu_id], [created_by], [created_at], [updated_by], [updated_at]) VALUES (33, N'Assign Vehicles', N'check-circle', N'/vehicle', 0, 0, 23, CAST(N'2022-08-10T15:46:27.000' AS DateTime), NULL, NULL)
INSERT [dbo].[tbl_admin_menu] ([menu_id], [menu_name], [menu_icon], [menu_url], [is_parent], [parent_menu_id], [created_by], [created_at], [updated_by], [updated_at]) VALUES (34, N'M-Tag Recharge', N'gift', N'recharge', 0, 0, 23, CAST(N'2022-08-10T13:06:59.000' AS DateTime), NULL, NULL)
INSERT [dbo].[tbl_admin_menu] ([menu_id], [menu_name], [menu_icon], [menu_url], [is_parent], [parent_menu_id], [created_by], [created_at], [updated_by], [updated_at]) VALUES (43, N'Complaint Portal', N'file-text', N'complaint', 0, 0, 3, CAST(N'2022-08-12T11:03:48.000' AS DateTime), NULL, NULL)
INSERT [dbo].[tbl_admin_menu] ([menu_id], [menu_name], [menu_icon], [menu_url], [is_parent], [parent_menu_id], [created_by], [created_at], [updated_by], [updated_at]) VALUES (46, N'M-Tag Register ', N'save', N'Mtag', 0, 0, 3, CAST(N'2022-09-05T16:05:59.000' AS DateTime), NULL, NULL)
SET IDENTITY_INSERT [dbo].[tbl_admin_menu] OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_admin_menu_rel] ON 

INSERT [dbo].[tbl_admin_menu_rel] ([menu_rel_id], [menu_id], [role_id], [rel_string]) VALUES (1, 23, 1, N'23:1')
INSERT [dbo].[tbl_admin_menu_rel] ([menu_rel_id], [menu_id], [role_id], [rel_string]) VALUES (2, 24, 1, N'24:1')
INSERT [dbo].[tbl_admin_menu_rel] ([menu_rel_id], [menu_id], [role_id], [rel_string]) VALUES (3, 26, 1, N'26:1')
INSERT [dbo].[tbl_admin_menu_rel] ([menu_rel_id], [menu_id], [role_id], [rel_string]) VALUES (4, 27, 1, N'27:1')
INSERT [dbo].[tbl_admin_menu_rel] ([menu_rel_id], [menu_id], [role_id], [rel_string]) VALUES (5, 28, 1, N'28:1')
INSERT [dbo].[tbl_admin_menu_rel] ([menu_rel_id], [menu_id], [role_id], [rel_string]) VALUES (6, 29, 1, N'29:1')
INSERT [dbo].[tbl_admin_menu_rel] ([menu_rel_id], [menu_id], [role_id], [rel_string]) VALUES (7, 30, 1, N'30:1')
INSERT [dbo].[tbl_admin_menu_rel] ([menu_rel_id], [menu_id], [role_id], [rel_string]) VALUES (8, 32, 1, N'32:1')
INSERT [dbo].[tbl_admin_menu_rel] ([menu_rel_id], [menu_id], [role_id], [rel_string]) VALUES (9, 33, 1, N'33:1')
INSERT [dbo].[tbl_admin_menu_rel] ([menu_rel_id], [menu_id], [role_id], [rel_string]) VALUES (10, 34, 1, N'34:1')
INSERT [dbo].[tbl_admin_menu_rel] ([menu_rel_id], [menu_id], [role_id], [rel_string]) VALUES (11, 23, 2, N'23:2')
INSERT [dbo].[tbl_admin_menu_rel] ([menu_rel_id], [menu_id], [role_id], [rel_string]) VALUES (12, 32, 2, N'32:2')
INSERT [dbo].[tbl_admin_menu_rel] ([menu_rel_id], [menu_id], [role_id], [rel_string]) VALUES (13, 34, 21, N'34:21')
INSERT [dbo].[tbl_admin_menu_rel] ([menu_rel_id], [menu_id], [role_id], [rel_string]) VALUES (14, 42, 1, N'42:1')
INSERT [dbo].[tbl_admin_menu_rel] ([menu_rel_id], [menu_id], [role_id], [rel_string]) VALUES (15, 30, 2, N'30:2')
INSERT [dbo].[tbl_admin_menu_rel] ([menu_rel_id], [menu_id], [role_id], [rel_string]) VALUES (16, 42, 21, N'42:21')
INSERT [dbo].[tbl_admin_menu_rel] ([menu_rel_id], [menu_id], [role_id], [rel_string]) VALUES (17, 33, 21, N'33:21')
INSERT [dbo].[tbl_admin_menu_rel] ([menu_rel_id], [menu_id], [role_id], [rel_string]) VALUES (18, 34, 22, N'34:22')
INSERT [dbo].[tbl_admin_menu_rel] ([menu_rel_id], [menu_id], [role_id], [rel_string]) VALUES (19, 34, 23, N'34:23')
INSERT [dbo].[tbl_admin_menu_rel] ([menu_rel_id], [menu_id], [role_id], [rel_string]) VALUES (20, 34, 24, N'34:24')
INSERT [dbo].[tbl_admin_menu_rel] ([menu_rel_id], [menu_id], [role_id], [rel_string]) VALUES (21, 24, 2, N'24:2')
INSERT [dbo].[tbl_admin_menu_rel] ([menu_rel_id], [menu_id], [role_id], [rel_string]) VALUES (22, 33, 2, N'33:2')
INSERT [dbo].[tbl_admin_menu_rel] ([menu_rel_id], [menu_id], [role_id], [rel_string]) VALUES (23, 43, 1, N'43:1')
INSERT [dbo].[tbl_admin_menu_rel] ([menu_rel_id], [menu_id], [role_id], [rel_string]) VALUES (24, 45, 1, N'45:1')
INSERT [dbo].[tbl_admin_menu_rel] ([menu_rel_id], [menu_id], [role_id], [rel_string]) VALUES (25, 46, 1, N'46:1')
SET IDENTITY_INSERT [dbo].[tbl_admin_menu_rel] OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_admin_user] ON 

INSERT [dbo].[tbl_admin_user] ([user_id], [username], [password], [email], [mobile_number], [role_id], [user_type], [reg_center_id], [company_id], [created_by], [created_at], [updated_by], [updated_at], [is_deleted], [status]) VALUES (3, N'superadmin@admin.com', N'123456', N'mkashi73@gmail.com', N'03239334772', 1, 2, 1, 0, 1, CAST(N'2022-05-16T14:17:00.000' AS DateTime), 1, NULL, 0, 0)
INSERT [dbo].[tbl_admin_user] ([user_id], [username], [password], [email], [mobile_number], [role_id], [user_type], [reg_center_id], [company_id], [created_by], [created_at], [updated_by], [updated_at], [is_deleted], [status]) VALUES (22, N'asim', N'123456', N'asimsaddique0@gmail.com', N'54354535345', 2, NULL, 0, 52, NULL, NULL, 3, NULL, 0, 0)
INSERT [dbo].[tbl_admin_user] ([user_id], [username], [password], [email], [mobile_number], [role_id], [user_type], [reg_center_id], [company_id], [created_by], [created_at], [updated_by], [updated_at], [is_deleted], [status]) VALUES (23, N'mkashi73', N'123456', N'mkashi73@gmail.com', N'3239334772', 2, NULL, 0, 53, 3, NULL, 23, NULL, 0, 0)
INSERT [dbo].[tbl_admin_user] ([user_id], [username], [password], [email], [mobile_number], [role_id], [user_type], [reg_center_id], [company_id], [created_by], [created_at], [updated_by], [updated_at], [is_deleted], [status]) VALUES (25, N'onenetwork', N'123456', N'mkashi73@gmail.com', N'317456897', 2, NULL, 0, 52, 23, NULL, NULL, NULL, 0, 0)
INSERT [dbo].[tbl_admin_user] ([user_id], [username], [password], [email], [mobile_number], [role_id], [user_type], [reg_center_id], [company_id], [created_by], [created_at], [updated_by], [updated_at], [is_deleted], [status]) VALUES (26, N'asa', N'123456', N'a@gmail.com', N'23423', 2, NULL, 0, 0, 23, NULL, NULL, NULL, 1, 0)
INSERT [dbo].[tbl_admin_user] ([user_id], [username], [password], [email], [mobile_number], [role_id], [user_type], [reg_center_id], [company_id], [created_by], [created_at], [updated_by], [updated_at], [is_deleted], [status]) VALUES (27, N'asa54564', N'123456', N'mkashi73@gmail.com', N'45456', 3, NULL, 0, 52, 23, NULL, NULL, NULL, 1, 0)
INSERT [dbo].[tbl_admin_user] ([user_id], [username], [password], [email], [mobile_number], [role_id], [user_type], [reg_center_id], [company_id], [created_by], [created_at], [updated_by], [updated_at], [is_deleted], [status]) VALUES (28, N'ammar', N'123456', N'a@gmail.com', N'12345', 2, NULL, 0, 52, 3, NULL, 39, NULL, 1, 0)
INSERT [dbo].[tbl_admin_user] ([user_id], [username], [password], [email], [mobile_number], [role_id], [user_type], [reg_center_id], [company_id], [created_by], [created_at], [updated_by], [updated_at], [is_deleted], [status]) VALUES (29, N'004026', N'123456', N'a@gmail.com', N'4353453', 2, NULL, 0, 52, 3, NULL, NULL, NULL, 1, 0)
INSERT [dbo].[tbl_admin_user] ([user_id], [username], [password], [email], [mobile_number], [role_id], [user_type], [reg_center_id], [company_id], [created_by], [created_at], [updated_by], [updated_at], [is_deleted], [status]) VALUES (30, N'5654654', N'123456', N'a@gmail.com', N'86766', 2, NULL, 0, 54, 3, NULL, 39, NULL, 1, 0)
INSERT [dbo].[tbl_admin_user] ([user_id], [username], [password], [email], [mobile_number], [role_id], [user_type], [reg_center_id], [company_id], [created_by], [created_at], [updated_by], [updated_at], [is_deleted], [status]) VALUES (31, N'565465445', N'123456', N'a@gmail.com', N'8676', 2, NULL, 0, 54, 3, NULL, NULL, NULL, 1, 0)
INSERT [dbo].[tbl_admin_user] ([user_id], [username], [password], [email], [mobile_number], [role_id], [user_type], [reg_center_id], [company_id], [created_by], [created_at], [updated_by], [updated_at], [is_deleted], [status]) VALUES (32, N'565465445456', N'123456', N'a@gmail.com', N'8676', 2, NULL, 0, 54, 3, NULL, NULL, NULL, 1, 0)
INSERT [dbo].[tbl_admin_user] ([user_id], [username], [password], [email], [mobile_number], [role_id], [user_type], [reg_center_id], [company_id], [created_by], [created_at], [updated_by], [updated_at], [is_deleted], [status]) VALUES (33, N'789', N'123456', N'a@gmail.com', N'8676', 2, NULL, 0, 54, 3, NULL, NULL, NULL, 1, 0)
INSERT [dbo].[tbl_admin_user] ([user_id], [username], [password], [email], [mobile_number], [role_id], [user_type], [reg_center_id], [company_id], [created_by], [created_at], [updated_by], [updated_at], [is_deleted], [status]) VALUES (34, N'78965', N'123456', N'a@gmail.com', N'8676', 2, NULL, 0, 54, 3, NULL, NULL, NULL, 1, 0)
INSERT [dbo].[tbl_admin_user] ([user_id], [username], [password], [email], [mobile_number], [role_id], [user_type], [reg_center_id], [company_id], [created_by], [created_at], [updated_by], [updated_at], [is_deleted], [status]) VALUES (35, N'78989', N'123456', N'a@gmail.com', N'8676', 2, NULL, 0, 54, 3, NULL, NULL, NULL, 1, 0)
INSERT [dbo].[tbl_admin_user] ([user_id], [username], [password], [email], [mobile_number], [role_id], [user_type], [reg_center_id], [company_id], [created_by], [created_at], [updated_by], [updated_at], [is_deleted], [status]) VALUES (36, N'789879', N'123456', N'a@gmail.com', N'8676', 2, NULL, 0, 54, 3, NULL, NULL, NULL, 1, 0)
INSERT [dbo].[tbl_admin_user] ([user_id], [username], [password], [email], [mobile_number], [role_id], [user_type], [reg_center_id], [company_id], [created_by], [created_at], [updated_by], [updated_at], [is_deleted], [status]) VALUES (37, N'789789', N'123456', N'a@gmail.com', N'8676', 2, NULL, 0, 54, 3, NULL, NULL, NULL, 1, 0)
INSERT [dbo].[tbl_admin_user] ([user_id], [username], [password], [email], [mobile_number], [role_id], [user_type], [reg_center_id], [company_id], [created_by], [created_at], [updated_by], [updated_at], [is_deleted], [status]) VALUES (38, N'7897897', N'123456', N'a@gmail.com', N'8676', 4, NULL, 0, 54, 3, NULL, 3, NULL, 1, 0)
INSERT [dbo].[tbl_admin_user] ([user_id], [username], [password], [email], [mobile_number], [role_id], [user_type], [reg_center_id], [company_id], [created_by], [created_at], [updated_by], [updated_at], [is_deleted], [status]) VALUES (39, N'ammar789', N'123456', N'ammar789@gmail.com', N'123654', 1, NULL, 0, 0, 23, NULL, 39, NULL, 0, 0)
INSERT [dbo].[tbl_admin_user] ([user_id], [username], [password], [email], [mobile_number], [role_id], [user_type], [reg_center_id], [company_id], [created_by], [created_at], [updated_by], [updated_at], [is_deleted], [status]) VALUES (40, N'asim789', N'123456', N'asim789@gmail.com', N'123654', 1, NULL, 0, 0, 23, NULL, NULL, NULL, 0, 0)
INSERT [dbo].[tbl_admin_user] ([user_id], [username], [password], [email], [mobile_number], [role_id], [user_type], [reg_center_id], [company_id], [created_by], [created_at], [updated_by], [updated_at], [is_deleted], [status]) VALUES (41, N'yobro', N'123456', N'yobro@gmail.com', N'456321', 2, NULL, 0, 0, 39, NULL, 39, NULL, 1, 0)
INSERT [dbo].[tbl_admin_user] ([user_id], [username], [password], [email], [mobile_number], [role_id], [user_type], [reg_center_id], [company_id], [created_by], [created_at], [updated_by], [updated_at], [is_deleted], [status]) VALUES (42, N'abc456', N'123456', N'ammr', N'454612132', 2, NULL, 1, 54, 1, NULL, NULL, NULL, 1, 0)
INSERT [dbo].[tbl_admin_user] ([user_id], [username], [password], [email], [mobile_number], [role_id], [user_type], [reg_center_id], [company_id], [created_by], [created_at], [updated_by], [updated_at], [is_deleted], [status]) VALUES (43, N'name', N'123456', N'Asim', N'45656544', 1, NULL, 1, 1, 1, NULL, NULL, NULL, 1, 1)
INSERT [dbo].[tbl_admin_user] ([user_id], [username], [password], [email], [mobile_number], [role_id], [user_type], [reg_center_id], [company_id], [created_by], [created_at], [updated_by], [updated_at], [is_deleted], [status]) VALUES (44, N'Asim454556465', N'123456', N'asim@asim.com', N'1655456', 2, NULL, 0, 52, 3, NULL, NULL, NULL, 1, 0)
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
INSERT [dbo].[tbl_lkpt_roles] ([role_id], [role_name], [role_type], [status]) VALUES (25, N'ki', N'admin', 1)
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
INSERT [dbo].[tbl_reg_companies] ([company_id], [company_name], [official_number], [registrant_number], [registrant_designation], [registrant_mobile], [status]) VALUES (56, N'', N'', N'', N'', N'', 2)
INSERT [dbo].[tbl_reg_companies] ([company_id], [company_name], [official_number], [registrant_number], [registrant_designation], [registrant_mobile], [status]) VALUES (57, N'', N'', N'', N'', N'', 2)
INSERT [dbo].[tbl_reg_companies] ([company_id], [company_name], [official_number], [registrant_number], [registrant_designation], [registrant_mobile], [status]) VALUES (58, N'', N'', N'', N'', N'', 2)
INSERT [dbo].[tbl_reg_companies] ([company_id], [company_name], [official_number], [registrant_number], [registrant_designation], [registrant_mobile], [status]) VALUES (59, N'asim', N'654565', N'446465', N'455545', N'4987987', 2)
INSERT [dbo].[tbl_reg_companies] ([company_id], [company_name], [official_number], [registrant_number], [registrant_designation], [registrant_mobile], [status]) VALUES (60, N'Death', N'3265', N'54545', N'RIP', N'32145698', 2)
INSERT [dbo].[tbl_reg_companies] ([company_id], [company_name], [official_number], [registrant_number], [registrant_designation], [registrant_mobile], [status]) VALUES (61, N'Death', N'564556', N'5654564', N'RIP', N'32145698', 2)
SET IDENTITY_INSERT [dbo].[tbl_reg_companies] OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_reg_fleets] ON 

INSERT [dbo].[tbl_reg_fleets] ([fleet_id], [fleet_name], [company_id], [number_of_vehicles], [fleet_type], [status], [created_by], [created_at], [updated_by], [updated_at], [is_deleted]) VALUES (9, N'WoLf Warriors', 53, 58, N'Generic', 0, 0, CAST(N'2022-06-03T09:49:22.000' AS DateTime), NULL, NULL, 0)
INSERT [dbo].[tbl_reg_fleets] ([fleet_id], [fleet_name], [company_id], [number_of_vehicles], [fleet_type], [status], [created_by], [created_at], [updated_by], [updated_at], [is_deleted]) VALUES (11, N'Panda Lamesoul', 53, 58, N'Generic', 0, 0, CAST(N'2022-06-03T09:51:34.000' AS DateTime), 1, CAST(N'2022-07-18T17:58:34.000' AS DateTime), 0)
INSERT [dbo].[tbl_reg_fleets] ([fleet_id], [fleet_name], [company_id], [number_of_vehicles], [fleet_type], [status], [created_by], [created_at], [updated_by], [updated_at], [is_deleted]) VALUES (41, N'Mehran', 53, 45, N'local', 0, NULL, CAST(N'2022-07-19T09:14:23.000' AS DateTime), NULL, NULL, 1)
INSERT [dbo].[tbl_reg_fleets] ([fleet_id], [fleet_name], [company_id], [number_of_vehicles], [fleet_type], [status], [created_by], [created_at], [updated_by], [updated_at], [is_deleted]) VALUES (42, N'ammar', 53, 456, N'1', 1, NULL, CAST(N'2022-07-19T09:37:39.000' AS DateTime), NULL, NULL, 1)
INSERT [dbo].[tbl_reg_fleets] ([fleet_id], [fleet_name], [company_id], [number_of_vehicles], [fleet_type], [status], [created_by], [created_at], [updated_by], [updated_at], [is_deleted]) VALUES (43, N'Elite', 0, 1, N'Creative', 0, NULL, CAST(N'2022-08-11T13:08:04.000' AS DateTime), 1, CAST(N'2022-08-11T16:15:27.000' AS DateTime), 0)
INSERT [dbo].[tbl_reg_fleets] ([fleet_id], [fleet_name], [company_id], [number_of_vehicles], [fleet_type], [status], [created_by], [created_at], [updated_by], [updated_at], [is_deleted]) VALUES (44, N'Elite', 0, 456, N'Creative', 0, NULL, CAST(N'2022-08-11T16:14:11.000' AS DateTime), NULL, NULL, 1)
INSERT [dbo].[tbl_reg_fleets] ([fleet_id], [fleet_name], [company_id], [number_of_vehicles], [fleet_type], [status], [created_by], [created_at], [updated_by], [updated_at], [is_deleted]) VALUES (45, N'Elite12', 0, 456, N'Creative', 0, NULL, CAST(N'2022-08-11T16:14:56.000' AS DateTime), 1, CAST(N'2022-08-11T16:15:05.000' AS DateTime), 1)
INSERT [dbo].[tbl_reg_fleets] ([fleet_id], [fleet_name], [company_id], [number_of_vehicles], [fleet_type], [status], [created_by], [created_at], [updated_by], [updated_at], [is_deleted]) VALUES (48, N'Local Fleet', 53, 5, N'Local', 0, NULL, CAST(N'2022-08-22T16:40:29.000' AS DateTime), NULL, NULL, 0)
INSERT [dbo].[tbl_reg_fleets] ([fleet_id], [fleet_name], [company_id], [number_of_vehicles], [fleet_type], [status], [created_by], [created_at], [updated_by], [updated_at], [is_deleted]) VALUES (49, N'Local Fleet', 53, 5, N'Local', 0, NULL, CAST(N'2022-08-22T16:41:38.000' AS DateTime), NULL, NULL, 0)
INSERT [dbo].[tbl_reg_fleets] ([fleet_id], [fleet_name], [company_id], [number_of_vehicles], [fleet_type], [status], [created_by], [created_at], [updated_by], [updated_at], [is_deleted]) VALUES (50, N'Local Fleet', 53, 5, N'Local', 0, NULL, CAST(N'2022-08-22T16:43:58.000' AS DateTime), NULL, NULL, 0)
INSERT [dbo].[tbl_reg_fleets] ([fleet_id], [fleet_name], [company_id], [number_of_vehicles], [fleet_type], [status], [created_by], [created_at], [updated_by], [updated_at], [is_deleted]) VALUES (51, N'Local Fleet', 53, 5, N'Local', 0, NULL, CAST(N'2022-08-22T16:44:21.000' AS DateTime), NULL, NULL, 0)
INSERT [dbo].[tbl_reg_fleets] ([fleet_id], [fleet_name], [company_id], [number_of_vehicles], [fleet_type], [status], [created_by], [created_at], [updated_by], [updated_at], [is_deleted]) VALUES (52, N'Local Fleet', 53, 5, N'Local', 0, NULL, CAST(N'2022-08-22T16:45:05.000' AS DateTime), NULL, NULL, 0)
INSERT [dbo].[tbl_reg_fleets] ([fleet_id], [fleet_name], [company_id], [number_of_vehicles], [fleet_type], [status], [created_by], [created_at], [updated_by], [updated_at], [is_deleted]) VALUES (53, N'Local Fleet', 53, 5, N'Local', 0, NULL, CAST(N'2022-08-22T16:46:28.000' AS DateTime), NULL, NULL, 0)
INSERT [dbo].[tbl_reg_fleets] ([fleet_id], [fleet_name], [company_id], [number_of_vehicles], [fleet_type], [status], [created_by], [created_at], [updated_by], [updated_at], [is_deleted]) VALUES (54, N'Local Fleet', 53, 5, N'Local', 0, NULL, CAST(N'2022-08-22T16:47:08.000' AS DateTime), NULL, NULL, 0)
INSERT [dbo].[tbl_reg_fleets] ([fleet_id], [fleet_name], [company_id], [number_of_vehicles], [fleet_type], [status], [created_by], [created_at], [updated_by], [updated_at], [is_deleted]) VALUES (57, N'Local Fleet', 53, 5, N'Local', 0, NULL, CAST(N'2022-08-22T16:51:34.000' AS DateTime), NULL, NULL, 0)
INSERT [dbo].[tbl_reg_fleets] ([fleet_id], [fleet_name], [company_id], [number_of_vehicles], [fleet_type], [status], [created_by], [created_at], [updated_by], [updated_at], [is_deleted]) VALUES (58, N'Area54', 0, 7, N'Creative', 0, NULL, CAST(N'2022-08-25T12:42:40.000' AS DateTime), NULL, NULL, 1)
INSERT [dbo].[tbl_reg_fleets] ([fleet_id], [fleet_name], [company_id], [number_of_vehicles], [fleet_type], [status], [created_by], [created_at], [updated_by], [updated_at], [is_deleted]) VALUES (59, N'Area54', 0, 7, N'Creative', 0, NULL, CAST(N'2022-08-25T12:42:41.000' AS DateTime), NULL, NULL, 1)
INSERT [dbo].[tbl_reg_fleets] ([fleet_id], [fleet_name], [company_id], [number_of_vehicles], [fleet_type], [status], [created_by], [created_at], [updated_by], [updated_at], [is_deleted]) VALUES (60, N'Area54', 0, 7, N'Creative', 0, NULL, CAST(N'2022-08-25T12:42:41.000' AS DateTime), NULL, NULL, 1)
INSERT [dbo].[tbl_reg_fleets] ([fleet_id], [fleet_name], [company_id], [number_of_vehicles], [fleet_type], [status], [created_by], [created_at], [updated_by], [updated_at], [is_deleted]) VALUES (61, N'Area54', 0, 7, N'Creative', 0, NULL, CAST(N'2022-08-25T12:42:42.000' AS DateTime), NULL, NULL, 1)
INSERT [dbo].[tbl_reg_fleets] ([fleet_id], [fleet_name], [company_id], [number_of_vehicles], [fleet_type], [status], [created_by], [created_at], [updated_by], [updated_at], [is_deleted]) VALUES (62, N'Area54', 0, 7, N'Creative', 0, NULL, CAST(N'2022-08-25T12:42:42.000' AS DateTime), 1, CAST(N'2022-08-25T13:48:52.000' AS DateTime), 0)
INSERT [dbo].[tbl_reg_fleets] ([fleet_id], [fleet_name], [company_id], [number_of_vehicles], [fleet_type], [status], [created_by], [created_at], [updated_by], [updated_at], [is_deleted]) VALUES (63, N'Area54', 0, 7, N'Creative', 0, NULL, CAST(N'2022-08-25T12:42:42.000' AS DateTime), NULL, NULL, 1)
INSERT [dbo].[tbl_reg_fleets] ([fleet_id], [fleet_name], [company_id], [number_of_vehicles], [fleet_type], [status], [created_by], [created_at], [updated_by], [updated_at], [is_deleted]) VALUES (64, N'Area54', 0, 7, N'Creative', 0, NULL, CAST(N'2022-08-25T12:43:53.000' AS DateTime), NULL, NULL, 1)
INSERT [dbo].[tbl_reg_fleets] ([fleet_id], [fleet_name], [company_id], [number_of_vehicles], [fleet_type], [status], [created_by], [created_at], [updated_by], [updated_at], [is_deleted]) VALUES (65, N'Area54', 0, 7, N'Creative', 0, NULL, CAST(N'2022-08-25T12:44:23.000' AS DateTime), NULL, NULL, 1)
INSERT [dbo].[tbl_reg_fleets] ([fleet_id], [fleet_name], [company_id], [number_of_vehicles], [fleet_type], [status], [created_by], [created_at], [updated_by], [updated_at], [is_deleted]) VALUES (66, N'Area54', 0, 7, N'Creative', 0, NULL, CAST(N'2022-08-25T12:46:44.000' AS DateTime), NULL, NULL, 1)
INSERT [dbo].[tbl_reg_fleets] ([fleet_id], [fleet_name], [company_id], [number_of_vehicles], [fleet_type], [status], [created_by], [created_at], [updated_by], [updated_at], [is_deleted]) VALUES (67, N'Area54', 0, 7, N'Creative', 0, NULL, CAST(N'2022-08-25T12:46:45.000' AS DateTime), NULL, NULL, 1)
INSERT [dbo].[tbl_reg_fleets] ([fleet_id], [fleet_name], [company_id], [number_of_vehicles], [fleet_type], [status], [created_by], [created_at], [updated_by], [updated_at], [is_deleted]) VALUES (68, N'Area54', 0, 7, N'Creative', 0, NULL, CAST(N'2022-08-25T12:46:45.000' AS DateTime), NULL, NULL, 1)
INSERT [dbo].[tbl_reg_fleets] ([fleet_id], [fleet_name], [company_id], [number_of_vehicles], [fleet_type], [status], [created_by], [created_at], [updated_by], [updated_at], [is_deleted]) VALUES (69, N'Area54', 0, 7, N'Creative', 0, NULL, CAST(N'2022-08-25T12:46:45.000' AS DateTime), NULL, NULL, 1)
INSERT [dbo].[tbl_reg_fleets] ([fleet_id], [fleet_name], [company_id], [number_of_vehicles], [fleet_type], [status], [created_by], [created_at], [updated_by], [updated_at], [is_deleted]) VALUES (70, N'Area54', 0, 7, N'Creative', 0, NULL, CAST(N'2022-08-25T12:46:46.000' AS DateTime), NULL, NULL, 1)
INSERT [dbo].[tbl_reg_fleets] ([fleet_id], [fleet_name], [company_id], [number_of_vehicles], [fleet_type], [status], [created_by], [created_at], [updated_by], [updated_at], [is_deleted]) VALUES (71, N'Elite12', 0, 4, N'Creative', 0, NULL, CAST(N'2022-08-25T12:51:41.000' AS DateTime), 1, CAST(N'2022-08-25T13:49:24.000' AS DateTime), 0)
INSERT [dbo].[tbl_reg_fleets] ([fleet_id], [fleet_name], [company_id], [number_of_vehicles], [fleet_type], [status], [created_by], [created_at], [updated_by], [updated_at], [is_deleted]) VALUES (72, N'asim', 0, 7, N'Hope', 0, NULL, CAST(N'2022-08-26T10:16:06.000' AS DateTime), NULL, NULL, 0)
SET IDENTITY_INSERT [dbo].[tbl_reg_fleets] OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_reg_vehicle] ON 

INSERT [dbo].[tbl_reg_vehicle] ([vehicle_id], [vehicle_registration_no], [vehicle_made_id], [vehicle_modal], [vehicle_color], [vehicle_type_id], [owner_mobile_no], [owner_mobile_sec], [vehicle_owner_name], [vehicle_owner_cnic], [vehicle_owner_address], [remarks], [reg_center_id], [is_company], [company_id], [m_tag_token], [vehicle_chasis_no], [vehicle_engine_no], [vehicle_class_id], [province_id], [city_id], [issue_date], [expiry_date], [tag_type_id], [drivers_license], [created_by], [created_at], [updated_by], [updated_at], [is_deleted], [status]) VALUES (1, N'PKR-3565', 1, 0, N'', 1, 56465654654, 0, N' Muhammed Ammar', N'', N'', N'something', 1, 0, 53, N'', N'', N'', 1, 1, 1, CAST(N'2022-06-24' AS Date), CAST(N'2023-04-12' AS Date), 0, N'', 1, CAST(N'2022-06-24T18:10:04.000' AS DateTime), NULL, NULL, NULL, 0)
INSERT [dbo].[tbl_reg_vehicle] ([vehicle_id], [vehicle_registration_no], [vehicle_made_id], [vehicle_modal], [vehicle_color], [vehicle_type_id], [owner_mobile_no], [owner_mobile_sec], [vehicle_owner_name], [vehicle_owner_cnic], [vehicle_owner_address], [remarks], [reg_center_id], [is_company], [company_id], [m_tag_token], [vehicle_chasis_no], [vehicle_engine_no], [vehicle_class_id], [province_id], [city_id], [issue_date], [expiry_date], [tag_type_id], [drivers_license], [created_by], [created_at], [updated_by], [updated_at], [is_deleted], [status]) VALUES (2, N'LHQ-6584', 1, 0, N'', 1, 564564, 0, N' Ali', N'', N'', N'something', 1, 0, 53, N'', N'', N'', 1, 1, 1, CAST(N'2022-06-24' AS Date), CAST(N'2023-04-12' AS Date), 0, N'', 1, CAST(N'2022-06-24T18:31:02.000' AS DateTime), NULL, NULL, NULL, 0)
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
INSERT [dbo].[tbl_reg_vehicle] ([vehicle_id], [vehicle_registration_no], [vehicle_made_id], [vehicle_modal], [vehicle_color], [vehicle_type_id], [owner_mobile_no], [owner_mobile_sec], [vehicle_owner_name], [vehicle_owner_cnic], [vehicle_owner_address], [remarks], [reg_center_id], [is_company], [company_id], [m_tag_token], [vehicle_chasis_no], [vehicle_engine_no], [vehicle_class_id], [province_id], [city_id], [issue_date], [expiry_date], [tag_type_id], [drivers_license], [created_by], [created_at], [updated_by], [updated_at], [is_deleted], [status]) VALUES (49, N'FL9865', 1, 2007, N'Red', 1, 3239334772, 0, N'Muhammad Kashif', N'173014678323', N'something', N'something', 1, 0, 0, N'flei-6547-rewf', N'65478932145', N'31321321', 1, 1, 1, CAST(N'2022-08-25' AS Date), CAST(N'2023-04-12' AS Date), 0, N'321654321', 1, CAST(N'2022-08-25T12:33:41.000' AS DateTime), NULL, NULL, NULL, 0)
INSERT [dbo].[tbl_reg_vehicle] ([vehicle_id], [vehicle_registration_no], [vehicle_made_id], [vehicle_modal], [vehicle_color], [vehicle_type_id], [owner_mobile_no], [owner_mobile_sec], [vehicle_owner_name], [vehicle_owner_cnic], [vehicle_owner_address], [remarks], [reg_center_id], [is_company], [company_id], [m_tag_token], [vehicle_chasis_no], [vehicle_engine_no], [vehicle_class_id], [province_id], [city_id], [issue_date], [expiry_date], [tag_type_id], [drivers_license], [created_by], [created_at], [updated_by], [updated_at], [is_deleted], [status]) VALUES (50, N'FL9865', 1, 2007, N'Red', 1, 3239334772, 0, N'Muhammad Kashif', N'173014678323', N'something', N'something', 1, 0, 0, N'flei-6547-rewf', N'65478932145', N'31321321', 1, 1, 1, CAST(N'2022-08-25' AS Date), CAST(N'2023-04-12' AS Date), 0, N'321654321', 1, CAST(N'2022-08-25T12:36:02.000' AS DateTime), NULL, NULL, NULL, 0)
INSERT [dbo].[tbl_reg_vehicle] ([vehicle_id], [vehicle_registration_no], [vehicle_made_id], [vehicle_modal], [vehicle_color], [vehicle_type_id], [owner_mobile_no], [owner_mobile_sec], [vehicle_owner_name], [vehicle_owner_cnic], [vehicle_owner_address], [remarks], [reg_center_id], [is_company], [company_id], [m_tag_token], [vehicle_chasis_no], [vehicle_engine_no], [vehicle_class_id], [province_id], [city_id], [issue_date], [expiry_date], [tag_type_id], [drivers_license], [created_by], [created_at], [updated_by], [updated_at], [is_deleted], [status]) VALUES (51, N'FL9865', 1, 2007, N'Red', 1, 3239334772, 0, N'Muhammad Kashif', N'173014678323', N'something', N'something', 1, 0, 0, N'flei-6547-rewf', N'65478932145', N'31321321', 1, 1, 1, CAST(N'2022-08-25' AS Date), CAST(N'2023-04-12' AS Date), 0, N'321654321', 1, CAST(N'2022-08-25T12:36:03.000' AS DateTime), NULL, NULL, NULL, 0)
INSERT [dbo].[tbl_reg_vehicle] ([vehicle_id], [vehicle_registration_no], [vehicle_made_id], [vehicle_modal], [vehicle_color], [vehicle_type_id], [owner_mobile_no], [owner_mobile_sec], [vehicle_owner_name], [vehicle_owner_cnic], [vehicle_owner_address], [remarks], [reg_center_id], [is_company], [company_id], [m_tag_token], [vehicle_chasis_no], [vehicle_engine_no], [vehicle_class_id], [province_id], [city_id], [issue_date], [expiry_date], [tag_type_id], [drivers_license], [created_by], [created_at], [updated_by], [updated_at], [is_deleted], [status]) VALUES (52, N'FL9865', 1, 2007, N'Red', 1, 3239334772, 0, N'Muhammad Kashif', N'173014678323', N'something', N'something', 1, 0, 0, N'flei-6547-rewf', N'65478932145', N'31321321', 1, 1, 1, CAST(N'2022-08-25' AS Date), CAST(N'2023-04-12' AS Date), 0, N'321654321', 1, CAST(N'2022-08-25T12:36:04.000' AS DateTime), NULL, NULL, NULL, 0)
INSERT [dbo].[tbl_reg_vehicle] ([vehicle_id], [vehicle_registration_no], [vehicle_made_id], [vehicle_modal], [vehicle_color], [vehicle_type_id], [owner_mobile_no], [owner_mobile_sec], [vehicle_owner_name], [vehicle_owner_cnic], [vehicle_owner_address], [remarks], [reg_center_id], [is_company], [company_id], [m_tag_token], [vehicle_chasis_no], [vehicle_engine_no], [vehicle_class_id], [province_id], [city_id], [issue_date], [expiry_date], [tag_type_id], [drivers_license], [created_by], [created_at], [updated_by], [updated_at], [is_deleted], [status]) VALUES (53, N'FL9865', 1, 2007, N'Red', 1, 3239334772, 0, N'Muhammad Kashif', N'173014678323', N'something', N'something', 1, 0, 0, N'flei-6547-rewf', N'65478932145', N'31321321', 1, 1, 1, CAST(N'2022-08-25' AS Date), CAST(N'2023-04-12' AS Date), 0, N'321654321', 1, CAST(N'2022-08-25T12:38:03.000' AS DateTime), NULL, NULL, NULL, 0)
INSERT [dbo].[tbl_reg_vehicle] ([vehicle_id], [vehicle_registration_no], [vehicle_made_id], [vehicle_modal], [vehicle_color], [vehicle_type_id], [owner_mobile_no], [owner_mobile_sec], [vehicle_owner_name], [vehicle_owner_cnic], [vehicle_owner_address], [remarks], [reg_center_id], [is_company], [company_id], [m_tag_token], [vehicle_chasis_no], [vehicle_engine_no], [vehicle_class_id], [province_id], [city_id], [issue_date], [expiry_date], [tag_type_id], [drivers_license], [created_by], [created_at], [updated_by], [updated_at], [is_deleted], [status]) VALUES (54, N'BA-789', 1, 2007, N'Red', 1, 3239334772, 0, N'Muhammad Kashif', N'173014678323', N'something', N'something', 1, 0, 0, N'flei-6547-rewf', N'65478932145', N'31321321', 1, 1, 1, CAST(N'2022-08-25' AS Date), CAST(N'2023-04-12' AS Date), 0, N'321654321', 1, CAST(N'2022-08-25T12:58:50.000' AS DateTime), NULL, NULL, NULL, 0)
INSERT [dbo].[tbl_reg_vehicle] ([vehicle_id], [vehicle_registration_no], [vehicle_made_id], [vehicle_modal], [vehicle_color], [vehicle_type_id], [owner_mobile_no], [owner_mobile_sec], [vehicle_owner_name], [vehicle_owner_cnic], [vehicle_owner_address], [remarks], [reg_center_id], [is_company], [company_id], [m_tag_token], [vehicle_chasis_no], [vehicle_engine_no], [vehicle_class_id], [province_id], [city_id], [issue_date], [expiry_date], [tag_type_id], [drivers_license], [created_by], [created_at], [updated_by], [updated_at], [is_deleted], [status]) VALUES (55, N'BA-789', 1, 2007, N'Red', 1, 3239334772, 0, N'Muhammad Kashif', N'173014678323', N'something', N'something', 1, 0, 0, N'flei-6547-rewf', N'65478932145', N'31321321', 1, 1, 1, CAST(N'2022-08-25' AS Date), CAST(N'2023-04-12' AS Date), 0, N'321654321', 1, CAST(N'2022-08-25T13:00:18.000' AS DateTime), NULL, NULL, NULL, 0)
INSERT [dbo].[tbl_reg_vehicle] ([vehicle_id], [vehicle_registration_no], [vehicle_made_id], [vehicle_modal], [vehicle_color], [vehicle_type_id], [owner_mobile_no], [owner_mobile_sec], [vehicle_owner_name], [vehicle_owner_cnic], [vehicle_owner_address], [remarks], [reg_center_id], [is_company], [company_id], [m_tag_token], [vehicle_chasis_no], [vehicle_engine_no], [vehicle_class_id], [province_id], [city_id], [issue_date], [expiry_date], [tag_type_id], [drivers_license], [created_by], [created_at], [updated_by], [updated_at], [is_deleted], [status]) VALUES (56, N'BA-789', 1, 2007, N'Red', 1, 3239334772, 0, N'Muhammad Kashif', N'173014678323', N'something', N'something', 1, 0, 0, N'flei-6547-rewf', N'65478932145', N'31321321', 1, 1, 1, CAST(N'2022-08-25' AS Date), CAST(N'2023-04-12' AS Date), 0, N'321654321', 1, CAST(N'2022-08-25T13:07:01.000' AS DateTime), NULL, NULL, NULL, 0)
INSERT [dbo].[tbl_reg_vehicle] ([vehicle_id], [vehicle_registration_no], [vehicle_made_id], [vehicle_modal], [vehicle_color], [vehicle_type_id], [owner_mobile_no], [owner_mobile_sec], [vehicle_owner_name], [vehicle_owner_cnic], [vehicle_owner_address], [remarks], [reg_center_id], [is_company], [company_id], [m_tag_token], [vehicle_chasis_no], [vehicle_engine_no], [vehicle_class_id], [province_id], [city_id], [issue_date], [expiry_date], [tag_type_id], [drivers_license], [created_by], [created_at], [updated_by], [updated_at], [is_deleted], [status]) VALUES (57, N'BA-789', 1, 2007, N'Red', 1, 3239334772, 0, N'Muhammad Kashif', N'173014678323', N'something', N'something', 1, 0, 0, N'4545', N'65478932145', N'31321321', 1, 1, 1, CAST(N'2022-08-25' AS Date), CAST(N'2023-04-12' AS Date), 0, N'321654321', 1, CAST(N'2022-08-25T13:07:53.000' AS DateTime), NULL, NULL, NULL, 0)
INSERT [dbo].[tbl_reg_vehicle] ([vehicle_id], [vehicle_registration_no], [vehicle_made_id], [vehicle_modal], [vehicle_color], [vehicle_type_id], [owner_mobile_no], [owner_mobile_sec], [vehicle_owner_name], [vehicle_owner_cnic], [vehicle_owner_address], [remarks], [reg_center_id], [is_company], [company_id], [m_tag_token], [vehicle_chasis_no], [vehicle_engine_no], [vehicle_class_id], [province_id], [city_id], [issue_date], [expiry_date], [tag_type_id], [drivers_license], [created_by], [created_at], [updated_by], [updated_at], [is_deleted], [status]) VALUES (58, N'BA-789', 1, 2007, N'Red', 1, 3239334772, 0, N'Muhammad Kashif', N'173014678323', N'something', N'something', 1, 0, 0, N'4545', N'65478932145', N'31321321', 1, 1, 1, CAST(N'2022-08-25' AS Date), CAST(N'2023-04-12' AS Date), 0, N'321654321', 1, CAST(N'2022-08-25T13:08:37.000' AS DateTime), NULL, NULL, NULL, 0)
INSERT [dbo].[tbl_reg_vehicle] ([vehicle_id], [vehicle_registration_no], [vehicle_made_id], [vehicle_modal], [vehicle_color], [vehicle_type_id], [owner_mobile_no], [owner_mobile_sec], [vehicle_owner_name], [vehicle_owner_cnic], [vehicle_owner_address], [remarks], [reg_center_id], [is_company], [company_id], [m_tag_token], [vehicle_chasis_no], [vehicle_engine_no], [vehicle_class_id], [province_id], [city_id], [issue_date], [expiry_date], [tag_type_id], [drivers_license], [created_by], [created_at], [updated_by], [updated_at], [is_deleted], [status]) VALUES (59, N'BA-789', 1, 2007, N'Red', 1, 3239334772, 0, N'Muhammad Kashif', N'173014678323', N'something', N'something', 1, 0, 0, N'4545', N'65478932145', N'31321321', 1, 1, 1, CAST(N'2022-08-25' AS Date), CAST(N'2023-04-12' AS Date), 0, N'321654321', 1, CAST(N'2022-08-25T13:09:18.000' AS DateTime), NULL, NULL, NULL, 0)
INSERT [dbo].[tbl_reg_vehicle] ([vehicle_id], [vehicle_registration_no], [vehicle_made_id], [vehicle_modal], [vehicle_color], [vehicle_type_id], [owner_mobile_no], [owner_mobile_sec], [vehicle_owner_name], [vehicle_owner_cnic], [vehicle_owner_address], [remarks], [reg_center_id], [is_company], [company_id], [m_tag_token], [vehicle_chasis_no], [vehicle_engine_no], [vehicle_class_id], [province_id], [city_id], [issue_date], [expiry_date], [tag_type_id], [drivers_license], [created_by], [created_at], [updated_by], [updated_at], [is_deleted], [status]) VALUES (60, N'BA-789', 1, 2007, N'Red', 1, 3239334772, 0, N'Muhammad Kashif', N'173014678323', N'something', N'something', 1, 0, 0, N'4545', N'65478932145', N'31321321', 1, 1, 1, CAST(N'2022-08-25' AS Date), CAST(N'2023-04-12' AS Date), 0, N'321654321', 1, CAST(N'2022-08-25T13:14:33.000' AS DateTime), NULL, NULL, NULL, 0)
INSERT [dbo].[tbl_reg_vehicle] ([vehicle_id], [vehicle_registration_no], [vehicle_made_id], [vehicle_modal], [vehicle_color], [vehicle_type_id], [owner_mobile_no], [owner_mobile_sec], [vehicle_owner_name], [vehicle_owner_cnic], [vehicle_owner_address], [remarks], [reg_center_id], [is_company], [company_id], [m_tag_token], [vehicle_chasis_no], [vehicle_engine_no], [vehicle_class_id], [province_id], [city_id], [issue_date], [expiry_date], [tag_type_id], [drivers_license], [created_by], [created_at], [updated_by], [updated_at], [is_deleted], [status]) VALUES (75, N'FAS-21', 1, 2007, N'Red', 1, 3239334772, 0, N'Muhammad Kashif', N'173014678323', N'something', N'something', 1, 0, 0, N'4545', N'65478932145', N'31321321', 1, 1, 1, CAST(N'2022-08-25' AS Date), CAST(N'2023-04-12' AS Date), 0, N'321654321', 1, CAST(N'2022-08-25T17:39:47.000' AS DateTime), NULL, NULL, NULL, 0)
INSERT [dbo].[tbl_reg_vehicle] ([vehicle_id], [vehicle_registration_no], [vehicle_made_id], [vehicle_modal], [vehicle_color], [vehicle_type_id], [owner_mobile_no], [owner_mobile_sec], [vehicle_owner_name], [vehicle_owner_cnic], [vehicle_owner_address], [remarks], [reg_center_id], [is_company], [company_id], [m_tag_token], [vehicle_chasis_no], [vehicle_engine_no], [vehicle_class_id], [province_id], [city_id], [issue_date], [expiry_date], [tag_type_id], [drivers_license], [created_by], [created_at], [updated_by], [updated_at], [is_deleted], [status]) VALUES (76, N'LEA3925', 1, 2011, N'red', 1, 44545, 2121212121, N'sfghada', N'6565465', N'dsghgfgh', N'something', 1, 0, 0, N'ddsakd454', N'4545', N'4545', 1, 1, 1, CAST(N'2022-08-26' AS Date), CAST(N'2023-04-12' AS Date), 0, N'454545', 1, CAST(N'2022-08-26T10:08:45.000' AS DateTime), NULL, NULL, NULL, 0)
INSERT [dbo].[tbl_reg_vehicle] ([vehicle_id], [vehicle_registration_no], [vehicle_made_id], [vehicle_modal], [vehicle_color], [vehicle_type_id], [owner_mobile_no], [owner_mobile_sec], [vehicle_owner_name], [vehicle_owner_cnic], [vehicle_owner_address], [remarks], [reg_center_id], [is_company], [company_id], [m_tag_token], [vehicle_chasis_no], [vehicle_engine_no], [vehicle_class_id], [province_id], [city_id], [issue_date], [expiry_date], [tag_type_id], [drivers_license], [created_by], [created_at], [updated_by], [updated_at], [is_deleted], [status]) VALUES (77, N'LEA3925', 1, 2011, N'red', 1, 44545, 2121212121, N'sfghada', N'6565465', N'dsghgfgh', N'something', 1, 0, 0, N'ddsakd454', N'4545', N'4545', 1, 1, 1, CAST(N'2022-08-26' AS Date), CAST(N'2023-04-12' AS Date), 0, N'454545', 1, CAST(N'2022-08-26T10:08:54.000' AS DateTime), NULL, NULL, NULL, 0)
INSERT [dbo].[tbl_reg_vehicle] ([vehicle_id], [vehicle_registration_no], [vehicle_made_id], [vehicle_modal], [vehicle_color], [vehicle_type_id], [owner_mobile_no], [owner_mobile_sec], [vehicle_owner_name], [vehicle_owner_cnic], [vehicle_owner_address], [remarks], [reg_center_id], [is_company], [company_id], [m_tag_token], [vehicle_chasis_no], [vehicle_engine_no], [vehicle_class_id], [province_id], [city_id], [issue_date], [expiry_date], [tag_type_id], [drivers_license], [created_by], [created_at], [updated_by], [updated_at], [is_deleted], [status]) VALUES (78, N'LE8902', 1, 2011, N'red', 1, 23232, 0, N'asim', N'54545', N'sdhdh', N'something', 1, 0, 0, N'ddsakd454', N'465465456', N'2332', 1, 1, 1, CAST(N'2022-08-26' AS Date), CAST(N'2023-04-12' AS Date), 0, N'2323', 1, CAST(N'2022-08-26T10:10:40.000' AS DateTime), NULL, NULL, NULL, 0)
SET IDENTITY_INSERT [dbo].[tbl_reg_vehicle] OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_rel_fleet] ON 

INSERT [dbo].[tbl_rel_fleet] ([rel_id], [fleet_id], [vehicle_id], [created_by], [created_at], [updated_by], [updated_at], [status], [is_deleted]) VALUES (72, 11, 2, 23, CAST(N'2022-08-01T17:51:08.000' AS DateTime), NULL, NULL, 0, 0)
INSERT [dbo].[tbl_rel_fleet] ([rel_id], [fleet_id], [vehicle_id], [created_by], [created_at], [updated_by], [updated_at], [status], [is_deleted]) VALUES (73, 11, 3, 23, CAST(N'2022-08-01T17:51:08.000' AS DateTime), NULL, NULL, 0, 0)
INSERT [dbo].[tbl_rel_fleet] ([rel_id], [fleet_id], [vehicle_id], [created_by], [created_at], [updated_by], [updated_at], [status], [is_deleted]) VALUES (77, 0, 41, 3, CAST(N'2022-08-11T16:24:14.000' AS DateTime), NULL, NULL, 0, 0)
INSERT [dbo].[tbl_rel_fleet] ([rel_id], [fleet_id], [vehicle_id], [created_by], [created_at], [updated_by], [updated_at], [status], [is_deleted]) VALUES (79, 43, 43, 3, CAST(N'2022-08-12T17:29:59.000' AS DateTime), NULL, NULL, 0, 0)
INSERT [dbo].[tbl_rel_fleet] ([rel_id], [fleet_id], [vehicle_id], [created_by], [created_at], [updated_by], [updated_at], [status], [is_deleted]) VALUES (81, 62, 38, 3, CAST(N'2022-08-25T12:47:54.000' AS DateTime), NULL, NULL, 0, 0)
INSERT [dbo].[tbl_rel_fleet] ([rel_id], [fleet_id], [vehicle_id], [created_by], [created_at], [updated_by], [updated_at], [status], [is_deleted]) VALUES (82, 72, 78, 3, CAST(N'2022-08-29T09:53:03.000' AS DateTime), NULL, NULL, 0, 0)
INSERT [dbo].[tbl_rel_fleet] ([rel_id], [fleet_id], [vehicle_id], [created_by], [created_at], [updated_by], [updated_at], [status], [is_deleted]) VALUES (83, 0, 45, 3, CAST(N'2022-08-30T12:25:23.000' AS DateTime), NULL, NULL, 0, 0)
INSERT [dbo].[tbl_rel_fleet] ([rel_id], [fleet_id], [vehicle_id], [created_by], [created_at], [updated_by], [updated_at], [status], [is_deleted]) VALUES (85, 62, 76, 3, CAST(N'2022-09-01T11:19:53.000' AS DateTime), NULL, NULL, 0, 0)
SET IDENTITY_INSERT [dbo].[tbl_rel_fleet] OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_vehicle_account] ON 

INSERT [dbo].[tbl_vehicle_account] ([account_id], [open_balance], [payment_type], [payment_amount], [payment_status], [payment_method], [vehicle_id], [fleet_id], [close_balance], [created_at], [created_by], [updated_at], [updated_by]) VALUES (1, 0, N'Account Created', 0, NULL, NULL, 0, 57, 0, CAST(N'2022-08-22T16:51:34.000' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[tbl_vehicle_account] ([account_id], [open_balance], [payment_type], [payment_amount], [payment_status], [payment_method], [vehicle_id], [fleet_id], [close_balance], [created_at], [created_by], [updated_at], [updated_by]) VALUES (2, 0, N'recharge', 200, N'Done', N'Cash', 0, 57, 200, CAST(N'2022-08-22T17:06:07.000' AS DateTime), 1, NULL, NULL)
INSERT [dbo].[tbl_vehicle_account] ([account_id], [open_balance], [payment_type], [payment_amount], [payment_status], [payment_method], [vehicle_id], [fleet_id], [close_balance], [created_at], [created_by], [updated_at], [updated_by]) VALUES (3, 0, N'recharge', 500, N'Done', N'Cash', 0, 57, 500, CAST(N'2022-08-22T17:06:48.000' AS DateTime), 1, NULL, NULL)
INSERT [dbo].[tbl_vehicle_account] ([account_id], [open_balance], [payment_type], [payment_amount], [payment_status], [payment_method], [vehicle_id], [fleet_id], [close_balance], [created_at], [created_by], [updated_at], [updated_by]) VALUES (4, 0, N'recharge', 500, N'Done', N'Cash', 0, 57, 500, CAST(N'2022-08-22T17:07:41.000' AS DateTime), 1, NULL, NULL)
INSERT [dbo].[tbl_vehicle_account] ([account_id], [open_balance], [payment_type], [payment_amount], [payment_status], [payment_method], [vehicle_id], [fleet_id], [close_balance], [created_at], [created_by], [updated_at], [updated_by]) VALUES (5, 500, N'recharge', 500, N'Done', N'Cash', 0, 57, 1000, CAST(N'2022-08-22T17:10:28.000' AS DateTime), 1, NULL, NULL)
INSERT [dbo].[tbl_vehicle_account] ([account_id], [open_balance], [payment_type], [payment_amount], [payment_status], [payment_method], [vehicle_id], [fleet_id], [close_balance], [created_at], [created_by], [updated_at], [updated_by]) VALUES (6, 1000, N'recharge', 700, N'Done', N'Cash', 57, 57, 1700, CAST(N'2022-08-22T17:10:44.000' AS DateTime), 1, NULL, NULL)
INSERT [dbo].[tbl_vehicle_account] ([account_id], [open_balance], [payment_type], [payment_amount], [payment_status], [payment_method], [vehicle_id], [fleet_id], [close_balance], [created_at], [created_by], [updated_at], [updated_by]) VALUES (7, 1700, N'recharge', 700, N'Done', N'Cash', 0, 57, 2400, CAST(N'2022-08-23T12:03:37.000' AS DateTime), 1, NULL, NULL)
INSERT [dbo].[tbl_vehicle_account] ([account_id], [open_balance], [payment_type], [payment_amount], [payment_status], [payment_method], [vehicle_id], [fleet_id], [close_balance], [created_at], [created_by], [updated_at], [updated_by]) VALUES (8, 2400, N'recharge', 700, N'Done', N'Cash', 57, 57, 3100, CAST(N'2022-08-23T12:05:30.000' AS DateTime), 1, NULL, NULL)
INSERT [dbo].[tbl_vehicle_account] ([account_id], [open_balance], [payment_type], [payment_amount], [payment_status], [payment_method], [vehicle_id], [fleet_id], [close_balance], [created_at], [created_by], [updated_at], [updated_by]) VALUES (9, 3100, N'recharge', 700, N'Done', N'Cash', 0, 57, 3800, CAST(N'2022-08-23T12:18:40.000' AS DateTime), 1, NULL, NULL)
INSERT [dbo].[tbl_vehicle_account] ([account_id], [open_balance], [payment_type], [payment_amount], [payment_status], [payment_method], [vehicle_id], [fleet_id], [close_balance], [created_at], [created_by], [updated_at], [updated_by]) VALUES (10, 3800, N'recharge', 100, N'Done', N'Cash', 57, 57, 3900, CAST(N'2022-08-23T12:31:28.000' AS DateTime), 1, NULL, NULL)
INSERT [dbo].[tbl_vehicle_account] ([account_id], [open_balance], [payment_type], [payment_amount], [payment_status], [payment_method], [vehicle_id], [fleet_id], [close_balance], [created_at], [created_by], [updated_at], [updated_by]) VALUES (11, 3900, N'recharge', 100, N'Done', N'Cash', 0, 57, 4000, CAST(N'2022-08-23T12:32:08.000' AS DateTime), 1, NULL, NULL)
INSERT [dbo].[tbl_vehicle_account] ([account_id], [open_balance], [payment_type], [payment_amount], [payment_status], [payment_method], [vehicle_id], [fleet_id], [close_balance], [created_at], [created_by], [updated_at], [updated_by]) VALUES (12, 3900, N'recharge', 700, N'Done', N'Cash', 57, 0, 4600, CAST(N'2022-08-23T12:45:27.000' AS DateTime), 1, NULL, NULL)
INSERT [dbo].[tbl_vehicle_account] ([account_id], [open_balance], [payment_type], [payment_amount], [payment_status], [payment_method], [vehicle_id], [fleet_id], [close_balance], [created_at], [created_by], [updated_at], [updated_by]) VALUES (13, 4600, N'recharge', 700, N'Done', N'Cash', 57, 0, 5300, CAST(N'2022-08-23T12:46:42.000' AS DateTime), 1, NULL, NULL)
INSERT [dbo].[tbl_vehicle_account] ([account_id], [open_balance], [payment_type], [payment_amount], [payment_status], [payment_method], [vehicle_id], [fleet_id], [close_balance], [created_at], [created_by], [updated_at], [updated_by]) VALUES (14, 5300, N'recharge', 700, N'Done', N'Cash', 57, 0, 6000, CAST(N'2022-08-23T12:46:44.000' AS DateTime), 1, NULL, NULL)
INSERT [dbo].[tbl_vehicle_account] ([account_id], [open_balance], [payment_type], [payment_amount], [payment_status], [payment_method], [vehicle_id], [fleet_id], [close_balance], [created_at], [created_by], [updated_at], [updated_by]) VALUES (15, 6000, N'recharge', 100, N'Done', N'Cash', 57, 0, 6100, CAST(N'2022-08-23T12:47:46.000' AS DateTime), 1, NULL, NULL)
INSERT [dbo].[tbl_vehicle_account] ([account_id], [open_balance], [payment_type], [payment_amount], [payment_status], [payment_method], [vehicle_id], [fleet_id], [close_balance], [created_at], [created_by], [updated_at], [updated_by]) VALUES (17, 0, N'Account Created', 0, NULL, NULL, 75, 0, 0, CAST(N'2022-08-25T17:39:47.000' AS DateTime), 1, NULL, NULL)
INSERT [dbo].[tbl_vehicle_account] ([account_id], [open_balance], [payment_type], [payment_amount], [payment_status], [payment_method], [vehicle_id], [fleet_id], [close_balance], [created_at], [created_by], [updated_at], [updated_by]) VALUES (18, 0, N'Account Created', 0, NULL, NULL, 76, 0, 0, CAST(N'2022-08-26T10:08:45.000' AS DateTime), 1, NULL, NULL)
INSERT [dbo].[tbl_vehicle_account] ([account_id], [open_balance], [payment_type], [payment_amount], [payment_status], [payment_method], [vehicle_id], [fleet_id], [close_balance], [created_at], [created_by], [updated_at], [updated_by]) VALUES (19, 0, N'Account Created', 0, NULL, NULL, 77, 0, 0, CAST(N'2022-08-26T10:08:54.000' AS DateTime), 1, NULL, NULL)
INSERT [dbo].[tbl_vehicle_account] ([account_id], [open_balance], [payment_type], [payment_amount], [payment_status], [payment_method], [vehicle_id], [fleet_id], [close_balance], [created_at], [created_by], [updated_at], [updated_by]) VALUES (20, 0, N'Account Created', 0, NULL, NULL, 78, 0, 0, CAST(N'2022-08-26T10:10:40.000' AS DateTime), 1, NULL, NULL)
INSERT [dbo].[tbl_vehicle_account] ([account_id], [open_balance], [payment_type], [payment_amount], [payment_status], [payment_method], [vehicle_id], [fleet_id], [close_balance], [created_at], [created_by], [updated_at], [updated_by]) VALUES (21, 0, N'Account Created', 0, NULL, NULL, 0, 72, 0, CAST(N'2022-08-26T10:16:06.000' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[tbl_vehicle_account] ([account_id], [open_balance], [payment_type], [payment_amount], [payment_status], [payment_method], [vehicle_id], [fleet_id], [close_balance], [created_at], [created_by], [updated_at], [updated_by]) VALUES (22, 6100, N'recharge', 700, N'Done', N'Cash', 57, 0, 6800, CAST(N'2022-08-26T10:52:03.000' AS DateTime), 1, NULL, NULL)
INSERT [dbo].[tbl_vehicle_account] ([account_id], [open_balance], [payment_type], [payment_amount], [payment_status], [payment_method], [vehicle_id], [fleet_id], [close_balance], [created_at], [created_by], [updated_at], [updated_by]) VALUES (23, 4000, N'recharge', 700, N'Done', N'Cash', 0, 57, 4700, CAST(N'2022-08-26T10:52:17.000' AS DateTime), 1, NULL, NULL)
INSERT [dbo].[tbl_vehicle_account] ([account_id], [open_balance], [payment_type], [payment_amount], [payment_status], [payment_method], [vehicle_id], [fleet_id], [close_balance], [created_at], [created_by], [updated_at], [updated_by]) VALUES (24, 6800, N'recharge', 100, N'Done', N'Cash', 57, 0, 6900, CAST(N'2022-08-26T15:51:36.000' AS DateTime), 1, NULL, NULL)
INSERT [dbo].[tbl_vehicle_account] ([account_id], [open_balance], [payment_type], [payment_amount], [payment_status], [payment_method], [vehicle_id], [fleet_id], [close_balance], [created_at], [created_by], [updated_at], [updated_by]) VALUES (25, 0, N'recharge', 100, N'Done', N'Cash', 75, 0, 100, CAST(N'2022-08-26T15:51:53.000' AS DateTime), 1, NULL, NULL)
INSERT [dbo].[tbl_vehicle_account] ([account_id], [open_balance], [payment_type], [payment_amount], [payment_status], [payment_method], [vehicle_id], [fleet_id], [close_balance], [created_at], [created_by], [updated_at], [updated_by]) VALUES (26, 100, N'recharge', 2000, N'Done', N'Cash', 75, 0, 2100, CAST(N'2022-08-26T16:48:33.000' AS DateTime), 3, NULL, NULL)
INSERT [dbo].[tbl_vehicle_account] ([account_id], [open_balance], [payment_type], [payment_amount], [payment_status], [payment_method], [vehicle_id], [fleet_id], [close_balance], [created_at], [created_by], [updated_at], [updated_by]) VALUES (27, 2100, N'recharge', 2000, N'Done', N'Cash', 75, 0, 4100, CAST(N'2022-08-26T16:49:33.000' AS DateTime), 3, NULL, NULL)
INSERT [dbo].[tbl_vehicle_account] ([account_id], [open_balance], [payment_type], [payment_amount], [payment_status], [payment_method], [vehicle_id], [fleet_id], [close_balance], [created_at], [created_by], [updated_at], [updated_by]) VALUES (28, 4100, N'recharge', 1000, N'Done', N'Cash', 75, 0, 5100, CAST(N'2022-08-26T16:50:03.000' AS DateTime), 3, NULL, NULL)
INSERT [dbo].[tbl_vehicle_account] ([account_id], [open_balance], [payment_type], [payment_amount], [payment_status], [payment_method], [vehicle_id], [fleet_id], [close_balance], [created_at], [created_by], [updated_at], [updated_by]) VALUES (29, 5100, N'recharge', 100, N'Done', N'Cash', 75, 0, 5200, CAST(N'2022-08-26T16:50:40.000' AS DateTime), 3, NULL, NULL)
INSERT [dbo].[tbl_vehicle_account] ([account_id], [open_balance], [payment_type], [payment_amount], [payment_status], [payment_method], [vehicle_id], [fleet_id], [close_balance], [created_at], [created_by], [updated_at], [updated_by]) VALUES (30, 5200, N'recharge', 100, N'Done', N'Cash', 75, 0, 5300, CAST(N'2022-08-26T16:51:19.000' AS DateTime), 3, NULL, NULL)
INSERT [dbo].[tbl_vehicle_account] ([account_id], [open_balance], [payment_type], [payment_amount], [payment_status], [payment_method], [vehicle_id], [fleet_id], [close_balance], [created_at], [created_by], [updated_at], [updated_by]) VALUES (31, 5300, N'recharge', 100, N'Done', N'Cash', 75, 0, 5400, CAST(N'2022-08-26T16:51:35.000' AS DateTime), 3, NULL, NULL)
INSERT [dbo].[tbl_vehicle_account] ([account_id], [open_balance], [payment_type], [payment_amount], [payment_status], [payment_method], [vehicle_id], [fleet_id], [close_balance], [created_at], [created_by], [updated_at], [updated_by]) VALUES (32, 5400, N'recharge', 100, N'Done', N'Cash', 75, 0, 5500, CAST(N'2022-08-26T16:52:14.000' AS DateTime), 3, NULL, NULL)
INSERT [dbo].[tbl_vehicle_account] ([account_id], [open_balance], [payment_type], [payment_amount], [payment_status], [payment_method], [vehicle_id], [fleet_id], [close_balance], [created_at], [created_by], [updated_at], [updated_by]) VALUES (33, 5500, N'recharge', 1000, N'Done', N'1', 75, 0, 6500, CAST(N'2022-08-30T16:12:52.000' AS DateTime), 3, NULL, NULL)
INSERT [dbo].[tbl_vehicle_account] ([account_id], [open_balance], [payment_type], [payment_amount], [payment_status], [payment_method], [vehicle_id], [fleet_id], [close_balance], [created_at], [created_by], [updated_at], [updated_by]) VALUES (34, 6500, N'recharge', 2000, N'Done', N'2', 75, 0, 8500, CAST(N'2022-08-30T16:16:18.000' AS DateTime), 3, NULL, NULL)
INSERT [dbo].[tbl_vehicle_account] ([account_id], [open_balance], [payment_type], [payment_amount], [payment_status], [payment_method], [vehicle_id], [fleet_id], [close_balance], [created_at], [created_by], [updated_at], [updated_by]) VALUES (35, 8500, N'recharge', 200, N'Done', N'2', 75, 0, 8700, CAST(N'2022-08-30T16:18:09.000' AS DateTime), 3, NULL, NULL)
INSERT [dbo].[tbl_vehicle_account] ([account_id], [open_balance], [payment_type], [payment_amount], [payment_status], [payment_method], [vehicle_id], [fleet_id], [close_balance], [created_at], [created_by], [updated_at], [updated_by]) VALUES (36, 8700, N'recharge', 1000, N'Done', N'1', 75, 0, 9700, CAST(N'2022-08-30T16:18:27.000' AS DateTime), 3, NULL, NULL)
INSERT [dbo].[tbl_vehicle_account] ([account_id], [open_balance], [payment_type], [payment_amount], [payment_status], [payment_method], [vehicle_id], [fleet_id], [close_balance], [created_at], [created_by], [updated_at], [updated_by]) VALUES (37, 9700, N'recharge', 300, N'Done', N'1', 75, 0, 10000, CAST(N'2022-08-30T16:20:59.000' AS DateTime), 3, NULL, NULL)
INSERT [dbo].[tbl_vehicle_account] ([account_id], [open_balance], [payment_type], [payment_amount], [payment_status], [payment_method], [vehicle_id], [fleet_id], [close_balance], [created_at], [created_by], [updated_at], [updated_by]) VALUES (38, 10000, N'recharge', 200, N'Done', N'', 75, 0, 10200, CAST(N'2022-08-30T16:22:24.000' AS DateTime), 3, NULL, NULL)
INSERT [dbo].[tbl_vehicle_account] ([account_id], [open_balance], [payment_type], [payment_amount], [payment_status], [payment_method], [vehicle_id], [fleet_id], [close_balance], [created_at], [created_by], [updated_at], [updated_by]) VALUES (39, 10200, N'recharge', 300, N'Done', N'1', 75, 0, 10500, CAST(N'2022-08-30T16:23:07.000' AS DateTime), 3, NULL, NULL)
INSERT [dbo].[tbl_vehicle_account] ([account_id], [open_balance], [payment_type], [payment_amount], [payment_status], [payment_method], [vehicle_id], [fleet_id], [close_balance], [created_at], [created_by], [updated_at], [updated_by]) VALUES (40, 10500, N'recharge', 5000, N'Done', N'1', 75, 0, 15500, CAST(N'2022-08-30T16:23:14.000' AS DateTime), 3, NULL, NULL)
INSERT [dbo].[tbl_vehicle_account] ([account_id], [open_balance], [payment_type], [payment_amount], [payment_status], [payment_method], [vehicle_id], [fleet_id], [close_balance], [created_at], [created_by], [updated_at], [updated_by]) VALUES (41, 15500, N'recharge', 5000, N'Done', N'1', 75, 0, 20500, CAST(N'2022-08-30T16:23:32.000' AS DateTime), 3, NULL, NULL)
INSERT [dbo].[tbl_vehicle_account] ([account_id], [open_balance], [payment_type], [payment_amount], [payment_status], [payment_method], [vehicle_id], [fleet_id], [close_balance], [created_at], [created_by], [updated_at], [updated_by]) VALUES (42, 0, N'recharge', 200, N'Done', N'1', 76, 0, 200, CAST(N'2022-08-30T16:25:24.000' AS DateTime), 3, NULL, NULL)
INSERT [dbo].[tbl_vehicle_account] ([account_id], [open_balance], [payment_type], [payment_amount], [payment_status], [payment_method], [vehicle_id], [fleet_id], [close_balance], [created_at], [created_by], [updated_at], [updated_by]) VALUES (43, 200, N'recharge', 6000, N'Done', N'', 76, 0, 6200, CAST(N'2022-08-30T16:25:32.000' AS DateTime), 3, NULL, NULL)
INSERT [dbo].[tbl_vehicle_account] ([account_id], [open_balance], [payment_type], [payment_amount], [payment_status], [payment_method], [vehicle_id], [fleet_id], [close_balance], [created_at], [created_by], [updated_at], [updated_by]) VALUES (44, 6200, N'recharge', 500, N'Done', N'', 76, 0, 6700, CAST(N'2022-08-30T16:26:01.000' AS DateTime), 3, NULL, NULL)
INSERT [dbo].[tbl_vehicle_account] ([account_id], [open_balance], [payment_type], [payment_amount], [payment_status], [payment_method], [vehicle_id], [fleet_id], [close_balance], [created_at], [created_by], [updated_at], [updated_by]) VALUES (45, 6700, N'recharge', 600, N'Done', N'1', 76, 0, 7300, CAST(N'2022-08-30T16:26:06.000' AS DateTime), 3, NULL, NULL)
INSERT [dbo].[tbl_vehicle_account] ([account_id], [open_balance], [payment_type], [payment_amount], [payment_status], [payment_method], [vehicle_id], [fleet_id], [close_balance], [created_at], [created_by], [updated_at], [updated_by]) VALUES (46, 20500, N'recharge', 20, N'Done', N'1', 75, 0, 20520, CAST(N'2022-08-30T16:27:59.000' AS DateTime), 3, NULL, NULL)
INSERT [dbo].[tbl_vehicle_account] ([account_id], [open_balance], [payment_type], [payment_amount], [payment_status], [payment_method], [vehicle_id], [fleet_id], [close_balance], [created_at], [created_by], [updated_at], [updated_by]) VALUES (47, 7300, N'recharge', 300, N'Done', N'1', 76, 0, 7600, CAST(N'2022-08-30T16:35:10.000' AS DateTime), 3, NULL, NULL)
INSERT [dbo].[tbl_vehicle_account] ([account_id], [open_balance], [payment_type], [payment_amount], [payment_status], [payment_method], [vehicle_id], [fleet_id], [close_balance], [created_at], [created_by], [updated_at], [updated_by]) VALUES (48, 7600, N'recharge', 300, N'Done', N'1', 76, 0, 7900, CAST(N'2022-08-30T16:39:29.000' AS DateTime), 3, NULL, NULL)
INSERT [dbo].[tbl_vehicle_account] ([account_id], [open_balance], [payment_type], [payment_amount], [payment_status], [payment_method], [vehicle_id], [fleet_id], [close_balance], [created_at], [created_by], [updated_at], [updated_by]) VALUES (49, 20520, N'recharge', 200, N'Done', N'1', 75, 0, 20720, CAST(N'2022-08-30T16:39:37.000' AS DateTime), 3, NULL, NULL)
INSERT [dbo].[tbl_vehicle_account] ([account_id], [open_balance], [payment_type], [payment_amount], [payment_status], [payment_method], [vehicle_id], [fleet_id], [close_balance], [created_at], [created_by], [updated_at], [updated_by]) VALUES (50, 6900, N'recharge', 100, N'Done', N'2', 57, 0, 7000, CAST(N'2022-08-30T17:29:52.000' AS DateTime), 3, NULL, NULL)
INSERT [dbo].[tbl_vehicle_account] ([account_id], [open_balance], [payment_type], [payment_amount], [payment_status], [payment_method], [vehicle_id], [fleet_id], [close_balance], [created_at], [created_by], [updated_at], [updated_by]) VALUES (51, 0, N'recharge', 20, N'Done', N'', 77, 0, 20, CAST(N'2022-08-30T17:39:24.000' AS DateTime), 3, NULL, NULL)
INSERT [dbo].[tbl_vehicle_account] ([account_id], [open_balance], [payment_type], [payment_amount], [payment_status], [payment_method], [vehicle_id], [fleet_id], [close_balance], [created_at], [created_by], [updated_at], [updated_by]) VALUES (52, 0, N'recharge', 300, N'Done', N'', 78, 0, 300, CAST(N'2022-08-30T17:39:37.000' AS DateTime), 3, NULL, NULL)
INSERT [dbo].[tbl_vehicle_account] ([account_id], [open_balance], [payment_type], [payment_amount], [payment_status], [payment_method], [vehicle_id], [fleet_id], [close_balance], [created_at], [created_by], [updated_at], [updated_by]) VALUES (53, 300, N'recharge', 2000, N'Done', N'', 78, 0, 2300, CAST(N'2022-08-30T17:39:51.000' AS DateTime), 3, NULL, NULL)
INSERT [dbo].[tbl_vehicle_account] ([account_id], [open_balance], [payment_type], [payment_amount], [payment_status], [payment_method], [vehicle_id], [fleet_id], [close_balance], [created_at], [created_by], [updated_at], [updated_by]) VALUES (54, 2300, N'recharge', 200, N'Done', N'', 78, 0, 2500, CAST(N'2022-08-30T17:54:01.000' AS DateTime), 3, NULL, NULL)
INSERT [dbo].[tbl_vehicle_account] ([account_id], [open_balance], [payment_type], [payment_amount], [payment_status], [payment_method], [vehicle_id], [fleet_id], [close_balance], [created_at], [created_by], [updated_at], [updated_by]) VALUES (55, 20720, N'recharge', 300, N'Done', N'1', 75, 0, 21020, CAST(N'2022-08-31T15:06:53.000' AS DateTime), 3, NULL, NULL)
INSERT [dbo].[tbl_vehicle_account] ([account_id], [open_balance], [payment_type], [payment_amount], [payment_status], [payment_method], [vehicle_id], [fleet_id], [close_balance], [created_at], [created_by], [updated_at], [updated_by]) VALUES (56, 4700, N'recharge', 700, N'Done', N'Cash', 0, 57, 5400, CAST(N'2022-09-05T12:51:10.000' AS DateTime), 1, NULL, NULL)
SET IDENTITY_INSERT [dbo].[tbl_vehicle_account] OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_vehicle_mtag_rel] ON 

INSERT [dbo].[tbl_vehicle_mtag_rel] ([id], [vehicle_id], [mtag_token]) VALUES (1, 3, N'689b38307CAE0FFe94f88C87')
INSERT [dbo].[tbl_vehicle_mtag_rel] ([id], [vehicle_id], [mtag_token]) VALUES (2, 3, N'689b38307CAE0FFe94f88C87')
INSERT [dbo].[tbl_vehicle_mtag_rel] ([id], [vehicle_id], [mtag_token]) VALUES (3, 0, N'027166dE3f2993A76e31A8DC')
INSERT [dbo].[tbl_vehicle_mtag_rel] ([id], [vehicle_id], [mtag_token]) VALUES (4, 0, N'027166dE3f2993A76e31A8DC')
INSERT [dbo].[tbl_vehicle_mtag_rel] ([id], [vehicle_id], [mtag_token]) VALUES (5, 0, N'027166dE3f2993A76e31A8DC')
INSERT [dbo].[tbl_vehicle_mtag_rel] ([id], [vehicle_id], [mtag_token]) VALUES (6, 0, N'027166dE3f2993A76e31A8DC')
INSERT [dbo].[tbl_vehicle_mtag_rel] ([id], [vehicle_id], [mtag_token]) VALUES (7, 0, N'027166dE3f2993A76e31A8DC')
INSERT [dbo].[tbl_vehicle_mtag_rel] ([id], [vehicle_id], [mtag_token]) VALUES (8, 2, N'45465465465465')
INSERT [dbo].[tbl_vehicle_mtag_rel] ([id], [vehicle_id], [mtag_token]) VALUES (9, 10, N'b564D92AA97B9bd0bC069E5E')
SET IDENTITY_INSERT [dbo].[tbl_vehicle_mtag_rel] OFF
GO
ALTER TABLE [dbo].[tbl_admin_menu] ADD  CONSTRAINT [DF_tbl_admin_menu_parent_menu_id]  DEFAULT ((0)) FOR [parent_menu_id]
GO
