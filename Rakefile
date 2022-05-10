
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "delete_derived_data/version"

GEM_NAME = "delete_derived_data"
GEM_VERSION = DeleteDerivedData::VERSION

task :default => :build

task :build do
  system "gem build " + GEM_NAME + ".gemspec"
end

task :install => :build do
  system "gem install " + GEM_NAME + "-" + GEM_VERSION + ".gem"
end

task :publish => :build do
  system 'gem push ' + GEM_NAME + "-" + GEM_VERSION + ".gem"
end

task :clean do
  system "rm *.gem"
end
