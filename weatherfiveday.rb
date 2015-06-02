require 'yahoo_weatherman'

puts "what is your zipcode"
location = gets.chomp

def get_location(location)
  client = Weatherman::Client.new
  client.lookup_by_location(location)
end
 
weather = get_location('90210')
 
today = Time.now.strftime('%w').to_i
 
weather.forecasts.each do |forecast|
 
day = forecast['date']
 
weekday = day.strftime('%w').to_i

lowtemp = forecast['low'] * 1.8 + 32
hightemp = forecast['high'] * 1.8 + 32
 
if weekday == today
   dayName = 'Today'
elsif weekday == today + 1
   dayName = 'Tomorrow'
else
   dayName = day.strftime('%A')
end
 
puts dayName + ' is going to be ' + 
forecast['text'].downcase + 
" with a high of #{hightemp.to_i}" + 
" and a low of #{lowtemp.to_i} "

 
end