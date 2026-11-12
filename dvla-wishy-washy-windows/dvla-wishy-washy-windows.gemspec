# frozen_string_literal: true

require_relative 'lib/dvla/wishy/washy/windows/version'

Gem::Specification.new do |spec|
  spec.name = 'dvla-wishy-washy-windows'
  spec.version = DVLA::Wishy::Washy::Windows::VERSION
  spec.authors = ['Leighton Taylor']
  spec.email = ['lmtaylor96@hotmail.com']
  spec.license = 'Nonstandard'

  spec.summary = 'Window wahing service customer and booking service'
  spec.homepage = 'https://github.com/BuckTaylor23/seo-coding-assessment'
  spec.required_ruby_version = '>= 4.0'

  spec.metadata['homepage_uri'] = spec.homepage
  spec.metadata['source_code_uri'] = 'https://github.com/BuckTaylor23/seo-coding-assessment'

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  gemspec = File.basename(__FILE__)
  spec.files = IO.popen(%w[git ls-files -z], chdir: __dir__, err: IO::NULL) do |ls|
    ls.readlines("\x0", chomp: true).reject do |f|
      (f == gemspec) ||
        f.start_with?(*%w[bin/ test/ spec/ features/ .git appveyor Gemfile])
    end
  end
  spec.bindir = 'exe'
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = %w[lib]
end
