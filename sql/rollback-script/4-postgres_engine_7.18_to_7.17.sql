
-- ############################################################################################################
--- Drop the columns
ALTER TABLE ACT_HI_BATCH
    DROP COLUMN EXEC_START_TIME;

ALTER TABLE ACT_RU_BATCH
    DROP COLUMN EXEC_START_TIME_;

ALTER TABLE ACT_RU_BATCH
    DROP COLUMN START_TIME_;

-- Drop the indexes
drop index if exists ACT_IDX_TASK_LAST_UPDATED;

-- Delete columns
ALTER TABLE ACT_RU_TASK
  DROP COLUMN LAST_UPDATED_;

-- Delete the version entry
delete from ACT_GE_SCHEMA_LOG where VERSION_ = '7.18.0';