txt2Speech lifehack of using Google Translate. Allow you to convert text into speech.

```
bin/txt2speech -r README.md -f -o example.mp3
```

to change language to read

```
bin/txt2speech -r examples/de.txt -f -l de
```

### To use library directly in your application just install gem and run 

```
2.1.2 :001 > require 'txt2speech'
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

Supplemental publishing:
[Text to Speech? Lifehack of using Google Translate](http://jaredlevitz.com/post/105204717375/text-to-speech-lifehack-of-using-google-translate)

The MIT License (MIT)

Copyright (c) 2014 Jared Levitz <jared.levitz@gmail.com>

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.