# VnTagger

## Installation

Add this line to your application's Gemfile:

    gem 'vn_tagger'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install vn_tagger

## Usage Example

```ruby
text = 'Mourinho là huấn luyện viên của Chelsea'
document = VnTagger::Tagger.tag(text)

document.words.map { |word|
  [word.text, word.position]
} # => [["Mourinho", "Np"], ["là", "V"], ["huấn luyện viên", "N"], ["của", "E"], ["Chelsea", "Np"]]
```

## Contributing

1. Fork it ( https://github.com/hieuk09/vn_tagger/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
