USE [Garmin Connect]
GO

/****** Object:  StoredProcedure [dbo].[UpsertMonitoring]    Script Date: 2025/03/02 19:22:51 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[UpsertMonitoring]
    @timestamp DATETIME,
    @activity_type VARCHAR(MAX) = NULL,
    @intensity FLOAT = NULL,
    @duration TIME(7) = NULL,
    @distance FLOAT = NULL,
    @cum_active_time TIME(7) = NULL,
    @active_calories FLOAT = NULL,
    @steps FLOAT = NULL,
    @strokes FLOAT = NULL,
    @cycles FLOAT = NULL
AS
BEGIN
    SET NOCOUNT ON;

    MERGE INTO [dbo].[monitoring] AS [target]
    USING (SELECT 
              @timestamp AS [timestamp], 
              @activity_type AS [activity_type], 
              @intensity AS [intensity], 
              @duration AS [duration], 
              @distance AS [distance], 
              @cum_active_time AS [cum_active_time], 
              @active_calories AS [active_calories], 
              @steps AS [steps], 
              @strokes AS [strokes], 
              @cycles AS [cycles]
           ) AS [source]
    ON [target].[timestamp] = [source].[timestamp]
    WHEN MATCHED THEN
        UPDATE SET 
            [target].[activity_type] = [source].[activity_type],
            [target].[intensity] = [source].[intensity],
            [target].[duration] = [source].[duration],
            [target].[distance] = [source].[distance],
            [target].[cum_active_time] = [source].[cum_active_time],
            [target].[active_calories] = [source].[active_calories],
            [target].[steps] = [source].[steps],
            [target].[strokes] = [source].[strokes],
            [target].[cycles] = [source].[cycles]
    WHEN NOT MATCHED THEN
        INSERT ([timestamp], [activity_type], [intensity], [duration], [distance], [cum_active_time], 
                [active_calories], [steps], [strokes], [cycles])
        VALUES ([source].[timestamp], [source].[activity_type], [source].[intensity], [source].[duration], 
                [source].[distance], [source].[cum_active_time], [source].[active_calories], 
                [source].[steps], [source].[strokes], [source].[cycles]);
END;
GO

