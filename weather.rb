require "yahoo_weatherman"
puts "What is your zipcode?"
location = gets

client = Weatherman::Client.new



temp = client.lookup_by_location(location).condition['temp']
condition = client.lookup_by_location(location).condition['text']

puts "The current temp is #{temp} and it is #{condition}" 


