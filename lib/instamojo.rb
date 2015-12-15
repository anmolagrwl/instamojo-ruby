# http://guides.rubygems.org/make-your-own-gem/#your-first-gem
# https://blog.engineyard.com/2014/wrapping-your-api-in-a-ruby-gem
# http://guides.rubygems.org/rubygems-org-api/
# Integrating_Instamojo_v1_2.pdf
# https://github.com/Instamojo/instamojo-py/blob/master/instamojo/api.py
# https://www.instamojo.com/developers/rest/
# https://github.com/jnunemaker/httparty
# http://blog.teamtreehouse.com/its-time-to-httparty
require 'httparty'

class Instamojo

  @api_key = "cbd5e5bdfa7227960d1e4170cca8308c"
  @auth_token = "cf6c7f98831144957e1913f40bd1c1a7"

  @headers = { "X-Api-Key" => @api_key, "X-Auth-Token" => @auth_token }

  def self.debug
    response = HTTParty.get('https://www.instamojo.com/api/1.1/debug/', :headers => @headers)
    puts response.body
  end

  # Authentication

  def self.create_auth_token
    response = HTTParty.post('https://www.instamojo.com/api/1.1/tokens/', :headers => { "X-Api-Key" => @api_key})
    puts response.body
  end

  def self.list_auth_tokens
    response = HTTParty.get('https://www.instamojo.com/api/1.1/tokens/', :headers => @headers)
    puts response.body
  end

  def self.delete_auth_token(auth_token)
    response = HTTParty.delete('https://www.instamojo.com/api/1.1/tokens/#{auth_token}', :headers => @headers)
    puts response.body
  end

  # Link

  def self.get_all_links
    response = HTTParty.get('https://www.instamojo.com/api/1.1/links/', :headers => @headers)
    puts response.body
  end

  # http://stackoverflow.com/questions/19461333/how-can-i-implement-this-post-request-using-httparty
  def self.new_link
    response = HTTParty.post('https://www.instamojo.com/api/1.1/links/', :headers => @headers,
      :body => [{ "title" => "sample title", "description" => "sample description", "currency" => "INR", "base_price" => "10.00"}].to_json
    )
    puts response.body
  end

  def self.get_file_upload_url
    response = HTTParty.get('https://www.instamojo.com/api/1.1/links/get_file_upload_url/', :headers => @headers)
    puts response.body
  end

  def self.upload_file # based on above link
    # https://github.com/jwagener/httmultiparty
  end

  def self.link_details(slug)
    response = HTTParty.get('https://www.instamojo.com/api/1.1/links/#{slug}', :headers => @headers)
    puts response.body
  end

  def self.archive_link

  end

  # Payments

  def self.list_all_payments
    response = HTTParty.get('https://www.instamojo.com/api/1.1/payments/', :headers => @headers)
    puts response.body
  end

  # Filter List of All Payments by Date
  def method_name

  end

  def self.payment_details(payment_id)
    response = HTTParty.get('https://www.instamojo.com/api/1.1/payments/#{payment_id}/', :headers => @headers)
    puts response.body
  end

  # Refunds

  def self.new_refund
    response = HTTParty.post('https://www.instamojo.com/api/1.1/refunds/', :headers => @headers,
      :body => [{ "payment_id" => "1234", "type" => "RFD", "body" => "refunded due to duplicate payment"}].to_json
    )
    puts response.body
  end

  def self.refunds_list
    response = HTTParty.get('https://www.instamojo.com/api/1.1/refunds/', :headers => @headers)
    puts response.body
  end

  def self.refund_details(refund_id)
    response = HTTParty.get('https://www.instamojo.com/api/1.1/refunds/#{refund_id}', :headers => @headers)
    puts response.body
  end
  # def self.hi
  #   puts "hello world"
  # end

end
