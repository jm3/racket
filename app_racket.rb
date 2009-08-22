#!/usr/bin/env ruby

require 'rubygame'
include Rubygame

Rubygame.init

def handle_events
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

  e = Event.new( 'Share Tweet', 'A user just tweeted something about us to a friend',
        Reaction.new( {:file => 'sounds/savage.wav', :volume => 10}, {:color => 'red', :duration => 10})
        )

  puts e

  # stay running while sounds are playing
  channels.each do |channel|
    while channel.playing? or channel.fading? == :out do Thread.pass end
  end
end

class Event
  attr_accessor :name, :desc, :reaction
  def initialize(name, desc, reaction)
    @name = name
    @desc = desc
    @reaction = reaction
  end

  def to_s
    "Event: #{name}: #{desc}\n" + reaction.to_s
  end
end

class Reaction
  attr_accessor :sound, :light

  def initialize(sound, light)
    @sound = sound
    @light = light
  end

  def to_s
    "  sound: #{sound[:file]}\n volume: #{sound[:volume]}\n light color: #{light[:color]}\n light duration: #{light[:duration]}"
  end
end

event_thread = Thread.new do handle_events end
event_thread.join
Rubygame.quit()
