[![Build Status](https://travis-ci.org/rudkovskyi/txt2speech.svg?branch=master)](https://travis-ci.org/rudkovsky/txt2speech)

txt2speech is a very simple library that by using Google Translate undocumented API allow you convert text to speech.

```
bin/txt2speech -r README.md -f -o example.mpg
```

### To use library directly in your application just install gem and run

```
2.1.2 :001 > require 'txt2speech'
 => true
2.1.2 :010 > f = Txt2Speech::Speech.new "Hello I am Google robot! Nice to meet you, hope you'll enjoy this script and will fork it"
 => #<Txt2Speech::Speech:0x000000022314f8 @text="Hello I am Google robot! Nice to meet you, hope you'll enjoy this script and will fork it", @lang="en">
2.1.2 :011 > f.save('out.mpg')
```

or you can load a text file to read it

```
2.1.2 :006 > f = Txt2Speech::Speech.load "README.md"
 => #<Txt2Speech::Speech:0x000000022314f8 @text="txt2Speech is a simple ruby script that convert text to speech by using Google Translate.\r\n\r\n```\r\n2.1.2 :001 > require './txt2speech.rb'\r\n => true\r\n2.1.2 :002 > f = Txt2Speech.new \"Hello I am google! Nice to meet you\"\r\n => #<Txt2Speech:0x000000018aafd8 @text=\"Hello I am google! Nice to meet you\", @lang=\"en\">\r\n2.1.2 :003 > f.save(\"out.mpg\")\r\n => \"out.mpg\"\r\n```\r\n\r\nor you can load a text file to read it\r\n\r\n```\r\nt = Txt2Speech.load \"\#{Dir.home}/text.txt\"\r\nt.save(\"out.mpg\")\r\n```", @lang="en">
2.1.2 :007 > f.save("out.mpg")
```

The differences between Google and Bing - [How Google and Bing protects their API](https://rudk.ws/2016/10/23/how-google-and-bing-protects-their-api/)
