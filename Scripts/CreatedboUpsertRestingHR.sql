USE [Garmin Connect]
GO

/****** Object:  StoredProcedure [dbo].[UpsertRestingHR]    Script Date: 2025/03/02 19:23:49 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[UpsertRestingHR]
    @day DATE,
    @resting_heart_rate FLOAT = NULL
AS
BEGIN
    SET NOCOUNT ON;

    MERGE INTO [dbo].[resting_hr] AS [target]
    USING (SELECT @day AS [day], @resting_heart_rate AS [resting_heart_rate]) AS [source]
    ON [target].[day] = [source].[day]
    WHEN MATCHED THEN
        UPDATE SET 
            [target].[resting_heart_rate] = [source].[resting_heart_rate]
    WHEN NOT MATCHED THEN
        INSERT ([day], [resting_heart_rate])
        VALUES ([source].[day], [source].[resting_heart_rate]);
END;

GO

