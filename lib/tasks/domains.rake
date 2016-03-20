task :default => :domains

task :domains => [:push_new_domains_to_heroku] do

end

desc "This task grabs new domain names from your database and adds them to heroku!"
task :get_database_domains do
  puts "Finding domains..."

  database_domains = Unirest.get("http://www.nearr.me/api/v1/brands/all.json").body

  @domains = []

  database_domains.each do |key, value|
    @domains << key["brand_subdomain"] + "." + key["brand_url"]
  end

  puts "*" * 100
  puts @domains
  puts "*" * 100

  puts "DONE."
end

task :get_heroku_domains => [:get_database_domains] do
  heroku = Heroku::API.new(:username => ENV['HEROKU_USER'], :password => ENV['HEROKU_PASS'])
  puts "Finding heroku domains..."
  heroku_list = heroku.get_domains("fierce-caverns-77919").body

  @heroku_domains = []
  
  heroku_list.each do |key, value|
    @heroku_domains << key["domain"]
  end

  puts "*" * 100
  puts @heroku_domains
  puts "*" * 100

  puts "DONE."
end

task :compare_domain => [:get_database_domains, :get_heroku_domains] do
  puts "Comparing database domains to heroku domains..."

  @new_domains = (@domains - @heroku_domains)

  puts @new_domains

  puts "DONE."
end

task :push_new_domains_to_heroku => [:compare_domain, :get_database_domains, :get_heroku_domains] do
  heroku = Heroku::API.new(:username => ENV['HEROKU_USER'], :password => ENV['HEROKU_PASS'])
  puts "Posting new domains to heroku..."
  
  @new_domains.each do |domain|
    heroku.post_domain("fierce-caverns-77919", domain)
    # `heroku domains:add #{domain}`
  end

  puts "DONE."

end