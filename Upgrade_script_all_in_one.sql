----------------------------------------------------------------------------------------------------
-- 7.10 -> 7.11
----------------------------------------------------------------------------------------------------
-- https://app.camunda.com/jira/browse/CAM-9920
ALTER TABLE ACT_HI_OP_LOG
  ADD CATEGORY_ varchar(64);
  
ALTER TABLE ACT_HI_OP_LOG  
  ADD EXTERNAL_TASK_ID_ varchar(64);
  
create table ACT_GE_SCHEMA_LOG (
    ID_ varchar(64),
    TIMESTAMP_ timestamp,
    VERSION_ varchar(255),
    primary key (ID_)
);

insert into ACT_GE_SCHEMA_LOG
values ('0', CURRENT_TIMESTAMP, '7.11.0');

-- https://app.camunda.com/jira/browse/CAM-10129
create index ACT_IDX_HI_OP_LOG_USER_ID on ACT_HI_OP_LOG(USER_ID_);
create index ACT_IDX_HI_OP_LOG_OP_TYPE on ACT_HI_OP_LOG(OPERATION_TYPE_);
create index ACT_IDX_HI_OP_LOG_ENTITY_TYPE on ACT_HI_OP_LOG(ENTITY_TYPE_);

----------------------------------------------------------------------------------------------------
-- 7.11 -> 7.12
----------------------------------------------------------------------------------------------------
insert into ACT_GE_SCHEMA_LOG
values ('100', CURRENT_TIMESTAMP, '7.12.0');

-- https://app.camunda.com/jira/browse/CAM-10665
ALTER TABLE ACT_HI_OP_LOG
  ADD ANNOTATION_ varchar(4000);

-- https://app.camunda.com/jira/browse/CAM-9855
ALTER TABLE ACT_RU_JOB
  ADD REPEAT_OFFSET_ bigint default 0;

-- https://app.camunda.com/jira/browse/CAM-10672
ALTER TABLE ACT_HI_INCIDENT
  ADD HISTORY_CONFIGURATION_ varchar(255);

-- https://app.camunda.com/jira/browse/CAM-10600
create index ACT_IDX_HI_DETAIL_VAR_INST_ID on ACT_HI_DETAIL(VAR_INST_ID_);

----------------------------------------------------------------------------------------------------
-- 7.12 -> 7.13
----------------------------------------------------------------------------------------------------
insert into ACT_GE_SCHEMA_LOG
values ('200', CURRENT_TIMESTAMP, '7.13.0');

-- https://jira.camunda.com/browse/CAM-10953
create index ACT_IDX_HI_VAR_PI_NAME_TYPE on ACT_HI_VARINST(PROC_INST_ID_, NAME_, VAR_TYPE_);


-- https://app.camunda.com/jira/browse/CAM-10784
ALTER TABLE ACT_HI_JOB_LOG
  ADD HOSTNAME_ varchar(255) default null;

-- https://jira.camunda.com/browse/CAM-10378
ALTER TABLE ACT_RU_JOB
  ADD FAILED_ACT_ID_ varchar(255);

ALTER TABLE ACT_HI_JOB_LOG
  ADD FAILED_ACT_ID_ varchar(255);

ALTER TABLE ACT_RU_INCIDENT
  ADD FAILED_ACTIVITY_ID_ varchar(255);

ALTER TABLE ACT_HI_INCIDENT
  ADD FAILED_ACTIVITY_ID_ varchar(255);

-- https://jira.camunda.com/browse/CAM-11616
ALTER TABLE ACT_RU_AUTHORIZATION
  ADD REMOVAL_TIME_ timestamp;
create index ACT_IDX_AUTH_RM_TIME on ACT_RU_AUTHORIZATION(REMOVAL_TIME_);

-- https://jira.camunda.com/browse/CAM-11616
ALTER TABLE ACT_RU_AUTHORIZATION
  ADD ROOT_PROC_INST_ID_ varchar(64);
create index ACT_IDX_AUTH_ROOT_PI on ACT_RU_AUTHORIZATION(ROOT_PROC_INST_ID_);

-- https://jira.camunda.com/browse/CAM-11188
ALTER TABLE ACT_RU_JOBDEF
  ADD DEPLOYMENT_ID_ varchar(64);


-- https://jira.camunda.com/browse/CAM-10978

ALTER TABLE ACT_RU_VARIABLE
  ADD PROC_DEF_ID_ varchar(64);

ALTER TABLE ACT_HI_DETAIL
  ADD INITIAL_ boolean;

----------------------------------------------------------------------------------------------------
-- 7.13 -> 7.14
----------------------------------------------------------------------------------------------------
insert into ACT_GE_SCHEMA_LOG
values ('300', CURRENT_TIMESTAMP, '7.14.0');

-- https://jira.camunda.com/browse/CAM-12304
ALTER TABLE ACT_RU_VARIABLE
  ADD BATCH_ID_ varchar(64);
