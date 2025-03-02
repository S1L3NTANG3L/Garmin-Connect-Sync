USE [Garmin Connect]
GO

/****** Object:  StoredProcedure [dbo].[UpsertSleepEvent]    Script Date: 2025/03/02 19:24:33 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[UpsertSleepEvent]
    @timestamp DATETIME,
    @event VARCHAR(MAX),
    @duration TIME(7)
AS
BEGIN
    SET NOCOUNT ON;

    MERGE INTO [dbo].[sleep_events] AS target
    USING (SELECT @timestamp AS [timestamp], @event AS [event], @duration AS [duration]) AS source
    ON target.[timestamp] = source.[timestamp]
    WHEN MATCHED THEN
        UPDATE SET target.[event] = source.[event],
                   target.[duration] = source.[duration]
    WHEN NOT MATCHED THEN
        INSERT ([timestamp], [event], [duration])
        VALUES (source.[timestamp], source.[event], source.[duration]);
END;

GO

