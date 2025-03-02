USE [Garmin Connect]
GO

/****** Object:  StoredProcedure [dbo].[UpsertMonitoringRR]    Script Date: 2025/03/02 19:23:20 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[UpsertMonitoringRR]
    @timestamp DATETIME,
    @rr FLOAT = NULL
AS
BEGIN
    SET NOCOUNT ON;

    MERGE INTO [dbo].[monitoring_rr] AS [target]
    USING (SELECT @timestamp AS [timestamp], @rr AS [rr]) AS [source]
    ON [target].[timestamp] = [source].[timestamp]
    WHEN MATCHED THEN
        UPDATE SET 
            [target].[rr] = [source].[rr]
    WHEN NOT MATCHED THEN
        INSERT ([timestamp], [rr])
        VALUES ([source].[timestamp], [source].[rr]);
END;

GO

