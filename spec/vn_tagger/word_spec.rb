require 'spec_helper'

describe VnTagger::Word do
  describe '#is_tag?' do
    let(:word) { described_class.new('N', 'text') }
    subject { word.is_tag?(tag) }

    context 'when tag is the same with word position' do
      let(:tag) { 'Common noun' }
      it { is_expected.to eq true }
    end

    context 'when tag is not the same with word position' do
      let(:tag) { 'Verb' }
      it { is_expected.to eq false }
    end
  end
end
