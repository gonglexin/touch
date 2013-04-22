class Content < ActiveRecord::Base
  #attr_accessible :body, :page_name
  validates :body, presence: true
end
