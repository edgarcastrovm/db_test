#!/bin/bash
#Credenciales oracle
ORACLE_SID=xe
SCRIPT=db.sql
USER_ORA='ECASTRO'
PASS_ORA='Novopayment1*'
SERVER_ORA='10.0.2.2'
SERVER_PORT=1522
##------------------------------------------------------------------------------------------------
##---- Run command from string
#TABLE=$1
#cmd="sqlplus $USER_ORA/$PASS_ORA@$SERVER_ORA:$SERVER_PORT/$ORACLE_SID @$SCRIPT $TABLE"
#echo $cmd
#eval $cmd

##------------------------------------------------------------------------------------------------
##---- Run command with parameters script
#sqlplus $USER_ORA/$PASS_ORA@$SERVER_ORA:$SERVER_PORT/$ORACLE_SID @$SCRIPT $1 > log exit;

#eval "sqlplus $USER_ORA/$PASS_ORA@$SERVER_ORA:$SERVER_PORT/$ORACLE_SID @$SCRIPT $1 " > log

base=FILES
init_file=$base/order
#base=$(pwd)/DB_INIT
file=$(cat $init_file)

echo "SPOOL temp.log 

SET serveroutput on
SELECT TO_CHAR (SYSDATE, 'DD-MON-YYYY HH24:MI:SS') start_time FROM DUAL;">run.sql
for line in $file
do
    key=$(echo "$line" | cut -d '=' -f 1)
    val=$(echo "$line" | cut -d '=' -f 2)
    echo $line
    if [ $key = "file" ];
    then
        #sqlplus $USER_ORA/$PASS_ORA@$SERVER_ORA:$SERVER_PORT/$ORACLE_SID @$base/$val exit;
        echo "@$base/$val;">>run.sql
    else 
        for file in $base/$val/*; do
            if [[ -f $file ]];
            then
                #sqlplus $USER_ORA/$PASS_ORA@$SERVER_ORA:$SERVER_PORT/$ORACLE_SID @$file | exit;
                echo "@$file;">>run.sql
            fi
        done
    fi
done
echo "/
SELECT TO_CHAR(SYSDATE, 'DD-MON-YYYY HH24:MI:SS') end_time FROM DUAL;
spool OFF
EXIT">>run.sql
sqlplus $USER_ORA/$PASS_ORA@$SERVER_ORA:$SERVER_PORT/$ORACLE_SID @run.sql