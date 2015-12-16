@base_url = "https://www.instamojo.com/api/1.1/"

def api_call(method)
  puts (@base_url + method).to_s
end
