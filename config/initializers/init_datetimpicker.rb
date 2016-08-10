# Example "11/03/2016 13:00"
ActiveAdminDatetimepicker::Base.default_datetime_picker_options = {
    format: 'Y-m-d H:i:s', # JS format
    defaultTime: proc { Time.current.strftime("%Y-%m-%d %H:%M:%S") } # not necessary
}
ActiveAdminDatetimepicker::Base.format = "%Y-%m-%d %H:%M:%S" # Ruby format