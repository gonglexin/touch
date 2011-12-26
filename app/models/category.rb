class Category < ActiveRecord::Base
  has_many :subcategories, :class_name => 'Category', :foreign_key => 'parent_id'
  belongs_to :category, :class_name => 'Catetory'

  has_many :products
end
