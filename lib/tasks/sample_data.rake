namespace :db do
  desc "Fill database with sample data"
  task :populate => :environment do
    Rake::Task['db:reset'].invoke
    
    10.times do |n|
      name = "Product_#{n + 1}"
      description = "#{name}=>description,balbalbal"
      Product.create!(name: name,
                      description: description)
    end
  end
end
