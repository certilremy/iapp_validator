# frozen_string_literal: true

require_relative "lib/iapp_validator/version"

Gem::Specification.new do |spec|
  spec.name          = "iapp_validator"
  spec.version       = IappValidator::VERSION
  spec.authors       = ["certilremy"]
  spec.email         = ["certilremy@gmail.com"]

  spec.summary       = "A gem to validate Google Play purchases using the Android Publisher API"
  spec.description   = "IappValidator is a Ruby gem that helps developers validate in-app purchases made through Google Play, using a service account and the Google Android Publisher API."
  spec.homepage      = "https://github.com/certilremy/iapp_validator"
  spec.license       = "MIT"
  spec.required_ruby_version = ">= 3.0.0"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = spec.homepage
  spec.metadata["changelog_uri"] = "#{spec.homepage}/blob/main/CHANGELOG.md"

  gemspec = File.basename(__FILE__)
  spec.files = IO.popen(%w[git ls-files -z], chdir: __dir__, err: IO::NULL) do |ls|
    ls.readlines("\x0", chomp: true).reject do |f|
      (f == gemspec) ||
        f.start_with?(*%w[bin/ test/ spec/ features/ .git appveyor Gemfile])
    end
  end

  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "google-apis-androidpublisher_v3"
  spec.add_dependency "googleauth"
end