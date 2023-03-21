create external table ods_activity_info_full
（
'id' string  comment '活动ID'
'activity_name' string comment '活动名称'
'activity_type' string comment '活动类型'
'activity_desc' string comment '活动描述'
'star time' string comment '开始时间'
'end time' string comment '结束时间'
'creat time' string comment '创建时间'
） comment '活动信息表'
partitioned by ('dt' string)
row format delimited fields terminated by '\t'
null defined as ' '
location '/warehouse/gmall/ods/ods_activity_info_full/';