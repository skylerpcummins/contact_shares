require 'addressable/uri'
require 'rest-client'



def create_user
  url = Addressable::URI.new(
    scheme: 'http',
    host: 'localhost',
    port: 3000,
    path: '/users.json'
  ).to_s
  begin
    puts RestClient.post(
      url,
      {user: { username: "third username" }}
    )
  rescue RestClient::Exception
    puts "Incorrect number of parameters"
  end


end


# create_user


url2 =   url = Addressable::URI.new(
    scheme: 'http',
    host: 'localhost',
    port: 3000,
    path: '/contacts/1'
  ).to_s

puts RestClient.get(url2)
