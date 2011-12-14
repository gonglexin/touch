namespace :db do
  desc "Fill database with sample data"
  task :populate => :environment do
    Rake::Task['db:reset'].invoke
    
    10.times do |n|
      name = "Product_#{n}"
      description = "#{name}=>description"
      Product.create!(name: name,
                      description: description)
    end
  end
end
