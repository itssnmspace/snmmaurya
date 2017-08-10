json.status "Success"
json.message @message || "Request Successful"
if @options.present?
  @options.each do |key, value|
    json.set! key, @value.class == String ? value : value.join(",")
  end
end
json.current_time_stamp DateTime.now