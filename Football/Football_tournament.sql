USE [Football_tournament]
GO
/****** Object:  Table [dbo].[groups]    Script Date: 1/10/2023 3:05:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[groups](
	[group_id] [int] IDENTITY(1,1) NOT NULL,
	[group_name] [varchar](1) NOT NULL,
 CONSTRAINT [PK__groups__D57795A05C66CA38] PRIMARY KEY CLUSTERED 
(
	[group_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[managers]    Script Date: 1/10/2023 3:05:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[managers](
	[manager_id] [int] IDENTITY(1,1) NOT NULL,
	[manager_name] [varchar](64) NOT NULL,
	[team_id] [int] NULL,
 CONSTRAINT [PK__managers__5A6073FC87360573] PRIMARY KEY CLUSTERED 
(
	[manager_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[matches]    Script Date: 1/10/2023 3:05:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[matches](
	[match_id] [int] IDENTITY(1,1) NOT NULL,
	[team_id_host] [int] NOT NULL,
	[team_id_guest] [int] NOT NULL,
	[goals_host] [int] NOT NULL,
	[goals_guest] [int] NOT NULL,
	[referee_id] [int] NOT NULL,
	[play_date] [datetime] NOT NULL,
	[decided_by] [varchar](1) NOT NULL,
 CONSTRAINT [PK__matches__9D7FCBA378732EBB] PRIMARY KEY CLUSTERED 
(
	[match_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[players]    Script Date: 1/10/2023 3:05:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[players](
	[player_id] [int] IDENTITY(1,1) NOT NULL,
	[team_id] [int] NULL,
	[jersey_number] [int] NULL,
	[player_name] [varchar](40) NOT NULL,
	[player_age] [int] NOT NULL,
 CONSTRAINT [PK__players__44DA120C6AEE3653] PRIMARY KEY CLUSTERED 
(
	[player_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[referees]    Script Date: 1/10/2023 3:05:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[referees](
	[referee_id] [int] IDENTITY(1,1) NOT NULL,
	[referee_name] [varchar](64) NOT NULL,
 CONSTRAINT [PK__referees__28102F7A205BA4C7] PRIMARY KEY CLUSTERED 
(
	[referee_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[teams]    Script Date: 1/10/2023 3:05:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[teams](
	[team_id] [int] IDENTITY(1,1) NOT NULL,
	[team_group] [int] NULL,
	[team_nation] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK__teams__F82DEDBCEF1AC39F] PRIMARY KEY CLUSTERED 
(
	[team_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[groups] ADD  CONSTRAINT [DF__groups__group_na__412EB0B6]  DEFAULT (NULL) FOR [group_name]
GO
ALTER TABLE [dbo].[managers] ADD  CONSTRAINT [DF__managers__manage__3D5E1FD2]  DEFAULT (NULL) FOR [manager_name]
GO
ALTER TABLE [dbo].[managers] ADD  CONSTRAINT [DF__managers__team_i__3E52440B]  DEFAULT (NULL) FOR [team_id]
GO
ALTER TABLE [dbo].[matches] ADD  CONSTRAINT [DF__matches__team_id__300424B4]  DEFAULT (NULL) FOR [team_id_host]
GO
ALTER TABLE [dbo].[matches] ADD  CONSTRAINT [DF__matches__team_id__30F848ED]  DEFAULT (NULL) FOR [team_id_guest]
GO
ALTER TABLE [dbo].[matches] ADD  CONSTRAINT [DF__matches__goals_h__31EC6D26]  DEFAULT (NULL) FOR [goals_host]
GO
ALTER TABLE [dbo].[matches] ADD  CONSTRAINT [DF__matches__goals_g__32E0915F]  DEFAULT (NULL) FOR [goals_guest]
GO
ALTER TABLE [dbo].[matches] ADD  CONSTRAINT [DF__matches__referee__33D4B598]  DEFAULT (NULL) FOR [referee_id]
GO
ALTER TABLE [dbo].[matches] ADD  CONSTRAINT [DF__matches__play_da__34C8D9D1]  DEFAULT (NULL) FOR [play_date]
GO
ALTER TABLE [dbo].[matches] ADD  CONSTRAINT [DF__matches__decided__35BCFE0A]  DEFAULT (NULL) FOR [decided_by]
GO
ALTER TABLE [dbo].[players] ADD  CONSTRAINT [DF__players__team_id__2A4B4B5E]  DEFAULT (NULL) FOR [team_id]
GO
ALTER TABLE [dbo].[players] ADD  CONSTRAINT [DF__players__jersey___2B3F6F97]  DEFAULT (NULL) FOR [jersey_number]
GO
ALTER TABLE [dbo].[players] ADD  CONSTRAINT [DF__players__player___2C3393D0]  DEFAULT (NULL) FOR [player_name]
GO
ALTER TABLE [dbo].[players] ADD  CONSTRAINT [DF__players__player___2D27B809]  DEFAULT (NULL) FOR [player_age]
GO
ALTER TABLE [dbo].[referees] ADD  CONSTRAINT [DF__referees__refere__276EDEB3]  DEFAULT (NULL) FOR [referee_name]
GO
ALTER TABLE [dbo].[teams] ADD  CONSTRAINT [DF__teams__team_grou__24927208]  DEFAULT (NULL) FOR [team_group]
GO
ALTER TABLE [dbo].[managers]  WITH CHECK ADD  CONSTRAINT [FK__managers__team_i__47DBAE45] FOREIGN KEY([team_id])
REFERENCES [dbo].[teams] ([team_id])
GO
ALTER TABLE [dbo].[managers] CHECK CONSTRAINT [FK__managers__team_i__47DBAE45]
GO
ALTER TABLE [dbo].[matches]  WITH CHECK ADD  CONSTRAINT [FK__matches__referee__45F365D3] FOREIGN KEY([referee_id])
REFERENCES [dbo].[referees] ([referee_id])
GO
ALTER TABLE [dbo].[matches] CHECK CONSTRAINT [FK__matches__referee__45F365D3]
GO
ALTER TABLE [dbo].[matches]  WITH CHECK ADD  CONSTRAINT [FK__matches__team_id__440B1D61] FOREIGN KEY([team_id_host])
REFERENCES [dbo].[teams] ([team_id])
GO
ALTER TABLE [dbo].[matches] CHECK CONSTRAINT [FK__matches__team_id__440B1D61]
GO
ALTER TABLE [dbo].[matches]  WITH CHECK ADD  CONSTRAINT [FK__matches__team_id__44FF419A] FOREIGN KEY([team_id_guest])
REFERENCES [dbo].[teams] ([team_id])
GO
ALTER TABLE [dbo].[matches] CHECK CONSTRAINT [FK__matches__team_id__44FF419A]
GO
ALTER TABLE [dbo].[players]  WITH CHECK ADD  CONSTRAINT [FK__players__team_id__4316F928] FOREIGN KEY([team_id])
REFERENCES [dbo].[teams] ([team_id])
GO
ALTER TABLE [dbo].[players] CHECK CONSTRAINT [FK__players__team_id__4316F928]
GO
ALTER TABLE [dbo].[teams]  WITH CHECK ADD  CONSTRAINT [FK__teams__team_grou__4222D4EF] FOREIGN KEY([team_group])
REFERENCES [dbo].[groups] ([group_id])
GO
ALTER TABLE [dbo].[teams] CHECK CONSTRAINT [FK__teams__team_grou__4222D4EF]
GO
/****** Object:  StoredProcedure [dbo].[calculate_points]    Script Date: 1/10/2023 3:05:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[calculate_points]
(@pdate as DATE, @pteam as VARCHAR(50))
AS
SELECT
(
    SELECT COUNT(M.match_id)
    FROM matches as M
    RIGHT OUTER JOIN teams as J
    ON M.play_date <= @pdate AND T.team_nation = J.team_nation 
	AND ((T.team_id = M.team_id_host AND M.goals_host > M.goals_guest) 
	OR (T.team_id = M.team_id_guest AND M.goals_guest > M.goals_host))
)*3 + (
    SELECT COUNT(M.match_id)
    FROM matches as M
    RIGHT OUTER JOIN teams as J
    ON M.play_date <= @pdate AND T.team_nation = J.team_nation 
	AND (M.goals_host = M.goals_guest AND (T.team_id = M.team_id_host 
	OR T.team_id = M.team_id_guest))
) AS [points], T.team_nation
FROM teams as T
WHERE T.team_nation = @pteam;
GO
EXEC sys.sp_addextendedproperty @name=N'IDENTITY_INSERT', @value=N'ON' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'referees'
GO
