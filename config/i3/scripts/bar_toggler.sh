#!/bin/sh

if [ -f /tmp/polybarhidden ]
then 
  polybar-msg cmd show 
  i3-msg gaps top all set 30
  rm /tmp/polybarhidden 
else 
  polybar-msg cmd hide 
  i3-msg gaps top all set 0
  touch /tmp/polybarhidden 
fi
