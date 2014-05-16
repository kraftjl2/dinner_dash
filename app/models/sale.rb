class Sale < ActiveRecord::Base
  attr_accessible :items, :discount, :title, :active
  
    # -------------------------------------- Associations

  has_many :items
  
end
