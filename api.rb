@base_url = "instamojo.com/"

def api_call(method)
  puts  "#{@base_url}#{method}"
end

api_call("debug/")
