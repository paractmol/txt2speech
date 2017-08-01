require 'spec_helper'
require 'fileutils'
require './lib/txt2speech'

RSpec.describe Txt2Speech::Speech, '#new' do
  context 'with english text' do
    let!(:output_path) { '/tmp/txt2speech.mp4' }

    it 'converts string to the audio file' do
      @speech = Txt2Speech::Speech.new('Hello World')
    end

    it 'converts string longer than 150 character into the audio file' do
      @speech = Txt2Speech::Speech.new('Super long string abcdef' * 10)
    end

    it 'load a file and save it to audio file' do
      File.open('/tmp/txt2speech.txt', 'w+') do |f|
        f.write('Hello World from file')
      end

      @speech = Txt2Speech::Speech.load('/tmp/txt2speech.txt')
    end

    after(:each) do
      @speech.save(output_path)
      expect(File.exist?(output_path)).to eq(true)
      expect(File.size(output_path)).to be > 0
      [output_path, '/tmp/txt2speech.txt'].each do |f|
        FileUtils.rm(f) if File.exist?(f)
      end
    end
  end
end
