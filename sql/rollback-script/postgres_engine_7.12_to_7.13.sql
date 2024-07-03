--
-- Copyright Camunda Services GmbH and/or licensed to Camunda Services GmbH
-- under one or more contributor license agreements. See the NOTICE file
-- distributed with this work for additional information regarding copyright
-- ownership. Camunda licenses this file to you under the Apache License,
-- Version 2.0; you may not use this file except in compliance with the License.
-- You may obtain a copy of the License at
--
--     http://www.apache.org/licenses/LICENSE-2.0
--
-- Unless required by applicable law or agreed to in writing, software
-- distributed under the License is distributed on an "AS IS" BASIS,
-- WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
-- See the License for the specific language governing permissions and
-- limitations under the License.
--

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