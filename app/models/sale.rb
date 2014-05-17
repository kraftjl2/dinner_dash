class Sale < ActiveRecord::Base
  attr_accessible :items, :discount, :title, :active
  
    # -------------------------------------- Associations

  has_many :items
  
 # ------------------------------------------- validations
  
  validates :discount, :numericality => { :greater_than_or_equal_to => 0 }
  
end
