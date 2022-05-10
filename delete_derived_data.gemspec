
name = File.basename(__FILE__, ".gemspec")
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "delete_derived_data/version"

Gem::Specification.new do |spec|
  spec.name           = name
  spec.platform       = Gem::Platform::RUBY
  spec.version        = DeleteDerivedData::VERSION
  spec.summary        = "Delete all derived data!"
  spec.description    = "Search all DerivedData folders and moves files or folders to the trash. Empty the trash (asks for confirmation)"
  spec.authors        = ["Rogojan Nicolae"]
  spec.email          = 'rogojan.colea@gmail.com'
  spec.files          = Dir.glob("lib/**/*", File::FNM_DOTMATCH)
  spec.bindir         = "bin"
  spec.executables    << 'delete_derived_data'

  spec.add_dependency('tty-spinner', '~> 0.9.3')
  spec.add_dependency('tty-prompt', '~> 0.23.1')
  spec.add_dependency('tty-table', '~> 0.12.0')

  spec.homepage       = "https://github.com/rognick/delete_derived_data"
  spec.license        = 'MIT'
end
