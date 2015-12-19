Gem::Specification.new do |s|
  s.name        = 'Instamojo'
  s.version     = '0.1.0'
  s.date        = '2016-12-25'
  s.summary     = "Ruby library for Instamojo API"
  s.description = "Assists you to programmatically create, edit and delete links on Instamojo."
  s.authors     = ["Anmol Agrawal"]
  s.email       = 'anmol1771@gmail.com'
  s.files       = ["lib/instamojo.rb"]
  s.homepage    = 'http://rubygems.org/gems/instamojo'
  s.license     = 'MIT'
  s.add_runtime_dependency 'httparty', '~> 0'
  # s.add_runtime_dependency 'json', '~> 0'
end
