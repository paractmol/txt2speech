# encoding: UTF-8

require 'net/http'
 
class Txt2Speech
  GOOGLE_TRANSLATE_URL = 'http://translate.google.com/translate_tts'
 
	attr_accessor :text, :lang
 
	def initialize(text, lang = 'en')
		@text = text
		@lang = lang
	end
 
	def self.load(file_path, lang = 'en')
		f = File.open(file_path)
		self.new f.read.force_encoding(Encoding::UTF_8), lang
	end
 
	def save(file_path)
		uri = URI(GOOGLE_TRANSLATE_URL)
 
		attempts = text.length / 99.0
		starts = 0
		ar = response = []
 
		attempts.ceil.times do 
			ends = starts + 99
			ar << text[starts...ends]
			starts = ends
		end
 
		ar.each do |q|
			uri.query = URI.encode_www_form({ ie: 'UTF-8', q: q, tl: lang, total: 1, idx: 5, textlen: q.length, prev: 'input'  })
			res = Net::HTTP.get_response(uri)
 
			response << res.body.force_encoding(Encoding::UTF_8) if res.is_a?(Net::HTTPSuccess)
		end
 
		File.open(file_path, 'wb') do |f| 
			f.write response.join
			return f.path
		end
	end
end