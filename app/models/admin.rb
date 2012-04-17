class Admin < ActiveRecord::Base
  has_secure_password
  attr_accessible :old_password
  attr_accessor :old_password
  validates_presence_of :password, :on => :create
end
