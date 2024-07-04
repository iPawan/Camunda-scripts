-- ############################################################################################################
--- Drop the created indexes
drop index if exists ACT_IDX_HI_OP_LOG_ENTITY_TYPE;
drop index if exists ACT_IDX_HI_OP_LOG_OP_TYPE;
drop index if exists ACT_IDX_HI_OP_LOG_USER_ID;

-- Delete the version entry
delete from ACT_GE_SCHEMA_LOG where VERSION_ = '7.11.0';

-- drop the table
drop table if exists ACT_GE_SCHEMA_LOG;

-- Remove the colums
ALTER TABLE ACT_HI_OP_LOG
  DROP COLUMN EXTERNAL_TASK_ID_;

ALTER TABLE ACT_HI_OP_LOG
  DROP COLUMN CATEGORY_;
