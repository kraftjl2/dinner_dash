class User < ActiveRecord::Base
  
  # -------------------------------------- Associations

  has_many :orders
  
  #--------------------------------------- Validations
  
  validates_presence_of :name, :email
  validates_uniqueness_of :email, case_sensitive: false
  
end
