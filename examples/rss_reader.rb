require_relative '../lib/txt2speech'
require 'rss'

rss = RSS::Parser.parse('http://techcrunch.com/feed/', false)

f = Txt2Speech::Speech.new(rss.items.map{|item| item.title}.join('.'))
f.save("rss_reader.mpg")