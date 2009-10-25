#!/bin/sh
# the lib SDL build train!

pushd .

mkdir deps
cd deps

# install the SDL multimedia libraries (required my SDL mixer)
# (official, stable, Snow Leopard-safe build)
wget http://www.libsdl.org/release/SDL-1.2.14.tar.gz
tar zxpvf SDL-1.2.14.tar.gz && rm SDL-1.2.14.tar.gz
cd SDL-1.2.14
./configure && make && sudo make install
cd -

# install support for Ogg audio containers
wget http://downloads.xiph.org/releases/ogg/libogg-1.1.4.tar.gz
tar zxpvf libogg-1.1.4.tar.gz && rm libogg-1.1.4.tar.gz
chmod -R og-w libogg-1.1.4
cd libogg-1.1.4
./configure && make && sudo make install
cd -

# support support for Ogg Vorbis-compressed audio
wget http://downloads.xiph.org/releases/vorbis/libvorbis-1.2.3.tar.gz
tar zxpvf libvorbis-1.2.3.tar.gz && rm libvorbis-1.2.3.tar.gz
chmod -R og-w libvorbis-1.2.3
cd libvorbis-1.2.3
./configure && make && sudo make install
cd -

# support support for mp3s via the smpeg decoding library
svn co svn://svn.icculus.org/smpeg/trunk smpeg
cd smpeg
./autogen.sh && ./configure && make
chmod +rx install-sh
sudo make install
cd -

# support for MOD files (SDL mixer bombs unless this is installed)
wget http://mikmod.raphnet.net/files/libmikmod-3.2.0-beta2.tar.gz
tar zxpvf libmikmod-3.2.0-beta2.tar.gz && rm libmikmod-3.2.0-beta2.tar.gz
cd libmikmod-3.2.0-beta2
./configure && make && sudo make install
cd -

# install SDL audio mixer for up to 8-sound polyphony plus background music 
# (official, stable, Snow Leopard-safe build)
wget http://www.libsdl.org/projects/SDL_mixer/release/SDL_mixer-1.2.9.tar.gz
tar zxpvf SDL_mixer-1.2.9.tar.gz && rm SDL_mixer-1.2.9.tar.gz
cd SDL_mixer-1.2.9
./configure && make && sudo make install
cd -

# install rubygame, @jacius' ruby SDL bindings:
installer=`type sgi64`
if [ "$install" = "sgi64 not found" ] ; then
  install="sudo gem install"
else
  install="sgi64" # pathological @plus1 snowleopard build process by @sferik
fi
$install rubygame

# install RSDL, a wacky japanese ruby wrapper that correctly connects
# to cocoa, stopping SDL from dieing with tons of memory leak errors.
git clone git://github.com/knu/rsdl.git
cd rsdl
ruby configure.rb && make && sudo make install
cd -

popd

echo "remove `du -sh deps | awk '{print $1}'` of dependency sources? (this will not break anything) [yn]"
read remove_deps
if [ "$remove_deps" = "y" -o "$remove_deps" = "Y" ] ; then
  rm -rf deps
fi

# END
