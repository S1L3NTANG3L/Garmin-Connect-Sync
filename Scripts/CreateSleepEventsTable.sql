USE [Garmin Connect]
GO

/****** Object:  Table [dbo].[sleep_events]    Script Date: 2025/03/02 19:21:42 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[sleep_events](
	[timestamp] [datetime] NOT NULL,
	[event] [varchar](max) NULL,
	[duration] [time](7) NULL,
 CONSTRAINT [PK_sleep_events] PRIMARY KEY CLUSTERED 
(
	[timestamp] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

