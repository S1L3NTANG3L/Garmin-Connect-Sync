USE [Garmin Connect]
GO

/****** Object:  Table [dbo].[monitoring_rr]    Script Date: 2025/03/02 19:20:55 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[monitoring_rr](
	[timestamp] [datetime] NOT NULL,
	[rr] [float] NULL,
 CONSTRAINT [PK_monitoring_rr] PRIMARY KEY CLUSTERED 
(
	[timestamp] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

