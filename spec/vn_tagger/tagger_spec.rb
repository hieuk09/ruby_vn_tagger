require 'spec_helper'

describe VnTagger::Tagger do
  describe '#tag' do
    let(:text) { 'HLV cùa Chelsea không hối tiếc vì hành động bỏ về sớm trong trận gặp Aston Villa.' }
    let(:tagger) { described_class.new(text) }
    let(:result) { tagger.result }
    let(:word) { result.words.first }

    it 'returns xml tagged text' do
      tagger.tag
      expect(result).to be_a(VnTagger::Document)
      expect(word.position).to eq 'Np'
      expect(word.text).to eq 'HLV'
    end
  end
end
