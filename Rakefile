require 'rubygems'
require 'rake'
require 'rake/rdoctask'

GEM_NAME = "racket"
AUTHORS = ["John Manoogian III", "Erik Michaels-Ober"]
EMAIL = "jm3@jm3.net"
HOMEPAGE = "http://github.com/jm3/racket"
SUMMARY = "Listen to your app."

begin
  require 'jeweler'
  Jeweler::Tasks.new do |gemspec|
    gemspec.name = GEM_NAME
    gemspec.summary = SUMMARY
    gemspec.description = gemspec.summary
    gemspec.authors = AUTHORS
    gemspec.email = EMAIL
    gemspec.homepage = HOMEPAGE
    gemspec.bindir = "bin"
    gemspec.executables = ["racket"]
    gemspec.default_executable = "racket"
    gemspec.add_dependency("rsdl", [">= 0.1.2"])
    gemspec.add_dependency("rubygame", [">= 2.6.2"])
  end
  Jeweler::GemcutterTasks.new
rescue LoadError
  puts "Jeweler not available. Install it with: gem install jeweler"
end
