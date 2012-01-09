class Product < ActiveRecord::Base
  mount_uploader :image, ImageUploader
  belongs_to :category

  validates :name, :presence => true, :uniqueness => true
  validates :description, :presence => true

end
