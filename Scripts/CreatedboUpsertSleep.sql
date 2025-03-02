USE [Garmin Connect]
GO

/****** Object:  StoredProcedure [dbo].[UpsertSleep]    Script Date: 2025/03/02 19:24:12 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[UpsertSleep]
    @day DATE,
    @start DATETIME = NULL,
    @end DATETIME = NULL,
    @total_sleep TIME(7) = NULL,
    @deep_sleep TIME(7) = NULL,
    @light_sleep TIME(7) = NULL,
    @rem_sleep TIME(7) = NULL,
    @awake TIME(7) = NULL,
    @avg_spo2 FLOAT = NULL,
    @avg_rr FLOAT = NULL,
    @avg_stress FLOAT = NULL,
    @score FLOAT = NULL,
    @qualifier FLOAT = NULL
AS
BEGIN
    SET NOCOUNT ON;

    MERGE INTO [dbo].[sleep] AS [target]
    USING (SELECT 
              @day AS [day], 
              @start AS [start], 
              @end AS [end], 
              @total_sleep AS [total_sleep], 
              @deep_sleep AS [deep_sleep], 
              @light_sleep AS [light_sleep], 
              @rem_sleep AS [rem_sleep], 
              @awake AS [awake], 
              @avg_spo2 AS [avg_spo2], 
              @avg_rr AS [avg_rr], 
              @avg_stress AS [avg_stress], 
              @score AS [score], 
              @qualifier AS [qualifier]
           ) AS [source]
    ON [target].[day] = [source].[day]
    WHEN MATCHED THEN
        UPDATE SET 
            [target].[start] = [source].[start],
            [target].[end] = [source].[end],
            [target].[total_sleep] = [source].[total_sleep],
            [target].[deep_sleep] = [source].[deep_sleep],
            [target].[light_sleep] = [source].[light_sleep],
            [target].[rem_sleep] = [source].[rem_sleep],
            [target].[awake] = [source].[awake],
            [target].[avg_spo2] = [source].[avg_spo2],
            [target].[avg_rr] = [source].[avg_rr],
            [target].[avg_stress] = [source].[avg_stress],
            [target].[score] = [source].[score],
            [target].[qualifier] = [source].[qualifier]
    WHEN NOT MATCHED THEN
        INSERT ([day], [start], [end], [total_sleep], [deep_sleep], [light_sleep], [rem_sleep], [awake], 
                [avg_spo2], [avg_rr], [avg_stress], [score], [qualifier])
        VALUES ([source].[day], [source].[start], [source].[end], [source].[total_sleep], [source].[deep_sleep], 
                [source].[light_sleep], [source].[rem_sleep], [source].[awake], [source].[avg_spo2], 
                [source].[avg_rr], [source].[avg_stress], [source].[score], [source].[qualifier]);
END;
GO

