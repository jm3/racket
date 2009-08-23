#!/usr/bin/env ruby

require 'rubygems'
require 'file/tail'

def watch_file
  @log = File.open('dummy.log')
  @log.extend(File::Tail)
  @log.tail { |line| puts line }
end

event_thread = Thread.new do watch_file end
event_thread.join
