require 'nokogiri'

module VnTagger
  class Tagger
    ROOT_PATH = Dir.pwd
    COMMAND = File.join(ROOT_PATH, 'vnTagger.sh')
    INPUT = File.join(ROOT_PATH, 'input.txt')
    OUTPUT = File.join(ROOT_PATH, 'output.xml')

    def initialize(text)
      @text = text
    end

    def tag
      write_to_file
      wasGood = system(COMMAND, '-i', INPUT, '-o', OUTPUT)
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
  end
end
