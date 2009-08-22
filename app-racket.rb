#!/usr/bin/env ruby

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

  channels[1].play
  channels[2].play
	#sound.fade_out(2) # seconds
	#sound.pause

  sleep 5

  # run while still playing…
	while sound.playing? or sound.fading? == :out do Thread.pass end

	puts "ERROR: Sound not ended" if sound.playing?
end

sound_thread = Thread.new do play_sounds end
sound_thread.join
Rubygame.quit()
