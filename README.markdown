## App-Racket
### Listen to the sounds of your web app

Warning: very untested and hacky, may cause blindness, etc, etc

Ever wanted a completely ambient view of your app's performance and
progress? App-Racket lets you step back and experience your
applications' events as pure light and sound. Potentially great for
pattern discovery, team morale, and stoner parties. App-Racket uses
a custom logfile format, but could be extended to read any line-based
log file, ala gltail.

Sounds are kept in the "sounds" directory; WAV and AIF both supported.

Events and corresponding reactions are defined in the events hash;
this should be yaml-ified, prolly.

## Installing:

    # install sound handling libraries
    sudo port install libsdl libsdl_mixer

    # install a ruby bindings for SDL. we don't use the gem here because rubygame's
    # rake build process has a bug that forces you to install all of the SDL modules,
    # requiring about 5 more port installs. this avoids that:
    git clone git://github.com/jacius/rubygame.git
    pushd
    cd rubygame

    # edit Rubygam's Rakefile to disable gfx, image, and ttf modules,
    # changing true to false for the gfx, image, and ttf modules:
    # 166   :"sdl-gfx"    => false,
    # 167   :"sdl-image"  => false,
    # 168   :"sdl-ttf"    => false,
    vi Rakefile

    # now we can build and install only the audio mixer, skipping the rest:
    rake no-sdl-gfx no-sdl-image no-sdl-ttf no-opengl build
    sudo rake install
    popd

    # get RSDL, a wacky japanese ruby wrapper that correctly connects
    # to cocoa, stopping SDL from dieing with tons of memory leak errors.
    # (more at: http://www.kumaryu.net/?(Ruby)+Ruby%2FSDL%CD%D1ruby)
    wget "http://www.kumaryu.net/?c=plugin;plugin=attach_download;p=%28Ruby%29+Ruby%2FSDL%CD%D1ruby;file_name=rsdl-0.1.1.tar.gz" \
      -O rsdl-0.1.1.tar.gz
    gtar zxpvf rsdl-0.1.1.tar.gz
    pushd
    cd rsdl-0.1.1
    ruby configure.rb
    make
    sudo make install
    hash -r
    popd
    rm -rf rsdl-0.1.1 rsdl-0.1.1.tar.gz

    # remove the -arch ppc arguments from the Makefile or make will bomb trying to make rsdl ppc binaries
    vi Makefile
    make
    make install

## Usage:
    # start your web-app, or simulate it:
    ./event_log_simulator.rb > dummy.log &

    # run app-racket with rsdl wrapper:
    rsdl app_racket.rb dummy.log

    # learn

# TODO:
 * implement tailing over ssh, ala GlTail
 * yaml-ize sound reaction mapping
 * implement light control via [arduino](http://rad.rubyforge.org/)
 * figure out if syslog is what we want for aggregate logfiles from
   multiple apps/servers into a single stream

## Acknowledgements:
Thanks to the author of the original "sonic compiler" paper, wherever you are. Also thanks to
[formalplay](http://formalplay.com),
[fudgie](http://www.fudgie.org),
[stamen](http://stamen.com/),
[slowmotionlandscape](http://companypolicy.tv),
the [monome kids](http://monome.org/),
and [ambient devices](http://ambientdevices.myshopify.com/products/stock-orb)
for inspiration. 
