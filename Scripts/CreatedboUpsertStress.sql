USE [Garmin Connect]
GO

/****** Object:  StoredProcedure [dbo].[UpsertStress]    Script Date: 2025/03/02 19:24:53 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[UpsertStress]
    @timestamp DATETIME,
    @stress float
AS
BEGIN
    SET NOCOUNT ON;

    MERGE INTO [dbo].[stress] AS target
    USING (SELECT @timestamp AS [timestamp], @stress AS [stress]) AS source
    ON target.[timestamp] = source.[timestamp]
    WHEN MATCHED THEN
        UPDATE SET target.[stress] = source.[stress]
    WHEN NOT MATCHED THEN
        INSERT ([timestamp], [stress])
        VALUES (source.[timestamp], source.[stress]);
END;
GO

