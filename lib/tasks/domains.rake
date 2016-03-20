task :default => :domains

task :domains => [:get_database_domains] do

end

desc "This task grabs new domain names from your database and adds them to heroku!"
task :get_database_domains do
  puts "Finding domains..."
  
  database_domains = Unirest.get("http://www.lvh.me:3000/api/v1/brands.json").body

  domains = []

  database_domains.each do |brand|
    domains << brand.brand_subdomain + "." + brand.brand_url
  end

  puts domains
  puts "done."
end

# task :get_heroku_domains => [:get_database_domains] do
#   puts "Finding heroku domains..."

#   puts "done."
# end