#!/bin/bash
#Credenciales oracle
ORACLE_SID=xe
SCRIPT=db.sql
USER_ORA='ECASTRO'
PASS_ORA='Novopayment1*'
SERVER_ORA='192.168.100.200'
SERVER_PORT=1522
##------------------------------------------------------------------------------------------------
##---- Run command from string
#TABLE=$1
#cmd="sqlplus $USER_ORA/$PASS_ORA@$SERVER_ORA:$SERVER_PORT/$ORACLE_SID @$SCRIPT $TABLE"
#echo $cmd
#eval $cmd

##------------------------------------------------------------------------------------------------
##---- Run command with parameters script
sqlplus $USER_ORA/$PASS_ORA@$SERVER_ORA:$SERVER_PORT/$ORACLE_SID @$SCRIPT $1