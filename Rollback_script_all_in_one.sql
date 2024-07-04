----------------------------------------------------------------------------------------------------
-- 7.21 -> 7.20
----------------------------------------------------------------------------------------------------
-- Drop the created indexes
drop index if exists ACT_IDX_JOB_ROOT_PROCINST;

-- Delete columns
alter table ACT_RU_JOB
  drop column ROOT_PROC_INST_ID_;

alter table ACT_RU_EXT_TASK
  drop column CREATE_TIME_;

-- Delete the version entry
delete from ACT_GE_SCHEMA_LOG where VERSION_ = '7.21.0';

----------------------------------------------------------------------------------------------------
-- 7.20 -> 7.19
----------------------------------------------------------------------------------------------------
-- Delete the version entry
delete from ACT_GE_SCHEMA_LOG where VERSION_ = '7.20.0';

----------------------------------------------------------------------------------------------------
-- 7.19 -> 7.18
----------------------------------------------------------------------------------------------------
-- Delete the version entry
delete from ACT_GE_SCHEMA_LOG where VERSION_ = '7.19.0';

----------------------------------------------------------------------------------------------------
-- 7.18 -> 7.17
----------------------------------------------------------------------------------------------------
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

----------------------------------------------------------------------------------------------------
-- 7.17 -> 7.16
----------------------------------------------------------------------------------------------------
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

----------------------------------------------------------------------------------------------------
-- 7.16 -> 7.15
----------------------------------------------------------------------------------------------------
-- Drop the table
drop table if exists ACT_RE_CAMFORMDEF;

-- Delete the version entry
delete from ACT_GE_SCHEMA_LOG where VERSION_ = '7.16.0';

----------------------------------------------------------------------------------------------------
-- 7.15 -> 7.14
----------------------------------------------------------------------------------------------------
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

----------------------------------------------------------------------------------------------------
-- 7.14 -> 7.13
----------------------------------------------------------------------------------------------------
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

----------------------------------------------------------------------------------------------------
-- 7.13 -> 7.12
----------------------------------------------------------------------------------------------------
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

----------------------------------------------------------------------------------------------------
-- 7.12 -> 7.11
----------------------------------------------------------------------------------------------------
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


----------------------------------------------------------------------------------------------------
-- 7.11 -> 7.10
----------------------------------------------------------------------------------------------------
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
