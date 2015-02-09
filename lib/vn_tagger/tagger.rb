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
      @xml_result ||= uncached_xml_result
    end

    def uncached_xml_result
      xml_document = is_success? ? read_xml_document : blank_xml_document
      delete_output
      xml_document
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

    def output_exist?
      File.exists?(OUTPUT)
    end

    def is_success?
      @success && output_exist?
    end

    def write_to_file
      file = File.new(INPUT, 'w')
      file.write(@text)
      file.close
    end

    def normalize(string)
      string.to_s.gsub(/(\"|\')/, '')
    end

    def blank_xml_document
      Nokogiri::XML('')
    end

    def read_xml_document
      file = File.open(OUTPUT)
      xml_document = Nokogiri::XML(file)
      file.close
      xml_document
    end

    def delete_output
      if output_exist?
        File.delete(OUTPUT)
      end
    end
  end
end
