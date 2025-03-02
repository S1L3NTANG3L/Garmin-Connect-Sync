USE [Garmin Connect]
GO

/****** Object:  Table [dbo].[monitoring_hr]    Script Date: 2025/03/02 19:20:39 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[monitoring_hr](
	[timestamp] [datetime] NOT NULL,
	[heart_rate] [float] NULL,
 CONSTRAINT [PK_monitoring_hr] PRIMARY KEY CLUSTERED 
(
	[timestamp] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

