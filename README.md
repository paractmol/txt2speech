txt2Speech is a very simple ruby gem that allow you to convert text to speech by using Google Translate.

```
bin/txt2speech -f README.md -o example.mp3
```

### To use library directly in your application just install gem and run 

```
2.1.2 :001 > require 'text2speech/txt2speech'
 => true
2.1.2 :010 > f = Txt2Speech.new "Hello I am Google robot! Nice to meet you, hope you'll enjoy this script and will fork it"
 => #<Txt2Speech:0x000000029a3290 @text="Hello I am Google robot! Nice to meet you, hope you'll enjoy this script and will fork it", @lang="en">
2.1.2 :011 > f.save('out.mp3')
```

or you can load a text file to read it

```
2.1.2 :006 > f = Txt2Speech.load "README.md"
 => #<Txt2Speech:0x00000002ef8b00 @text="txt2Speech is a simple ruby script that convert text to speech by using Google Translate.\r\n\r\n```\r\n2.1.2 :001 > require './txt2speech.rb'\r\n => true\r\n2.1.2 :002 > f = Txt2Speech.new \"Hello I am google! Nice to meet you\"\r\n => #<Txt2Speech:0x000000018aafd8 @text=\"Hello I am google! Nice to meet you\", @lang=\"en\">\r\n2.1.2 :003 > f.save(\"out.mp3\")\r\n => \"out.mp3\"\r\n```\r\n\r\nor you can load a text file to read it\r\n\r\n```\r\nt = Txt2Speech.load \"\#{Dir.home}/text.txt\"\r\nt.save(\"out.mp3\")\r\n```", @lang="en">
2.1.2 :007 > f.save("out.mp3")
```