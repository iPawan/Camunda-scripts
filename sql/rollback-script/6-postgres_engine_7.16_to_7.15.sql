
-- ############################################################################################################
-- Drop the table
drop table if exists ACT_RE_CAMFORMDEF;

-- Delete the version entry
delete from ACT_GE_SCHEMA_LOG where VERSION_ = '7.16.0';