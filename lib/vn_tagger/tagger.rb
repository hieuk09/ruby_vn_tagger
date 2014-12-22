require 'nokogiri'

module VnTagger
  class Tagger
    ROOT_PATH = File.expand_path('../../..', __FILE__)
    COMMAND = 'java -jar vn.hus.nlp.tagger-4.2.0.jar'
    INPUT = File.join(ROOT_PATH, 'input.txt')
    OUTPUT = File.join(ROOT_PATH, 'output.xml')

    def initialize(text)
      @text = normalize(text)
    end

    def tag
      write_to_file
      wasGood = system("cd #{ROOT_PATH}; #{COMMAND} -i #{INPUT} -o #{OUTPUT}")
      if wasGood
        result_from_output
      else
        nil
      end
    end

    def self.tag(text)
      new(text).tag
    end

    private

    def write_to_file
      file = File.new(INPUT, 'w')
      file.write(@text)
      file.close
    end

    def result_from_output
      file = File.open(OUTPUT)
      doc = Nokogiri::XML(file)
      file.close
      doc
    end

    def normalize(string)
      string.to_s.gsub(/(\"|\')/, '')
    end
  end
end
