# encoding: UTF-8

require 'net/http'

module Txt2Speech
	class Speech
	  GOOGLE_TRANSLATE_URL = 'http://translate.google.com/translate_tts'
	 
		attr_accessor :text, :lang
	 
		def initialize(text, lang = 'en')
			@text = text
			@lang = lang
		end
	 
		def self.load(file_path, lang = 'en')
			f = File.open(file_path)
			self.new f.read.encode("UTF-16be", :invalid=>:replace, :replace=>"?").encode('UTF-8'), lang
		end
	 
		def save(file_path)
			uri = URI(GOOGLE_TRANSLATE_URL)
			
			response = []
			ar = text.split(/[,.\r\n]/i)
			ar.reject! {|t| t.empty? }
			ar.map! {|t| divide(t) }.flatten!
			ar.map! {|t| t.strip }

			puts ar.inspect
	 
			ar.each_with_index do |q, idx|
				uri.query = URI.encode_www_form({ ie: 'UTF-8', q: q, tl: lang, total: ar.length, idx: idx+1, textlen: q.length, prev: 'input'  })
				res = Net::HTTP.get_response(uri)
	 
				response << res.body.force_encoding(Encoding::UTF_8) if res.is_a?(Net::HTTPSuccess)
			end
	 
			File.open(file_path, 'wb') do |f| 
				f.write response.join
				return f.path
			end
		end

		private

		def divide(text)
			return text if text.length < 150

			attempts = text.length / 150.0
			starts = 0
			ar = []

			attempts.ceil.times do 
				ends = starts + 150
				ar << text[starts...ends]
				starts = ends
			end

			ar
		end
	end
end