# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

description = "Euismod dictumst nonummy imperdiet litora felis aptent. Dolor justo consequat augue vulputate. Condimentum montes taciti faucibus. Consectetuer Eu tempus convallis praesent nonummy eget sapien leo egestas interdum lorem nisl amet. Senectus primis potenti gravida sodales. Venenatis montes phasellus ad sapien augue mauris hymenaeos nulla."


STDOUT.puts "\nCreating Administrator user ....\n"
unless AdminUser.find_by email: "admin@snmmaurya.com"
  AdminUser.create(email: "admin@snmmaurya.com", password: "snmmaurya", password_confirmation: "snmmaurya")
end  
STDOUT.puts "\n.........................COMPLETED.........................\n"



STDOUT.puts "\nCreating User roles ....\n"
["master", "user"].each do |title|
  Role.where(title: title).first_or_create
end
STDOUT.puts "\n.........................COMPLETED.........................\n"



STDOUT.puts "\nCreating Site users ....\n"
["snm@snmmaurya.com", "usertwo@snmmaurya.com", "userthree@snmmaurya.com", "userfour@snmmaurya.com"].each do |user|
  unless User.find_by email: user
    User.create!(username: user.split("@").first, email: user, contact: '7666760715', role_id: Role.find_by(title: 'user').id, slug: user.split("@").first, password: 'snmmaurya', password_confirmation: 'snmmaurya')
  end
end
STDOUT.puts "\n.........................COMPLETED.........................\n"




STDOUT.puts "\nSetting Master user ....\n"
#Set Master User
User.find_by(email: "snm@snmmaurya.com").update_attribute(:role_id, Role.find_by(title: "master").id)
STDOUT.puts "\n.........................COMPLETED.........................\n"





#***************************************Image Assets*************************************************
STDOUT.puts "\nCreating image assets ....\n"
#Landing page image creation
["default_image_asset", "solutions", "programing_is_fun!_as_rubiest", "about", "contact", "blog", "portfolio"].each do |code|
  unless ImageAsset.find_by code: code
    image_asset = ImageAsset.new(code: code, title: code.humanize, action: "#", target: "_blnk")
    image_asset.save(validate: false)
  end
end
STDOUT.puts "\n.........................COMPLETED.........................\n"
#***************************************Image Assets*************************************************




STDOUT.puts "\nCreating Topics ....\n"
["Ruby", "Ruby On Rails"].each do |title|
  unless Topic.find_by title: title
    topic = Topic.new(title: title, description: description)
    topic.save(validate: false)
  end
end
STDOUT.puts "\n.........................COMPLETED.........................\n"




STDOUT.puts "\nCreating Rubiest ....\n"
unless Rubiest.find_by title: "What is Ruby?"
  rubiest = Rubiest.new(title: "What is Ruby?", description: description)
  rubiest.save(validate: false)
end
STDOUT.puts "\n.........................COMPLETED.........................\n"





STDOUT.puts "\nCreating Blogs ....\n"
["Who developed Ruby and when. previous name of ruby ?", "Why Ruby On Rails"].each do |title|
  unless Blog.find_by title: title
    blog = Blog.new(title: title, description: description)
    blog.save(validate: false)
  end
end
STDOUT.puts "\n.........................COMPLETED.........................\n"