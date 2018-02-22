#!/bin/sh

source zap.properties

sec='^[0-9]+$'

if ! [[ $DELAY_SECS =~ $sec ]] ; then
   echo "error: Not a number" >&2; exit 1
else
  sleep $DELAY_SECS
  echo "Done sleeping!"
fi
