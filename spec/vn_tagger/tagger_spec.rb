require 'spec_helper'

describe VnTagger::Tagger do
  describe '#tag' do
    let(:text) { 'HLV cùa Chelsea không hối tiếc vì hành động bỏ về sớm trong trận gặp Aston Villa.' }
    let(:tagger) { described_class.new(text) }
    let(:result) { tagger.tag }

    it 'returns xml tagged text' do
      expect(result).to be_a(Nokogiri::XML::Document)
    end
  end
end
