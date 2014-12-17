require 'vn_tagger/tagger'

module VnTagger
  def tag(text)
    Tagger.tag(text)
  end
end
