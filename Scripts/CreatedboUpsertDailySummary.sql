USE [Garmin Connect]
GO

/****** Object:  StoredProcedure [dbo].[UpsertDailySummary]    Script Date: 2025/03/02 19:22:35 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[UpsertDailySummary]
    @day DATE,
    @hr_min FLOAT = NULL,
    @hr_max FLOAT = NULL,
    @rhr FLOAT = NULL,
    @stress_avg FLOAT = NULL,
    @step_goal FLOAT = NULL,
    @steps FLOAT = NULL,
    @moderate_activity_time TIME(7) = NULL,
    @vigorous_activity_time TIME(7) = NULL,
    @intensity_time_goal TIME(7) = NULL,
    @floors_up FLOAT = NULL,
    @floors_down FLOAT = NULL,
    @floors_goal FLOAT = NULL,
    @distance FLOAT = NULL,
    @calories_goal FLOAT = NULL,
    @calories_total FLOAT = NULL,
    @calories_bmr FLOAT = NULL,
    @calories_active FLOAT = NULL,
    @calories_consumed FLOAT = NULL,
    @hydration_goal FLOAT = NULL,
    @hydration_intake FLOAT = NULL,
    @sweat_loss FLOAT = NULL,
    @spo2_avg FLOAT = NULL,
    @spo2_min FLOAT = NULL,
    @rr_waking_avg FLOAT = NULL,
    @rr_max FLOAT = NULL,
    @rr_min FLOAT = NULL,
    @bb_charged FLOAT = NULL,
    @bb_max FLOAT = NULL,
    @bb_min FLOAT = NULL,
    @description VARCHAR(MAX) = NULL
AS
BEGIN
    SET NOCOUNT ON;

    MERGE INTO [dbo].[daily_summary] AS [target]
    USING (SELECT 
              @day AS [day], 
              @hr_min AS [hr_min], 
              @hr_max AS [hr_max], 
              @rhr AS [rhr], 
              @stress_avg AS [stress_avg], 
              @step_goal AS [step_goal], 
              @steps AS [steps], 
              @moderate_activity_time AS [moderate_activity_time], 
              @vigorous_activity_time AS [vigorous_activity_time], 
              @intensity_time_goal AS [intensity_time_goal], 
              @floors_up AS [floors_up], 
              @floors_down AS [floors_down], 
              @floors_goal AS [floors_goal], 
              @distance AS [distance], 
              @calories_goal AS [calories_goal], 
              @calories_total AS [calories_total], 
              @calories_bmr AS [calories_bmr], 
              @calories_active AS [calories_active], 
              @calories_consumed AS [calories_consumed], 
              @hydration_goal AS [hydration_goal], 
              @hydration_intake AS [hydration_intake], 
              @sweat_loss AS [sweat_loss], 
              @spo2_avg AS [spo2_avg], 
              @spo2_min AS [spo2_min], 
              @rr_waking_avg AS [rr_waking_avg], 
              @rr_max AS [rr_max], 
              @rr_min AS [rr_min], 
              @bb_charged AS [bb_charged], 
              @bb_max AS [bb_max], 
              @bb_min AS [bb_min], 
              @description AS [description]
           ) AS [source]
    ON [target].[day] = [source].[day]
    WHEN MATCHED THEN
        UPDATE SET 
            [target].[hr_min] = [source].[hr_min],
            [target].[hr_max] = [source].[hr_max],
            [target].[rhr] = [source].[rhr],
            [target].[stress_avg] = [source].[stress_avg],
            [target].[step_goal] = [source].[step_goal],
            [target].[steps] = [source].[steps],
            [target].[moderate_activity_time] = [source].[moderate_activity_time],
            [target].[vigorous_activity_time] = [source].[vigorous_activity_time],
            [target].[intensity_time_goal] = [source].[intensity_time_goal],
            [target].[floors_up] = [source].[floors_up],
            [target].[floors_down] = [source].[floors_down],
            [target].[floors_goal] = [source].[floors_goal],
            [target].[distance] = [source].[distance],
            [target].[calories_goal] = [source].[calories_goal],
            [target].[calories_total] = [source].[calories_total],
            [target].[calories_bmr] = [source].[calories_bmr],
            [target].[calories_active] = [source].[calories_active],
            [target].[calories_consumed] = [source].[calories_consumed],
            [target].[hydration_goal] = [source].[hydration_goal],
            [target].[hydration_intake] = [source].[hydration_intake],
            [target].[sweat_loss] = [source].[sweat_loss],
            [target].[spo2_avg] = [source].[spo2_avg],
            [target].[spo2_min] = [source].[spo2_min],
            [target].[rr_waking_avg] = [source].[rr_waking_avg],
            [target].[rr_max] = [source].[rr_max],
            [target].[rr_min] = [source].[rr_min],
            [target].[bb_charged] = [source].[bb_charged],
            [target].[bb_max] = [source].[bb_max],
            [target].[bb_min] = [source].[bb_min],
            [target].[description] = [source].[description]
    WHEN NOT MATCHED THEN
        INSERT ([day], [hr_min], [hr_max], [rhr], [stress_avg], [step_goal], [steps], 
                [moderate_activity_time], [vigorous_activity_time], [intensity_time_goal], 
                [floors_up], [floors_down], [floors_goal], [distance], [calories_goal], 
                [calories_total], [calories_bmr], [calories_active], [calories_consumed], 
                [hydration_goal], [hydration_intake], [sweat_loss], [spo2_avg], [spo2_min], 
                [rr_waking_avg], [rr_max], [rr_min], [bb_charged], [bb_max], [bb_min], [description])
        VALUES ([source].[day], [source].[hr_min], [source].[hr_max], [source].[rhr], 
                [source].[stress_avg], [source].[step_goal], [source].[steps], 
                [source].[moderate_activity_time], [source].[vigorous_activity_time], [source].[intensity_time_goal], 
                [source].[floors_up], [source].[floors_down], [source].[floors_goal], [source].[distance], 
                [source].[calories_goal], [source].[calories_total], [source].[calories_bmr], 
                [source].[calories_active], [source].[calories_consumed], [source].[hydration_goal], 
                [source].[hydration_intake], [source].[sweat_loss], [source].[spo2_avg], [source].[spo2_min], 
                [source].[rr_waking_avg], [source].[rr_max], [source].[rr_min], [source].[bb_charged], 
                [source].[bb_max], [source].[bb_min], [source].[description]);
END;
GO

