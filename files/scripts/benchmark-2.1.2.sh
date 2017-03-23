#!/bin/bash

# 2.1.2    Ensure daytime services are not enabled (Scored)

REGEX='daytime-(dgram|stream)'
RESULT=$(/sbin/chkconfig --list 2>/dev/null | /bin/grep -P $REGEX | \
  /bin/grep -P '\d:on' )

if [[ -z $RESULT ]]
then
  echo 'cis_benchmark_2_1_2=passed'
else
  echo 'cis_benchmark_2_1_2=failed'
fi
