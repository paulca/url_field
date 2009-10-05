Gem::Specification.new do |s|
  s.name = "url_field"
  s.version = "0.0.1"
  s.author = "Paul Campbell"
  s.email = "paul@rslw.com"
  s.homepage = "http://www.github.com/paulca/url_field"
  s.platform = Gem::Platform::RUBY
  s.summary = "A simple ActiveRecord plugin to correctly format a URL in the database whether the user enters 'http://' or not"
  s.files = ["init.rb", "lib/url_field.rb", "Rakefile", "README.textile", "spec/spec_helper.rb", "spec/url_field_spec.rb"]
  s.require_path = "lib"
  s.has_rdoc = false
  s.extra_rdoc_files = ["README.textile"]
end