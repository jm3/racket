## App-Racket:
### Listen to the sounds of your web app

Warning: very untested and hacky, may cause blindness, etc, etc

Ever wanted a completely ambient view of your app's performance and
progress? App-Racket lets you step back and experience the key your
applications' events in the form of light and sound. 
Great for team morale and stoner parties. 

App-Racket uses a custom logfile format, but could be extended to
read any line-based log file, ala gltail.

Sounds are kept in the "sounds" directory; WAV and AIF both supported.

## Installing:

    # install the mac SDL pre-requisites:
    sudo port install libsdl libsdl_mixer libsdl-framework libsdl_gfx-framework \
      libsdl_image-framework libsdl_mixer-framework libsdl_sound-framework libsdl_gfx \
      libsdl_sound libsdl_image libsdl_ttf

    # annoying: Rubygame's rake arguments that purport to ignore
    # the missing subsystems don't work, so we need to install all
    # the satellite libs like gfx and ttf, even though we don't
    # need them.

    # install a ruby API that interacts with SDL:
    sudo gem install rubygame

    # get RSDL, a wacky japanese ruby wrapper that stops SDL from seg-faulting and
    # spewing weird errors. more at: http://www.kumaryu.net/?(Ruby)+Ruby%2FSDL%CD%D1ruby
    wget "http://www.kumaryu.net/?c=plugin;plugin=attach_download;p=%28Ruby%29+Ruby%2FSDL%CD%D1ruby;file_name=rsdl-0.1.1.tar.gz" \
      -O rsdl-0.1.1.tar.gz

    # remove the -arch ppc arguments from the Makefile or make will bomb 
    # while trying to make rsdl ppc binaries
    vi Makefile
    make
    make install

## Usage:
    # tap into your web-app's logfile, or simulate one:
    ./event_log_simulator.rb > dummy.log &

    # run app-racket with rsdl wrapper:
    rsdl app_racket.rb dummy.log

    # learn

# TODO:
 * figure out if syslog is what we want for aggregate logfiles from
   multiple apps/servers into a single stream

## Acknowledgements:
Thanks to the author of the original "sonic compiler" paper i read
on the internet in college, wherever you are. Also thanks to
[formalplay](http://formalplay.com),
[fudgie](http://www.fudgie.org),
[stamen](http://stamen.com/),
[slowmotionlandscape](http://companypolicy.tv),
the [monome kids](http://monome.org/),
and [ambient devices](http://ambientdevices.myshopify.com/products/stock-orb)
for inspiration.
