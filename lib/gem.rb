# http://guides.rubygems.org/make-your-own-gem/#your-first-gem
# https://blog.engineyard.com/2014/wrapping-your-api-in-a-ruby-gem
# http://guides.rubygems.org/rubygems-org-api/
# Integrating_Instamojo_v1_2.pdf
# https://github.com/Instamojo/instamojo-py/blob/master/instamojo/api.py
# https://www.instamojo.com/developers/rest/
# https://github.com/jnunemaker/httparty
# http://blog.teamtreehouse.com/its-time-to-httparty
require 'httparty'

  @api_key = 'cbd5e5bdfa7227960d1e4170cca8308c'
  @auth_token = 'cf6c7f98831144957e1913f40bd1c1a7'

  @base_url = "https://www.instamojo.com/api/1.1/"
  @headers = { "X-Api-Key" => @api_key, "X-Auth-Token" => @auth_token }

  def api_call(method)
    return  "#{@base_url}#{method}"
  end

  def debug
    response = HTTParty.get(api_call("debug/"), :headers => @headers)
    puts response.body
  end

  debug
