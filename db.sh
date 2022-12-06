#!/bin/bash
ORACLE_SID=xe; export ORACLE_SID
SCRIPT=/c/Scripts; export SCRIPT
USER_ORA='ECASTRO'; export USER_ORA
PASS_ORA='Novopayment1*'; export PASS_ORA
SERVER_ORA='192.168.100.200'; export SERVER_ORA
SERVER_PORT=1522; export SERVER_PORT
echo "$USER_ORA/$PASS_ORA@$SERVER_ORA:$SERVER_PORT/$ORACLE_SID"
#docker run  -ti --rm ghcr.io/oracle/oraclelinux7-instantclient:19 
#sqlplus $USER_ORA/$PASS_ORA@$SERVER_ORA:$SERVER_PORT/$ORACLE_SID @$SCRIPT/genera_reportes.sql DEMO_PRODUCT_INFO



docker run  -ti --rm ghcr.io/oracle/oraclelinux7-instantclient:19 sqlplus ECASTRO/Novopayment1*@localhost:1522/xe
