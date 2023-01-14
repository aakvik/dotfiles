#!/usr/bin/env bash

function run {
  if ! pgrep $1 ;
  then
    $@&
  fi
}

setxkbmap -layout "no"
setxkbmap -option caps:none
run xscreensaveri -nosplash &
run nm-applet &
#run compton --backend glx --paint-on-overlay --vsync opengl-swc --no-fading-openclose &
