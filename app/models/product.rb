class Product < ActiveRecord::Base
  mount_uploader :image, ImageUploader
  belongs_to :category

  validates :name,        :presence => true, :uniqueness => true
  validates :category,    :presence => true
  validates :description, :presence => true
  validates :image,       :presence => true

end
