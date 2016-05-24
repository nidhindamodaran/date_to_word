# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'date_to_word/version'

Gem::Specification.new do |spec|
  spec.name          = "date_to_word"
  spec.version       = DateToWord::VERSION
  spec.authors       = ["Nidhin Nambiar"]
  spec.email         = ["dnidhin5@gmail.com"]

  spec.summary       = %q{ruby gem to convert date in to words}
  spec.description   = %q{Using date_to_word gem it is possible to convert ruby date object into words}
  spec.homepage      = "http://github.com/nidhinnambiar/date_to_word"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org by setting 'allowed_push_host', or
  # delete this section to allow pushing this gem to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "https://rubygems.org"
  else
    raise "RubyGems 2.0 or newer is required to protect against public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rake", "~> 10.0"
end
