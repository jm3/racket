# rubysdl is a different (japanese) set of runy bindings for SDL.
# rubygame seems to a little further along in development, but this
# (rubysdl) could be worth exploring later if rubygame has problems.

require 'rubygems'
require 'sdl'

SDL::init(SDL::INIT_AUDIO)

SDL::Mixer.open(22050, SDL::Mixer::DEFAULT_FORMAT, 2, 512)
wave = SDL::Mixer::Wave.load("sample.wav")
wave2 = SDL::Mixer::Wave.load("sample2.wav")

SDL::Mixer.play_channel(0, wave, 0)
SDL::Mixer.play_channel(2, wave2, 0)

while SDL::Mixer.play?(0)
  sleep 1
end


