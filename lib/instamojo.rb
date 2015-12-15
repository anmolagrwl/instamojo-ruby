# http://guides.rubygems.org/make-your-own-gem/#your-first-gem
# https://blog.engineyard.com/2014/wrapping-your-api-in-a-ruby-gem
# http://guides.rubygems.org/rubygems-org-api/
# Integrating_Instamojo_v1_2.pdf
# https://github.com/Instamojo/instamojo-py/blob/master/instamojo/api.py
# https://www.instamojo.com/developers/rest/
require 'httparty'

class Instamojo

  @headers = { "X-Api-Key" => "cbd5e5bdfa7227960d1e4170cca8308c", "X-Auth-Token" => "cf6c7f98831144957e1913f40bd1c1a7" }

  def self.debug
    response = HTTParty.get('https://www.instamojo.com/api/1.1/debug/', :headers => @headers)
    puts response.body
  end

  def self.hi
    puts "hello world"
  end

end
