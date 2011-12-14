#!/bin/sh

uname=`uname`
if [ "$uname" = "Darwin" ] ; then
  sudo port -d selfupdate && \
  sudo port clean libsdl && \
  sudo port install libsdl libsdl_gfx libsdl_ttf libsdl_image libogg libvorbis smpeg libmikmod libsdl_mixer libffi
else
  sudo aptitude update && \
  sudo aptitude install libsdl1.2-dev libogg-dev libogg libvorbis-dev libvorbis
fi
