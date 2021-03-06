#!/bin/bash

# 1.1.1.3    Ensure mounting of jffs2 filesystems is disabled (Scored)

MODULE=jffs2
RESULT=$(/sbin/lsmod | /bin/grep $MODULE)

if [[ -z $RESULT ]]
then
  # module is not loaded in kernel, check if this was remediated
  RESULT=$(/bin/grep "install[[:space:]+]$MODULE[[:space:]+]/bin/true" /etc/modprobe.d/*)
  if [[ $RESULT ]]
  then
    echo 'cis_benchmark_1_1_1_3=passed'
  else
    echo 'cis_benchmark_1_1_1_3=failed'
  fi
else
  echo 'cis_benchmark_1_1_1_3=failed'
fi
