#!/bin/bash

LIGHTON=false
while : 
do

  ISMUTED=$(osascript isZoomMuted.scpt)

  if [ $? -eq 0 ]
  then 
    if [ $ISMUTED = "Unmuted" ]
    then
      if [ $LIGHTON = false ];
      then
        printf "turning the light on\n"
        curl -X POST -d "tally=on" "http://tally.local:8000/tally"
        if [ $? -eq 0 ]
        then 
          LIGHTON=true
        fi
      fi
      continue
    fi
  fi
  if [ $LIGHTON = true ];
  then
    printf "turning the light off\n"
    curl -X POST -d "tally=off" "http://tally.local:8000/tally"
    if [ $? -eq 0 ]
    then
      LIGHTON=false
    fi
  fi
  sleep 1
done
