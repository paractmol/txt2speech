require 'net/http'

module Txt2Speech
  class Speech
    GOOGLE_TRANSLATE_URL = 'http://translate.google.com/translate_tts'.freeze

    attr_accessor :text, :lang

    def initialize(text, lang = 'en')
      @text = text
      @lang = lang
    end

    def self.load(file_path, lang = 'en')
      f = File.open(file_path)
      new f.read.encode('UTF-16be', invalid: :replace, replace: '?').encode('UTF-8'), lang
    end

    def save(file_path)
      uri = URI(GOOGLE_TRANSLATE_URL)

      response = []

      sentences = text.split(/[,.\r\n]/i)
      sentences.reject!(&:empty?)
      sentences.map! { |t| divide(t.strip) }.flatten!

      sentences.each_with_index do |q, _idx|
        uri.query = URI.encode_www_form(
          ie: 'UTF-8',
          q: q,
          tl: lang,
          total: sentences.length,
          idx: 0,
          textlen: q.length,
          client: 'tw-ob',
          prev: 'input'
        )

        res = Net::HTTP.get_response(uri)

        next unless res.is_a?(Net::HTTPSuccess)

        response << res.body.force_encoding(Encoding::UTF_8)
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
      arr = []

      attempts.ceil.times do
        ends = starts + 150
        arr << text[starts...ends]
        starts = ends
      end

      arr
    end
  end
end
