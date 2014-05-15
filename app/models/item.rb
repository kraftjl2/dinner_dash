class Item < ActiveRecord::Base
 
  attr_accessible :title, :description, :price, :category, :photo, :active
  
  # -------------------------------------- Validations
  
  validates_presence_of :title
  validates_presence_of :description
  validates :price, numericality: { only_integer: true, greater_than: 0 }
  validates_uniqueness_of :title, case_sensitive: false
  
  # -------------------------------------- Scope
  
  scope :active, -> { where(active: true)}
  
   # -------------------------------------- Associations
  
  belongs_to :category
  has_and_belongs_to_many :orders
  
end
