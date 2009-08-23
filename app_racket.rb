#!/usr/bin/env ruby

require 'rubygems'
require 'rubygame'
require 'file/tail'
include Rubygame

class Event
  attr_accessor :name, :desc, :reaction
  def initialize(name, desc, reaction)
    @name = name
    @desc = desc
    @reaction = reaction
  end

  def find(event_text)
    puts 'fuck'
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

  events = {}
  responders = []

  # TODO: yaml-ize the events map
  events[:tweet_share] = 
    Event.new('Share Tweet', 
      'A user just tweeted something about us to a friend',
      Reaction.new( 
        'sounds/notify_cardinal1.aiff',
        {:color => :red, :duration => 10}))

  events[:tweet_invite] = 
    Event.new('Invite Tweet', 
      'A user just invited XXX people to the app',
      Reaction.new( 
        'sounds/squeaks.wav',
        {:color => :blue, :duration => 10}))

  # TODO: delete me:

  # stay running while sounds are playing
  responders.each_with_index do |responder,i|
    while responder.playing? or responder.fading? == :out do Thread.pass end
    responders.delete(i)
  end

  @log = File.open('dummy.log')
  @log.extend(File::Tail)
  @log.tail { |line| 
    ruby, isweird, event, actor, time = /^(.+), (.+), (.+)$/.match(line).to_a
    if event
      puts event
      if events.has_key?(event.to_sym)
        responders << Sound.load(events[event.to_sym].reaction.sound) # FIXME: mapper goes here
        responders.last.play
      else
        puts 'EPIC FAIL: reaction definition missing for event ' + event
      end
    end
  }

end

event_thread = Thread.new do handle_events end
event_thread.join
Rubygame.quit()
