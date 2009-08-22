#!/usr/bin/env ruby

require 'rubygame'
include Rubygame
Rubygame.init

def test_music

	puts "Using audio driver:" + Rubygame.audio_driver

	if ARGV[0]
		file = ARGV[0]
	else
		file = "sounds/tiny-bubbles.mp3"
		puts "If you want, you could give a filename as an argument to this script."
	end

	Music.autoload_dirs = [ File.dirname(__FILE__) ]
	mus = Music[file];

	unless mus
		puts "ERROR: Couldn't find audio file '#{file}'."
	end

	#mus.play( :fade_in => 3, :repeats => -1 ); # test fading in over 3 seconds, repeating forever
	#mus.pause
	#mus.unpause
	#mus.fade_out(2) # seconds
  mus.play

	while mus.playing? or mus.fading? == :out do Thread.pass end
	# Test playing of music to the end

	puts "ERROR: Music not ended" if mus.playing?
end

music_thread = Thread.new do test_music() end
music_thread.join
Rubygame.quit()

