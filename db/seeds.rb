# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

about             = Content.new
contact           = Content.new
about.page_name   = 'about'
contact.page_name = 'contact'

about.body = <<-ABOUT
<h2>About Us</h2><span>We are the best seller in China<br><br>website:&nbsp;<a target="_blank" rel="nofollow" href="http://justelec.com/">http://justelec.com/ </a><br></span>
ABOUT

contact.body = <<-CONTACT
<h2>Contact Us</h2><br>QQ: 286896969<br>Tel: 13874838580<br>Email: gonglexin@gmail.com<br>
CONTACT

# Default contents for about & contact pages
about.save
contact.save

# A root category
Category.create!(name: 'root')
# A admin user
Admin.create!(email: 'user@example.com',
              password: 'password_here',
              password_confirmation: 'password_here')
