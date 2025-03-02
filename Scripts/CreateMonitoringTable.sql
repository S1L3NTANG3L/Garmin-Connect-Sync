USE [Garmin Connect]
GO

/****** Object:  Table [dbo].[monitoring]    Script Date: 2025/03/02 19:20:27 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[monitoring](
	[timestamp] [datetime] NOT NULL,
	[activity_type] [varchar](max) NULL,
	[intensity] [float] NULL,
	[duration] [time](7) NULL,
	[distance] [float] NULL,
	[cum_active_time] [time](7) NULL,
	[active_calories] [float] NULL,
	[steps] [float] NULL,
	[strokes] [float] NULL,
	[cycles] [float] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

