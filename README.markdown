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

    ./install.sh 

## Usage:

    # start your web-app, or simulate it:
    ./event_log_simulator.rb > dummy.log &

    # run app-racket with rsdl wrapper:
    rsdl app_racket.rb dummy.log

    # bask in the insanity of your app's racket!

# TODO:
 * implement tailing over ssh, ala GlTail
 * yaml-ize sound reaction mapping
 * implement light control via [arduino](http://rad.rubyforge.org/)
 * figure out if syslog is what we want for aggregate logfiles from
   multiple apps/servers into a single stream

## Acknowledgements:
Thanks to the author of the original "sonic compiler" paper, wherever you are. Also thanks to
[formalplay](http://formalplay.com),
[jacius](http://github.com/jacius),
[fudgie](http://www.fudgie.org),
[stamen](http://stamen.com/),
[slowmotionlandscape](http://companypolicy.tv),
the [monome kids](http://monome.org/),
and [ambient devices](http://ambientdevices.myshopify.com/products/stock-orb)
for inspiration. 

## Notes on installation:
Playing audio in Ruby is less trivial than I expected before I began
this project. App-racket uses the following libraries, mainly because
SDL, the cross-platform multimedia library, requires many obscure
audio formats to run, e.g. stuff like Ogg Vorbis and "libmikmod".  

SDL also requires the rsdl ruby wrapper, and we interface to SDL
via rubygame, which itself requires things like the FFI gems.  

But not to worry, tho: the app-racket install.sh installer script
will handle all of those for you. for me, it takes abot 4m45s to
download, compile, and install everything, which isn't bad.

