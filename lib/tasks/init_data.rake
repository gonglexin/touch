namespace :db do
  desc "Initiate database data"
  task :initiate => :environment do
    Category.create!(name: 'root')
    Admin.create!(email: 'user@example.com',
                  password: 'password_here',
                  password_confirmation: 'password_here')
  end
end