CREATE INDEX ACT_IDX_BATCH_ID ON ACT_RU_VARIABLE(BATCH_ID_);
ALTER TABLE ACT_RU_VARIABLE
    ADD CONSTRAINT ACT_FK_VAR_BATCH
    FOREIGN KEY (BATCH_ID_)
    REFERENCES ACT_RU_BATCH (ID_);
    
-- https://jira.camunda.com/browse/CAM-12411
create index ACT_IDX_VARIABLE_TASK_NAME_TYPE on ACT_RU_VARIABLE(TASK_ID_, NAME_, TYPE_);

----------------------------------------------------------------------------------------------------
-- 7.14 -> 7.15
----------------------------------------------------------------------------------------------------
insert into ACT_GE_SCHEMA_LOG
values ('400', CURRENT_TIMESTAMP, '7.15.0');

-- https://jira.camunda.com/browse/CAM-13013

create table ACT_RU_TASK_METER_LOG (
  ID_ varchar(64) not null,
  ASSIGNEE_HASH_ bigint,
  TIMESTAMP_ timestamp,
  primary key (ID_)
);

create index ACT_IDX_TASK_METER_LOG_TIME on ACT_RU_TASK_METER_LOG(TIMESTAMP_);

-- https://jira.camunda.com/browse/CAM-13060
ALTER TABLE ACT_RU_INCIDENT
  ADD ANNOTATION_ varchar(4000);

ALTER TABLE ACT_HI_INCIDENT
  ADD ANNOTATION_ varchar(4000);

----------------------------------------------------------------------------------------------------
-- 7.15 -> 7.16
----------------------------------------------------------------------------------------------------
insert into ACT_GE_SCHEMA_LOG
values ('500', CURRENT_TIMESTAMP, '7.16.0');

create table ACT_RE_CAMFORMDEF (
    ID_ varchar(64) NOT NULL,
    REV_ integer,
    KEY_ varchar(255) NOT NULL,
    VERSION_ integer NOT NULL,
    DEPLOYMENT_ID_ varchar(64),
    RESOURCE_NAME_ varchar(4000),
    TENANT_ID_ varchar(64),
    primary key (ID_)
);

----------------------------------------------------------------------------------------------------
-- 7.16 -> 7.17
----------------------------------------------------------------------------------------------------

insert into ACT_GE_SCHEMA_LOG
values ('600', CURRENT_TIMESTAMP, '7.17.0');

-- https://jira.camunda.com/browse/CAM-14006 --
ALTER TABLE ACT_RU_JOB 
  ADD COLUMN LAST_FAILURE_LOG_ID_ varchar(64);
  
ALTER TABLE ACT_RU_EXT_TASK 
  ADD COLUMN LAST_FAILURE_LOG_ID_ varchar(64);

create index ACT_IDX_HI_VARINST_NAME on ACT_HI_VARINST(NAME_);
create index ACT_IDX_HI_VARINST_ACT_INST_ID on ACT_HI_VARINST(ACT_INST_ID_);

----------------------------------------------------------------------------------------------------
-- 7.17 -> 7.18
----------------------------------------------------------------------------------------------------
insert into ACT_GE_SCHEMA_LOG
values ('700', CURRENT_TIMESTAMP, '7.18.0');

-- https://jira.camunda.com/browse/CAM-14303 --
ALTER TABLE ACT_RU_TASK
  ADD COLUMN LAST_UPDATED_ timestamp;
create index ACT_IDX_TASK_LAST_UPDATED on ACT_RU_TASK(LAST_UPDATED_);

-- https://jira.camunda.com/browse/CAM-14721
ALTER TABLE ACT_RU_BATCH
    ADD COLUMN START_TIME_ timestamp;

-- https://jira.camunda.com/browse/CAM-14722
ALTER TABLE ACT_RU_BATCH
    ADD COLUMN EXEC_START_TIME_ timestamp;
ALTER TABLE ACT_HI_BATCH
    ADD COLUMN EXEC_START_TIME_ timestamp;

----------------------------------------------------------------------------------------------------
-- 7.18 -> 7.19
----------------------------------------------------------------------------------------------------
insert into ACT_GE_SCHEMA_LOG
values ('800', CURRENT_TIMESTAMP, '7.19.0');

----------------------------------------------------------------------------------------------------
-- 7.19 -> 7.20
----------------------------------------------------------------------------------------------------
insert into ACT_GE_SCHEMA_LOG
values ('900', CURRENT_TIMESTAMP, '7.20.0');

----------------------------------------------------------------------------------------------------
-- 7.20 -> 7.21
----------------------------------------------------------------------------------------------------
insert into ACT_GE_SCHEMA_LOG
values ('1000', CURRENT_TIMESTAMP, '7.21.0');

alter table ACT_RU_EXT_TASK
  add column CREATE_TIME_ timestamp;

alter table ACT_RU_JOB
  add column ROOT_PROC_INST_ID_ varchar(64);

create index ACT_IDX_JOB_ROOT_PROCINST on ACT_RU_JOB(ROOT_PROC_INST_ID_);