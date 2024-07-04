
-- ############################################################################################################
--- Drop the created indexes
drop index if exists ACT_IDX_VARIABLE_TASK_NAME_TYPE;

-- drop constraints
ALTER TABLE ACT_RU_VARIABLE
  DROP CONSTRAINT ACT_FK_VAR_BATCH;

-- drop indexes
DROP INDEX ACT_IDX_BATCH_ID;

-- Delete columns
ALTER TABLE ACT_RU_VARIABLE
  DROP COLUMN BATCH_ID_;

-- Delete the version entry
delete from ACT_GE_SCHEMA_LOG where VERSION_ = '7.14.0';