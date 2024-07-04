
-- ############################################################################################################
-- Drop columns
ALTER TABLE ACT_HI_INCIDENT
  DROP COLUMN ANNOTATION_;

ALTER TABLE ACT_RU_INCIDENT
  DROP COLUMN ANNOTATION_;

--- Drop the created indexes
drop index if exists ACT_IDX_TASK_METER_LOG_TIME;

-- Drop the table
drop table if exists ACT_RU_TASK_METER_LOG;

-- Delete the version entry
delete from ACT_GE_SCHEMA_LOG where VERSION_ = '7.15.0';