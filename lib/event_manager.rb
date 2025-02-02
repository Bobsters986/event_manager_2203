# ./lib/event_manager.rb
require "csv"

# def clean_zipcode(zipcode)
#   if zipcode.nil?
#     "00000"
#   elsif zipcode.length < 5
#     zipcode.rjust(5,"0")
#   elsif zipcode.length > 5
#     zipcode[0..4]
#   else
#     zipcode
#   end
# end

#clean_zipcode Refactor
def clean_zipcode(zipcode)
  zipcode.to_s.rjust(5,"0")[0..4]
end

puts "EventManager initialized."

contents = CSV.open "./data/event_attendees.csv", headers: true, header_converters: :symbol
contents.each do |row|
  name = row[:first_name]

  zipcode = clean_zipcode(row[:zipcode])

  puts "#{name} #{zipcode}"
end


# if the zip code is exactly five digits, assume that it is ok
  # if the zip code is more than 5 digits, truncate it to the first 5 digits
  # if the zip code is less than 5 digits, add zeros to the front until it becomes five digits