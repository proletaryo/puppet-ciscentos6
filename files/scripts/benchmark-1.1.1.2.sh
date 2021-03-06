#!/bin/bash

# 1.1.1.2    Ensure mounting of freevxfs filesystems is disabled (Scored)

MODULE=freevxfs
RESULT=$(/sbin/lsmod | /bin/grep $MODULE)

if [[ -z $RESULT ]]
then
  # module is not loaded in kernel, check if this was remediated
  RESULT=$(/bin/grep "install[[:space:]+]$MODULE[[:space:]+]/bin/true" /etc/modprobe.d/*)
  if [[ $RESULT ]]
  then
    echo 'cis_benchmark_1_1_1_2=passed'
  else
    echo 'cis_benchmark_1_1_1_2=failed'
  fi
else
  echo 'cis_benchmark_1_1_1_2=failed'
fi
