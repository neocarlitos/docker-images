#!/bin/bash

VOS_USER=dba
VOS_PASS=dba
VOS_PORT=1111
VOS="isql $VOS_PORT $VOS_USER $VOS_PASS verbose=off errors=stdout"

virtuoso-t +wait +configfile ${VOS_CONFIG}

$VOS install_pkgs.sql

sed -i.org "s:/tmp/share/__DATA_DIR__:/root/data:" import_rdf.sql

$VOS import_rdf.sql
$VOS update_rdf.sql
$VOS post_install.sql

echo "========================================================================="
echo "========================================================================="
echo "|   VIRTUOSO IMPORTS FINISHED                                           |"
echo "========================================================================="
echo "========================================================================="

killall5
sleep 30
virtuoso-t +wait +foreground +configfile ${VOS_CONFIG}
