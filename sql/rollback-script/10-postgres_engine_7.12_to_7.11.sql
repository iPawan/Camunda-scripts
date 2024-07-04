-- ############################################################################################################
--- Drop the created indexes
drop index if exists ACT_IDX_HI_DETAIL_VAR_INST_ID;

-- Delete columns
ALTER TABLE ACT_HI_INCIDENT
  DROP COLUMN HISTORY_CONFIGURATION_;

ALTER TABLE ACT_RU_JOB
  DROP COLUMN REPEAT_OFFSET_;

ALTER TABLE ACT_HI_OP_LOG
  DROP COLUMN ANNOTATION_;

-- Delete the version entry
delete from ACT_GE_SCHEMA_LOG where VERSION_ = '7.12.0';




