#!/bin/bash

STATE=false
while : 
do

  NEWSTATE=$(osascript zoomStatus.scpt)

  if [ $? -eq 0 ]
  then 
    if [ $NEWSTATE != $STATE ]
    then
      echo $NEWSTATE
      curl -X POST -d "tally=$NEWSTATE" "http://tally.local:8000/tally"
      if [ $? -eq 0 ]
      then 
          STATE=$NEWSTATE
      fi
      continue
    fi
  fi
  sleep 1
done
