#!/usr/bin/env ruby
# jm3

require 'rubygame'
include Rubygame
Rubygame.init

def play_sounds

	puts "Using audio driver:" + Rubygame.audio_driver
	Sound.autoload_dirs = [ "sounds" ]
  sounds = {
    :share_tweet => 'sounds/savage.wav',
    :invite_tweet => 'sounds/squeaks.wav',
  }
  channels = []

	channels << Sound.load(sounds[:share_tweet])
	channels << Sound.load(sounds[:invite_tweet])

	unless channels.first
		puts "ERROR: Couldn't find audio file '#{file}'."
    exit
	end

	#sound.play( :fade_in => 3, :repeats => -1 ); # test fading in over 3 seconds, repeating forever
	#sound.unpause
	#sound.fade_out(2) # seconds
  #sound.play
  channels.first.play
  channels[1].play

  sleep 5
	#sound.pause

	while sound.playing? or sound.fading? == :out do Thread.pass end
	# Test playing of sound to the end

	puts "ERROR: Sound not ended" if sound.playing?
end

sound_thread = Thread.new do play_sounds end
sound_thread.join
Rubygame.quit()

