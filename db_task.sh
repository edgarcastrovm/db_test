#!/bin/bash
#Credenciales oracle
ORACLE_SID=xe
SCRIPT=$1
USER_ORA='ECASTRO'
PASS_ORA='Novopayment1*'
SERVER_ORA='10.0.2.2'
SERVER_PORT=1522
##------------------------------------------------------------------------------------------------
##---- Run command

base=DB_FILES

echo "SPOOL temp.log 

SET serveroutput on
SELECT TO_CHAR (SYSDATE, 'DD-MON-YYYY HH24:MI:SS') start_time FROM DUAL;">run.sql
if [[ -f $SCRIPT ]];
then
    echo "@$SCRIPT;">>run.sql
fi
echo "/
SELECT TO_CHAR(SYSDATE, 'DD-MON-YYYY HH24:MI:SS') end_time FROM DUAL;
spool OFF
EXIT">>run.sql
sqlplus $USER_ORA/$PASS_ORA@$SERVER_ORA:$SERVER_PORT/$ORACLE_SID @run.sql