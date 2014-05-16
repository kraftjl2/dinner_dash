class User < ActiveRecord::Base
  
  has_secure_password
  
  attr_accessible :name, :email, :password, :password_confirmation, :admin
  
  # -------------------------------------- Validations
  
  validates_uniqueness_of :email, case_sensitive: false
  validates_presence_of :name
  
 # -------------------------------------- Associations
  
  has_many :orders
  has_many :reviews
  
  has_many :items, through: :orders
  
  # -------------------------------------- Instance Methods
  
  def has_purchased?(item)
    item_ids.include?(item.id)
  end
  
end
