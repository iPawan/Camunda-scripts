-- ############################################################################################################
--- Drop the created indexes
drop index if exists ACT_IDX_HI_VARINST_ACT_INST_ID;
drop index if exists ACT_IDX_HI_VARINST_NAME;

-- Delete columns
ALTER TABLE ACT_RU_EXT_TASK
  DROP COLUMN LAST_FAILURE_LOG_ID_;

ALTER TABLE ACT_RU_JOB
  DROP COLUMN LAST_FAILURE_LOG_ID_;

-- Delete the version entry
delete from ACT_GE_SCHEMA_LOG where VERSION_ = '7.17.0';
