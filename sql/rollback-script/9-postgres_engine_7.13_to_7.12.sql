-- ############################################################################################################

-- Drop columns 
ALTER TABLE ACT_HI_DETAIL
  DROP COLUMN INITIAL_;

ALTER TABLE ACT_RU_VARIABLE
  DROP COLUMN PROC_DEF_ID_;

ALTER TABLE ACT_RU_JOBDEF
  DROP COLUMN DEPLOYMENT_ID_;

-- Drop index
drop index if exists ACT_IDX_AUTH_ROOT_PI;

-- Drop columns
ALTER TABLE ACT_RU_AUTHORIZATION
  DROP COLUMN ROOT_PROC_INST_ID_;

-- Drop index
drop index if exists ACT_IDX_AUTH_RM_TIME;

-- Drop columns
ALTER TABLE ACT_RU_AUTHORIZATION
  DROP COLUMN REMOVAL_TIME_;

-- Drop columns
ALTER TABLE ACT_HI_INCIDENT
  DROP COLUMN FAILED_ACTIVITY_ID_;

ALTER TABLE ACT_RU_INCIDENT
  DROP COLUMN FAILED_ACTIVITY_ID_;

ALTER TABLE ACT_HI_JOB_LOG  
  DROP COLUMN FAILED_ACT_ID_;

ALTER TABLE ACT_RU_JOB  
  DROP COLUMN FAILED_ACT_ID_;

ALTER TABLE ACT_HI_JOB_LOG  
  DROP COLUMN HOSTNAME_;

-- Drop index
drop index if exists ACT_IDX_HI_VAR_PI_NAME_TYPE;

-- Delete the version entry
delete from ACT_GE_SCHEMA_LOG where VERSION_ = '7.13.0';