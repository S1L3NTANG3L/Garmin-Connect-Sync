USE [Garmin Connect]
GO

/****** Object:  StoredProcedure [dbo].[UpsertMonitoringHR]    Script Date: 2025/03/02 19:23:05 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[UpsertMonitoringHR]
    @timestamp DATETIME,
    @heart_rate float = NULL
AS
BEGIN
    SET NOCOUNT ON;

    MERGE INTO [dbo].[monitoring_hr] AS [target]
    USING (SELECT @timestamp AS [timestamp], @heart_rate AS [heart_rate]) AS [source]
    ON [target].[timestamp] = [source].[timestamp]
    WHEN MATCHED THEN
        UPDATE SET 
            [target].[heart_rate] = [source].[heart_rate]
    WHEN NOT MATCHED THEN
        INSERT ([timestamp], [heart_rate])
        VALUES ([source].[timestamp], [source].[heart_rate]);
END;

GO

