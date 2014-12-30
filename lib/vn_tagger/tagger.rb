require 'nokogiri'
require 'document'

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
      @success = system("cd #{ROOT_PATH}; #{COMMAND} -i #{INPUT} -o #{OUTPUT}")
    end

    def xml_result
      @xml_result ||= if @success
                        file = File.open(OUTPUT)
                        xml_document = Nokogiri::XML(file)
                        file.close
                        xml_document
                      else
                        Nokogiri::XML('')
                      end
    end

    def result
      @result ||= Document.new(xml_result)
    end

    def self.tag(text)
      tagger = new(text)
      tagger.tag
      tagger.result
    end

    private

    def write_to_file
      file = File.new(INPUT, 'w')
      file.write(@text)
      file.close
    end

    def normalize(string)
      string.to_s.gsub(/(\"|\')/, '')
    end
  end
end
