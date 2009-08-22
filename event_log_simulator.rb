#!/usr/bin/env ruby

events = [
  'tweet_share',
  'signup',
  'login',
  'tweet_invite'
]

users = [ 'jm3', 'ryan', 'erik', 'vanessa', 'jon', 'kevin' ]


while true
  puts "#{Time.now}, #{events[rand(events.size)]}, #{users[rand(users.size)]}"
  sleep(rand(5))
end
