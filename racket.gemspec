spec = Gem::Specification.new do |s|
  s.version           = "0.0.1"
  s.date              = %q{2009-11-20}

  s.name              = "racket"
  s.author            = "John Manoogian III"
  s.summary           = "listen to your app"
  s.description       = s.summary + "."
  s.email             = "jm3@jm3.net"
  s.homepage          = "http://jm3.net/"
  s.files             = ["bin/app_racket.rb", "bin/event_simulator.rb"]
  s.rubygems_version  = %q{1.3.5}
  s.rubyforge_project = "your-mom"

  s.bindir      = "bin"
  s.executables = ["app_racket.rb"]
  s.default_executable = "app_racket.rb"

  s.platform          = Gem::Platform::RUBY
  s.has_rdoc          = false
  s.extra_rdoc_files  = ["README.markdown"]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3
 
    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency('curb', [">= 0.5.1.0"])
      s.add_runtime_dependency('moneta', [">= 0.6.0"])
      s.add_runtime_dependency('progressbar', [">= 0.0.3"])
    else
      s.add_dependency('curb', [">= 0.5.1.0"])
      s.add_dependency('moneta', [">= 0.6.0"])
      s.add_dependency('progressbar', [">= 0.0.3"])
    end
  else
    s.add_dependency('curb', [">= 0.5.1.0"])
    s.add_dependency('moneta', [">= 0.6.0"])
    s.add_dependency('progressbar', [">= 0.0.3"])
  end

end
