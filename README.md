# VnTagger

## Installation

Add this line to your application's Gemfile:

    gem 'vn_tagger'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install vn_tagger

## Usage

```
text = 'Mourinho là huấn luyện viên của Chelsea'
document = VnTagger::Tagger.tag(text)

document.to_xml # => "<?xml version=\"1.0\"?>\n<doc>\n\t<s>\n\t\t<w
pos=\"Np\">Mourinho</w>\n\t\t<w pos=\"V\">l&#xE0;</w>\n\t\t<w
pos=\"N\">hu&#x1EA5;n luy&#x1EC7;n vi&#xEA;n</w>\n\t\t<w
pos=\"E\">c&#x1EE7;a</w>\n\t\t<w pos=\"Np\">Chelsea</w>\n\t\t<w
pos=\".\">.</w>\n\t</s>\n</doc>\n"
```


## Contributing

1. Fork it ( https://github.com/hieuk09/vn_tagger/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
