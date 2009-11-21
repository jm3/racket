#!/bin/sh

uname=`uname`
if [ "$uname" = "Darwin" ] ; then
  sudo port -d selfupdate && \
  sudo port clean libsdl && \
  sudo port install libsdl libogg libvorbis smpeg libmikmod libsdl_mixer
else
  sudo aptitude update && \
  sudo aptitude install libsdl1.2-dev libogg-dev libogg libvorbis-dev libvorbis
fi
