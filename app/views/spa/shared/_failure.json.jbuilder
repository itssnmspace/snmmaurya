json.status "Error"
@options.each do |key, value|
  json.set! key, value.class == String ? value : value.join(",")
end
json.current_time_stamp DateTime.now