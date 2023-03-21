#!/bin/bash

APP=gmall

if[-n"$2"];then
    do date=$2
else
    do date =`ate-d'-1 day'+%F`
fi

load_data(){
    sql=""
    for i in $*;do
    #判断路径是否存在
    hadoop fs -test -e/origin_data/$APP/db/${1:4}/$do_date
    #路径存在方可装载数据
    if[[$?=0]];then
        sql=$sql"load data inpath'/origin_data/$APP/db/{1:4}/$do_date'OVERWHRITE into table ${APP}.$i partition(dt='$do_date');"
        fi
    done
    hive -e"$sql"
}

case $1 in
    "ods_activity_info_full")
        load data"ods_activity_info_full"
        ;;
        "all"
            load_data"ods_activity_info_full";;
    esac
