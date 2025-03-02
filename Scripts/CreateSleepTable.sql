USE [Garmin Connect]
GO

/****** Object:  Table [dbo].[sleep]    Script Date: 2025/03/02 19:21:25 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[sleep](
	[day] [date] NOT NULL,
	[start] [datetime] NULL,
	[end] [datetime] NULL,
	[total_sleep] [time](7) NULL,
	[deep_sleep] [time](7) NULL,
	[light_sleep] [time](7) NULL,
	[rem_sleep] [time](7) NULL,
	[awake] [time](7) NULL,
	[avg_spo2] [float] NULL,
	[avg_rr] [float] NULL,
	[avg_stress] [float] NULL,
	[score] [float] NULL,
	[qualifier] [float] NULL,
 CONSTRAINT [PK_sleep] PRIMARY KEY CLUSTERED 
(
	[day] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

