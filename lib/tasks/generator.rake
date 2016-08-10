namespace :generator do

  desc "Generate slug for given model"

  task generate_slug: :environment do
    STDOUT.puts "Enter corrent modal name (box_type == BoxType) you want to generate slug: "
    modalname = STDIN.gets.strip

    STDOUT.puts "Are you sure? (y/n)"
    confirm = STDIN.gets.strip.downcase

    if confirm == "y"
      modalname.classify.constantize.all.map(&:save)
      STDOUT.puts "Yay! Rake Task Completed!"
    else
      STDOUT.puts "oop's bye bye ........!"
    end
  end

  # desc "Generate Sitemap XML"
  # task generate_sitemap: :environment do
  #   SitemapGenerator::Sitemap.default_host = 'http://www.holachef.com'
  #   SitemapGenerator::Sitemap.create do
  #     static_links = [
  #       daily_menus_path,
  #       food_delivery_areas_mumbai_and_pune_path,
  #       terms_and_condition_path,
  #       policy_path,
  #       quality_control_holachef_path,
  #       write_to_us_path,
  #       careers_path,
  #       events_path,
  #       holachef_team_path,
  #       holachef_believers_path,
  #       pincodes_path,
  #       sitemap_index_path,
  #       install_app_path
  #     ]
  #     #Static Links Path
  #     static_links.each do |static_link|
  #       add static_link, :changefreq => 'weekly', :priority => 0.9
  #     end

  #     #Food Items Path
  #     FoodItem.active.find_each do |food_item|
  #       add food_item_path(food_item), :changefreq => 'hourly', :priority => 0.9
  #     end

  #     #Cheffs Path
  #     Chef.not_archived.find_each do |chef|
  #       add chef_path(chef), :changefreq => 'weekly', :priority => 0.9
  #     end
  #   end
  #   SitemapGenerator::Sitemap.ping_search_engines 
  # end
end