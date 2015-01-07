require 'word'

module VnTagger
  class Document
    attr_reader :xml_document

    def initialize(xml_document)
      @xml_document = xml_document
    end

    def words
      @words ||= uncached_words
    end

    def uncached_words
      xml_document.xpath('//w').map do |element|
        Word.new(element.attr('pos'), element.text)
      end
    end

    def filter_by_tag(tag = 'Proper noun')
      words.select { |word| word.is_tag?(tag) }
    end

    def proper_noun_words
      filter_by_tag('Proper noun').map(&:text)
    end
  end
end
