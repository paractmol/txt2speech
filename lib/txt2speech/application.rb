require 'optparse'
require_relative "txt2speech"

class Application
	options = {}
	OptionParser.new do |opts|
	  opts.banner = "Usage: txt2speech [options]"

	  opts.on("-o", "--output [String]", String, "Output file") {|o| options[:out] = o }
	  opts.on("-r", "--read [String]", String, "Read text") {|o| options[:read] = o}
	  opts.on("-f", "--file", "From file") {|o| options[:file] = o }
	  opts.on("-l", "--lang [String]", String, "Language of text") {|o| options[:lang] = o }
	end.parse!

	out = options[:out].to_s.length > 0 ? options[:out] : "out.mp3"

	attrs = [options[:read], options[:lang] || "en"]
	attrs.unshift(options[:file] ? :load : :new)

	f = Txt2Speech.send(*attrs)
	f.save(out)
end