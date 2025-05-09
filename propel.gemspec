# frozen_string_literal: true

require_relative "lib/propel/version"

Gem::Specification.new do |spec|
  spec.name         = "propel"
  spec.version      = Propel::VERSION
  spec.authors      = ["thnkr-one"]
  spec.email        = ["jacob@thnk.com"]
  spec.summary      = "A gem for generating PDFs and adjusting inventory for products."
  spec.description  = "Provides functionalities to generate various types of PDFs for product labels and handle inventory adjustments based on commands."
  # spec.homepage = "Put your gem's website or public repo URL here."
  spec.required_ruby_version = ">= 3.0.0"
  # spec.metadata["allowed_push_host"] = "TODO: Set to your gem server 'https://example.com'"
  # spec.metadata["homepage_uri"] = spec.homepage
  # spec.metadata["source_code_uri"] = "TODO: Put your gem's public repo URL here."
  # spec.metadata["changelog_uri"] = "TODO: Put your gem's CHANGELOG.md URL here."
  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  gemspec = File.basename(__FILE__)
  spec.files = IO.popen(%w[git ls-files -z], chdir: __dir__, err: IO::NULL) do |ls|
    ls.readlines("\x0", chomp: true).reject do |f|
      (f == gemspec) ||
        f.start_with?(*%w[bin/ test/ spec/ features/ .git .github appveyor Gemfile])
    end
  end
  spec.bindir          = "exe"
  spec.executables     = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths   = ["lib"]
  # spec.add_dependency "barby-outputter-prawn", "~> 1.5"
  spec.add_dependency 'active_storage_validations'
  # For more information and examples about making a new gem, check out our
  # guide at: https://bundler.io/guides/creating_gem.html
end
