# https://www.instamojo.com/developers/request-a-payment-api/
require 'httparty'

class Instamojo

  @api_key = nil
  @auth_token = nil
  @headers = nil

  def initialize(api_key, auth_token)
      @api_key = api_key
      @auth_token = auth_token
      @headers = { "X-Api-Key" => @api_key, "X-Auth-Token" => @auth_token }
  end

  def api_call(method)
    return  "https://www.instamojo.com/api/1.1/#{method}"
  end

  def debug
    response = HTTParty.get(api_call("debug/"), :headers => @headers)
    puts response.body
  end

  # Authentication
  # --------------------

  def login(username, password)
    response = HTTParty.get(api_call("auth/"), :headers => @headers,
               body: { username: username, password: password })
    puts response.body
  end

  def new_auth_token(username, password)
    response = HTTParty.post(api_call("tokens/"), :headers => { "X-Api-Key" => @api_key},
               body: { username: username, password: password })
    puts response.body
  end

  def list_auth_tokens
    response = HTTParty.get(api_call("tokens/"), :headers => @headers)
    puts response.body
  end

  def delete_auth_token(auth_token)
    response = HTTParty.delete(api_call("tokens/#{auth_token}"), :headers => @headers)
    puts response.body
  end

  # Link
  # --------------------

  def get_all_links
    response = HTTParty.get(api_call("links/"), :headers => @headers)
    puts response.body
  end

  def new_link(object)
    response = HTTParty.post(api_call("links/"), :headers => @headers,
      body:  { title: object[:title], description: object[:description], currency: object[:currency], base_price: object[:base_price] }
    )
    puts response.body
  end

  def get_file_upload_url
    response = HTTParty.get(api_call("links/get_file_upload_url/"), :headers => @headers)
    puts response.body
  end

  def upload_file # based on above link AND have to check if it's working
    # https://github.com/jwagener/httmultiparty
  end

  def link_details(slug)
    response = HTTParty.get(api_call("links/#{slug}"), :headers => @headers)
    puts response.body
  end

  def archive_link
    # ....
  end

  # Payments
  # --------------------

  def list_all_payments
    response = HTTParty.get(api_call("payments/"), :headers => @headers)
    puts response.body
  end

  # Filter List of All Payments by Date
  def method_name
    # ...
  end

  def payment_details(payment_id) # have to check if it is working
    response = HTTParty.get(api_call("payments/#{payment_id}/"), :headers => @headers)
    puts response.body
  end

  # Refunds (have to check all these if they are working)
  # --------------------

  def new_refund
    response = HTTParty.post(api_call("refunds/"), :headers => @headers,
      body: { payment_id: "1234", type: "RFD", body: "refunded due to duplicate payment"}
    )
    puts response.body
  end

  def refunds_list
    response = HTTParty.get(api_call("refunds/"), :headers => @headers)
    puts response.body
  end

  def refund_details(refund_id)
    response = HTTParty.get(api_call("refunds/#{refund_id}"), :headers => @headers)
    puts response.body
  end

  # Request a payment (RAP)
  # --------------------

  def new_rap()
    response = HTTParty.post(api_call("payment-requests/"), :headers => @headers,
      body: { purpose: purpose, amount: amount, buyer_name: buyer_name, email: email,
        phone: phone, send_email: send_email, send_sms: send_sms, redirect_url: redirect_url,
        webhook:webhook, allow_repeated_payments:allow_repeated_payments}
    )
    puts response.body
  end

  def rap_details(rap_id)
    response = HTTParty.get(api_call("payment-requests/#{rap_id}"), :headers => @headers)
    puts response.body
  end

  def list_all_rap
    response = HTTParty.get(api_call("payment-requests/"), :headers => @headers)
    puts response.body
  end

  def filter_rap()
    response = HTTParty.get(api_call("payment-requests/"), :headers => @headers,
                body: { min_created_at: min_created_at, max_created_at: max_created_at, min_modified_at: min_modified_at, max_modified_at:max_modified_at})
    puts response.body
  end

end
