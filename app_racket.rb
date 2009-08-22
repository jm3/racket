#!/usr/bin/env ruby

require 'rubygame'
include Rubygame

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
    "  sound: #{sound}\n" + 
    "  light color: #{light[:color]}\n light duration: #{light[:duration]}"
  end
end

Rubygame.init

def handle_events
  # puts "Using audio driver:" + Rubygame.audio_driver
  Sound.autoload_dirs = [ "sounds" ]

  # TODO: yaml-ize this:
  events = []; channels = []

  events << Event.new('Share Tweet', 
                      'A user just tweeted something about us to a friend',
                      Reaction.new( 
                        'sounds/notify_cardinal1.aiff',
                        {:color => :red, :duration => 10}))
  events << Event.new('Invite Tweet', 
                      'A user just invited XXX people to the app',
                      Reaction.new( 
                        'sounds/squeaks.wav',
                        {:color => :blue, :duration => 10}))


  # TODO: stub only; next we just pull events off the event queue
  channels << Sound.load(events.first.reaction.sound) # FIXME: mapper goes here
  channels.first.play

  # stay running while sounds are playing
  channels.each_with_index do |channel,i|
    while channel.playing? or channel.fading? == :out do Thread.pass end
    channels.delete(i)
  end
end

event_thread = Thread.new do handle_events end
event_thread.join
Rubygame.quit()
