USE [Garmin Connect]
GO

/****** Object:  Table [dbo].[resting_hr]    Script Date: 2025/03/02 19:21:12 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[resting_hr](
	[day] [date] NOT NULL,
	[resting_heart_rate] [float] NULL,
 CONSTRAINT [PK_resting_hr] PRIMARY KEY CLUSTERED 
(
	[day] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

