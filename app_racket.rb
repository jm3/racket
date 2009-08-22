#!/usr/bin/env ruby

require 'rubygame'
include Rubygame

Rubygame.init

def play_sounds
  puts "Using audio driver:" + Rubygame.audio_driver
  Sound.autoload_dirs = [ "sounds" ]
  sounds = {
    :share_tweet => 'sounds/notify_cardinal1.aiff',
    :invite_tweet => 'sounds/squeaks.wav',
  }
  channels = []

  channels << Sound.load(sounds[:share_tweet])
  channels << Sound.load(sounds[:invite_tweet])

  unless channels.first
    puts "EPIC_FAIL: Couldn't find audio file '#{file}'."
    exit
  end

  channels[0].play
  channels[1].play
  #sound.fade_out(2) # seconds
  #sound.pause

  # stay running while sounds are playing
  channels.each do |channel|
    while channel.playing? or channel.fading? == :out do Thread.pass end
  end
end

sound_thread = Thread.new do play_sounds end
sound_thread.join
Rubygame.quit()
