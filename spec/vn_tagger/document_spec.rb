require 'spec_helper'

describe VnTagger::Document do
  let(:xml_text) { '<doc><s><w pos="Np">HLV</w></s></doc>' }
  let(:xml_document) { Nokogiri::XML(xml_text) }
  let(:document) { described_class.new(xml_document) }

  describe '#words' do
    it 'returns data extract from xml document' do
      word = document.words.first
      expect(word.text).to eq 'HLV'
      expect(word.position).to eq 'Np'
    end
  end

  describe '#proper_noun_words' do
    subject { document.proper_noun_words }
    it { is_expected.to eq ['HLV'] }
  end
end
