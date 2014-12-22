# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'vn_tagger/version'

Gem::Specification.new do |spec|
  spec.name          = "vn_tagger"
  spec.version       = VnTagger::VERSION
  spec.authors       = ["Hieu Nguyen"]
  spec.email         = ["hieuk09@gmail.com"]
  spec.summary       = %q{This is a wrapper for vn_tagger library, a A POS tagger for Vietnamese texts. }
  spec.description   = %q{This is a wrapper for vn_tagger library, a A POS tagger for Vietnamese texts. }
  spec.homepage      = "https://github.com/hieuk09/ruby_vn_tagger"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib", 'lib/vn_tagger']

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "byebug"
end
