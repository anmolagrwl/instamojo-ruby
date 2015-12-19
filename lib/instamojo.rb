# JSON.parse(d)["success"]
# JSON.parse(response.body)

# TODO:
# - upload_file
# - archive_link
# - Filter List of All Payments by Date
# - check if I could return JSON object
# - add README
require 'rubygems'
require 'httparty'
require 'json'

class Instamojo

  @api_key = nil
  @auth_token = nil
  @headers = nil

  def initialize(api_key: api_key, auth_token: auth_token)
      @api_key = api_key
      @auth_token = auth_token
      @headers = { "X-Api-Key" => @api_key, "X-Auth-Token" => @auth_token }
  end

  def api_call(method)
    return  "https://www.instamojo.com/api/1.1/#{method}"
  end

  def debug
    response = HTTParty.get(api_call("debug/"), :headers => @headers)
    return JSON.parse(response.body)
  end

  # Authentication
  # --------------------

  def login(username: username, password: password)
    response = HTTParty.get(api_call("auth/"), :headers => @headers,
               body: { username: username, password: password })
    return JSON.parse(response.body)
  end

  # def new_auth_token(username, password)
  #   response = HTTParty.post(api_call("tokens/"), :headers => { "X-Api-Key" => @api_key},
  #              body: { username: username, password: password })
  #   return JSON.parse(response.body)
  # end

  def list_auth_tokens
    response = HTTParty.get(api_call("tokens/"), :headers => @headers)
    return JSON.parse(response.body)
  end

  # def delete_auth_token(auth_token)
  #   response = HTTParty.delete(api_call("tokens/#{auth_token}"), :headers => @headers)
  #   return JSON.parse(response.body)
  # end

  # Link
  # --------------------

  def get_all_links
    response = HTTParty.get(api_call("links/"), :headers => @headers)
    return JSON.parse(response.body)
  end

  def new_link(title: nil, description: nil, currency: 'INR', base_price: nil, quantity: nil,
                start_date: nil, end_date: nil, venue: nil, timezone: nil, redirect_url: nil,
                webhook_url: nil, note: nil, file_upload_json: nil, cover_image_json: nil, enable_pwyw: nil, enable_sign: nil )

    response = HTTParty.post(api_call("links/"), :headers => @headers,
      body:  { title: title, description: description, currency: currency, base_price: base_price, quantity: quantity,
              start_date: start_date, end_date: end_date, venue: venue, timezone: timezone, redirect_url: redirect_url,
              webhook_url: webhook_url, note: note, file_upload_json: file_upload_json, cover_image_json: cover_image_json,
              enable_pwyw: enable_pwyw, enable_sign: enable_sign }
    )
    return JSON.parse(response.body)
  end

  def get_file_upload_url
    response = HTTParty.get(api_call("links/get_file_upload_url/"), :headers => @headers)
    return JSON.parse(response.body)
  end

  def upload_file # based on above link AND have to check if it's working
    # https://github.com/jwagener/httmultiparty
  end

  def link_details(slug: slug)
    response = HTTParty.get(api_call("links/#{slug}"), :headers => @headers)
    return JSON.parse(response.body)
  end

  def archive_link
    # ....
  end

  # Payments
  # --------------------

  def list_all_payments
    response = HTTParty.get(api_call("payments/"), :headers => @headers)
    return JSON.parse(response.body)
  end

  # Filter List of All Payments by Date
  def method_name
    # ...
  end

  def payment_details(payment_id: payment_id) # have to check if it is working
    response = HTTParty.get(api_call("payments/#{payment_id}/"), :headers => @headers)
    return JSON.parse(response.body)
  end

  # Refunds (have to check all these if they are working)
  # --------------------

  def new_refund(payment_id: nil, type: nil, body: nil)
    response = HTTParty.post(api_call("refunds/"), :headers => @headers,
      body: { payment_id: payment_id, type: type, body: body}
    )
    return JSON.parse(response.body)
  end

  def refunds_list
    response = HTTParty.get(api_call("refunds/"), :headers => @headers)
    return JSON.parse(response.body)
  end

  def refund_details(refund_id: nil)
    response = HTTParty.get(api_call("refunds/#{refund_id}"), :headers => @headers)
    return JSON.parse(response.body)
  end

  # Request a payment (RAP)
  # --------------------

  def new_rap(purpose: nil, amount: nil, buyer_name: nil, email: nil, phone: nil, send_email: nil, send_sms: nil, redirect_url: nil, webhook: nil, allow_repeated_payments: nil)
    response = HTTParty.post(api_call("payment-requests/"), :headers => @headers,
      body: { purpose: purpose, amount: amount, buyer_name: buyer_name, email: email,
        phone: phone, send_email: send_email, send_sms: send_sms, redirect_url: redirect_url,
        webhook:webhook, allow_repeated_payments:allow_repeated_payments}
    )
    return JSON.parse(response.body)
  end

  def rap_details(rap_id: rap_id)
    response = HTTParty.get(api_call("payment-requests/#{rap_id}"), :headers => @headers)
    return JSON.parse(response.body)
  end

  def list_all_rap
    response = HTTParty.get(api_call("payment-requests/"), :headers => @headers)
    return JSON.parse(response.body)
  end

  def filter_rap(min_created_at: nil, max_created_at: nil, min_modified_at: nil, max_modified_at: nil)
    response = HTTParty.get(api_call("payment-requests/"), :headers => @headers,
                body: { min_created_at: min_created_at, max_created_at: max_created_at, min_modified_at: min_modified_at, max_modified_at:max_modified_at})
    return JSON.parse(response.body)
  end

end
