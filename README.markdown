## Racket
### Listen to your app.

Warning: very untested and hacky, may cause blindness, etc, etc.

Ever wanted a completely ambient view of your app's performance and progress?
Racket lets you step back and experience your applications' events as pure light
and sound. Potentially great for pattern discovery, team morale, and stoner parties.
Racket uses a custom logfile format, but could be extended to read any line-based
log file, a la gltail.

Sounds live in the "sounds" directory; wav, mp3, aiff and even wacky formats like OggVorbis are supported.

Events and corresponding reactions are defined in `config/matcher.rb`

## Installing:

    ./install_dependencies.sh

## Usage:

    # start your web-app, or simulate it:
    ./bin/event_simulator > dummy.log &

    # run app-racket with rsdl wrapper:
    rsdl bin/racket dummy.log

    # bask in the insanity of your app's racket!

## TODO:
 * implement tailing over ssh, a la GlTail
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
Playing audio in Ruby is much messier than I expected before starting
this project, especially having seen things like Giles' archeopteryx.
Racket depends on several external libraries, primarily because
SDL (the cross-platform multimedia library) itself depends on several
obscure audio format decoders to even play simple files, e.g. Ogg
Vorbis and MikMod.

On top of those, on OS X SDL also requires a ruby wrapper called
rsdl, plus we interface to SDL from ruby via something called
rubygame, which itself requires things like the FFI gems.

But fear not: the racket installer script handles all that
for you. On my MacBook Pro the full shebang takes about 4m45s to
download, compile, and install everything, which isn't bad.
