require 'spec_helper'

describe VnTagger::Tagger do
  describe '#tag' do
    context 'when tags successfully' do
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

    context 'when there is error' do
      let(:text) { 'mourinho@chelsea: HLV cùa Chelsea không hối tiếc vì hành động bỏ về sớm trong trận gặp Aston Villa.' }
      let(:tagger) { described_class.new(text) }
      let(:result) { tagger.result }
      let(:word) { result.words.first }

      it 'returns xml tagged text' do
        tagger.tag
        expect(result).to be_a(VnTagger::Document)
        expect(word).to be_nil
      end
    end
  end
end
