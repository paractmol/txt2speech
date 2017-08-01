lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'txt2speech/version'

Gem::Specification.new do |s|
  s.name        = 'txt2speech'
  s.version     = Txt2Speech::VERSION
  s.date        = '2014-12-17'
  s.summary     = 'txt2speech'
  s.description = 'txt2speech is a very simple library that by using Google Translate undocumented API allow you convert text to speech.'
  s.authors     = ['Viacheslav Rudkovskyi']
  s.email       = 'rrubyist@gmail.com'
  s.files       = `git ls-files`.split("\n")
  s.executables = ['txt2speech']
  s.homepage    = 'http://github.com/rudkovsky/txt2speech'
  s.license     = 'MIT'
end
