require 'optparse'

require_relative 'speech'
require_relative 'version'

module Txt2Speech
  class Application
    def initialize
      options = {}
      OptionParser.new do |opts|
        opts.banner = "Usage: txt2speech [options]"

        opts.on("-o", "--output [String]", String, "Output file") {|o| options[:out] = o }
        opts.on("-r", "--read [String]", String, "Read text") {|o| options[:read] = o}
        opts.on("-f", "--file", "From file") {|o| options[:file] = o }
        opts.on("-l", "--lang [String]", String, "Language of text") {|o| options[:lang] = o }
        opts.on("-v", "--version", "Show version") {|o| options[:version] = Txt2Speech::VERSION }
      end.parse!

      if options[:version]
        puts options[:version]
      else
        out = options[:out].to_s.length > 0 ? options[:out] : "out.mpg"

        attrs = [options[:read], options[:lang] || "en"]
        attrs.unshift(options[:file] ? :load : :new)

        f = Txt2Speech::Speech.send(*attrs)
        f.save(out)
      end
    end
  end
end
