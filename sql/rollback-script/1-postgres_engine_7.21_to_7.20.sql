-- ############################################################################################################
-- Drop the created indexes
drop index if exists ACT_IDX_JOB_ROOT_PROCINST;

-- Delete columns
alter table ACT_RU_JOB
  drop column ROOT_PROC_INST_ID_;

alter table ACT_RU_EXT_TASK
  drop column CREATE_TIME_;

-- Delete the version entry
delete from ACT_GE_SCHEMA_LOG where VERSION_ = '7.21.0';