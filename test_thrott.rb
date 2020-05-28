require 'net/http'
require 'uri'
require 'json'

for i in 1..300
  p "\n------------------\n"
  print "Welcome #{i} times"
  p "\n"

  uri = URI.parse("http://localhost:3000/api/v1/users")
  request = Net::HTTP::Get.new(uri)
  request["Authorization"] = "Token token=wAL5igqC2ZBkjNAfeH8BYAtt"

  req_options = {
    use_ssl: uri.scheme == "https",
  }

  response = Net::HTTP.start(uri.hostname, uri.port, req_options) do |http|
    http.request(request)
  end

  p response.code
  p JSON.parse response.body
end
