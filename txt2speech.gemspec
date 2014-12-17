lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'txt2speech/version'

Gem::Specification.new do |s|
  s.name        = 'txt2speech'
  s.version     = Txt2Speech::VERSION
  s.date        = '2014-12-17'
  s.summary     = "txt2speech"
  s.description = "txt2Speech lifehack of using Google Translate. Allow you to convert text into speech."
  s.authors     = ["Jared Levitz"]
  s.email       = 'jared.levitz@gmail.com'
  s.files       = `git ls-files`.split("\n")
  s.homepage    = 'http://github.com/rudkovsky/txt2speech'
  s.license     = 'MIT'
end