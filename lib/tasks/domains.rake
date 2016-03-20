task :default => :domains

task :domains => [:get_heroku_domains] do

end

desc "This task grabs new domain names from your database and adds them to heroku!"
task :get_database_domains do
  puts "Finding domains..."

  database_domains = Unirest.get("http://www.lvh.me:3000/api/v1/brands/all.json").body

  domains = []

  database_domains.each do |key, value|
    domains << key["brand_subdomain"] + "." + key["brand_url"]
  end

  puts domains
  puts "DONE."
end

task :get_heroku_domains => [:get_database_domains] do
  heroku = Heroku::API.new(:username => ENV['HEROKU_USER'], :password => ENV['HEROKU_PASS'])
  puts "Finding heroku domains..."
  heroku_list = heroku.get_domains("fierce-caverns-77919").body

  heroku_domains = []
  
  heroku_list.each do |key, value|
      heroku_domains << key["domain"]
  end

  puts heroku_domains
  puts "DONE."
end