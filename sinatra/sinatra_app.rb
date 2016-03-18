require 'json'
get '/' do  
  url = URI.parse("https://apis-guru.github.io/api-models/api/v1/list.json")
  "... Something is Wrong ..." unless Net::HTTP.get_response(url).kind_of?(Net::HTTPSuccess) 
  response = JSON.parse(Net::HTTP::get(url))
  page = ''
  response.each do |key,value|
    page += "<p><a href='#{value['versions'][value['preferred']]['swaggerYamlUrl']}' target='_blank'>#{key}</a></p>"
  end
  page
end

