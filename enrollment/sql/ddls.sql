--Athena table creation script

CREATE EXTERNAL TABLE enrollment_table(
  year varchar(4), 
  ncessch varchar(16),
  ncessch_num bigint,
  grade bigint,
  race bigint,
  sex bigint,
  enrollment bigint,
  fips bigint,
  leaid varchar(10)
)
PARTITIONED BY (`y` string)
ROW FORMAT SERDE 
  'org.apache.hive.hcatalog.data.JsonSerDe' 
LOCATION
  's3://bezos-project/';

MSCK REPAIR TABLE `enrollment_table`;

create external table state_data (
    state_code bigint,
    state_name varchar(100)
)
ROW FORMAT DELIMITED
FIELDS TERMINATED BY '^' 
LINES TERMINATED BY '\n'
LOCATION
  's3://bezos-project-meta/';
