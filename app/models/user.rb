class User < ActiveRecord::Base
  
  has_secure_password
  
  attr_accessible :name, :email, :password, :password_confirmation, :admin
  
  # -------------------------------------- Validations
  
  validates_uniqueness_of :email, case_sensitive: false
  validates_presence_of :name
  
 # -------------------------------------- Validations
  
  has_many :orders
  
end
