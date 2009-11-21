#!/bin/sh
# the lib SDL build train!

pushd .

mkdir deps
cd deps

# install the SDL multimedia libraries (required my SDL mixer)
# (pre-release build for snow leopard)
wget http://www.libsdl.org/tmp/SDL-1.2.14.tar.gz
tar zxpvf SDL-1.2.14.tar.gz && rm SDL-1.2.14.tar.gz
cd SDL-1.2.14
./configure && make && sudo make install
cd -

# install support for Ogg audio containers
wget http://downloads.xiph.org/releases/ogg/libogg-1.1.4.tar.gz
tar zxpvf libogg-1.1.4.tar.gz && rm libogg-1.1.4.tar.gz
cd libogg-1.1.4
./configure && make && sudo make install
cd -

# support support for Ogg Vorbis-compressed audio
wget http://downloads.xiph.org/releases/vorbis/libvorbis-1.2.3.tar.gz
tar zxpvf libvorbis-1.2.3.tar.gz && rm libvorbis-1.2.3.tar.gz
cd libvorbis-1.2.3
./configure && make && sudo make install
cd -

# support support for mp3s via the smpeg decoding library
svn co svn://svn.icculus.org/smpeg/trunk smpeg
cd smpeg
./configure && make
chmod +rx install-sh
sudo make install
cd -

# install the SDL audio mixer for up to 8-sound polyphony plus background music 
# (pre-release build for snow leopard)
wget http://www.libsdl.org/tmp/SDL_mixer/release/SDL_mixer-1.2.9.tar.gz
tar zxpvf SDL_mixer-1.2.9.tar.gz && rm SDL_mixer-1.2.9.tar.gz
cd SDL_mixer-1.2.9
./configure && make && sudo make install
cd -

# install ruby bindings for SDL. we don't use the gem here because
# rubygame's Rakefile needs patching in order to not require 3d
# support, openGL, truetype, and tons of other things we don't need.
# building form source lets us patch the rakefile and get only what
# we need (audio):
git clone git://github.com/jacius/rubygame.git
cd rubygame
# patch Rubygam's Rakefile to disable gfx, image, and ttf modules:
patch Rakefile < ../../rubygame-Rakefile.patch
# skip unneeded modules:
rake no-sdl-gfx no-sdl-image no-sdl-ttf no-opengl build
sudo rake install
cd -

# install RSDL, a wacky japanese ruby wrapper that correctly connects
# to cocoa, stopping SDL from dieing with tons of memory leak errors.
git clone git://github.com/knu/rsdl.git
cd rsdl
ruby configure.rb && make && sudo make install
cd -

popd

# END
