class Category < ActiveRecord::Base
  has_many :subcategories, :class_name => 'Category', :foreign_key => 'parent_id', :dependent => :destroy
  belongs_to :category

  has_many :products, :dependent => :destroy

  validates :name, :presence => true, :uniqueness => true
  validates :parent_id, :presence => true

  def parent
    parent = Category.find(self.parent_id)
    parent = nil if parent.name == 'root'
    parent
  end
end
