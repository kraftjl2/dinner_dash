class Category < ActiveRecord::Base
  
  attr_accessible :title
  
   # -------------------------------------- Validations
  
  validates_presence_of :title
  
   # -------------------------------------- Associations
  
  has_many :items

  
end
