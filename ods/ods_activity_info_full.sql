create  table if not exists ods.ods_activity_info_full
（
    id                  STRING COMMENT '活动ID'
    ，activity_name     STRING COMMENT '活动名称'
    ，activity_type     STRING COMMENT '活动类型'
    ，activity_desc     STRING COMMENT '活动描述'
    ，start_time        STRING COMMENT '开始时间'
    ，end_time          STRING COMMENT '结束时间'
    ，create_time       STRING COMMENT '创建时间'
） COMMENT '活动信息表'
PARTITIONED by ('dt' STRING)
stored as orc;