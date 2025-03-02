USE [Garmin Connect]
GO

/****** Object:  Table [dbo].[daily_summary]    Script Date: 2025/03/02 19:20:11 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[daily_summary](
	[day] [date] NOT NULL,
	[hr_min] [float] NULL,
	[hr_max] [float] NULL,
	[rhr] [float] NULL,
	[stress_avg] [float] NULL,
	[step_goal] [float] NULL,
	[steps] [float] NULL,
	[moderate_activity_time] [time](7) NULL,
	[vigorous_activity_time] [time](7) NULL,
	[intensity_time_goal] [time](7) NULL,
	[floors_up] [float] NULL,
	[floors_down] [float] NULL,
	[floors_goal] [float] NULL,
	[distance] [float] NULL,
	[calories_goal] [float] NULL,
	[calories_total] [float] NULL,
	[calories_bmr] [float] NULL,
	[calories_active] [float] NULL,
	[calories_consumed] [float] NULL,
	[hydration_goal] [float] NULL,
	[hydration_intake] [float] NULL,
	[sweat_loss] [float] NULL,
	[spo2_avg] [float] NULL,
	[spo2_min] [float] NULL,
	[rr_waking_avg] [float] NULL,
	[rr_max] [float] NULL,
	[rr_min] [float] NULL,
	[bb_charged] [float] NULL,
	[bb_max] [float] NULL,
	[bb_min] [float] NULL,
	[description] [varchar](max) NULL,
 CONSTRAINT [PK_daily_summary] PRIMARY KEY CLUSTERED 
(
	[day] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

