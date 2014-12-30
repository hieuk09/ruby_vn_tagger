module VnTagger
  class Word
    attr_reader :position, :text

    WORD_POSITIONS = {
      'Np' => 'Proper noun',
      'Nc' => 'Classifier',
      'Nu' => 'Unit noun',
      'N' => 'Common noun',
      'V' => 'Verb',
      'A' => 'Adjective',
      'P' => 'Pronoun',
      'R' => 'Adverb',
      'L' => 'Determiner',
      'M' => 'Numeral',
      'E' => 'Preposition',
      'C' => 'Subordinating conjunction',
      'CC' => 'Coordinating conjunction',
      'I' => 'Interjection',
      'T' => 'Auxiliary, modal words',
      'Y' => 'Abbreviation',
      'Z' => 'Bound morphemes',
      'X' => 'Unknown'
    }

    def initialize(position, text)
      @position = position
      @text = text
    end

    def is_tag?(tag = 'Proper noun')
      WORD_POSITIONS[position] == tag
    end
  end
end
