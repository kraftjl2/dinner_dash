class Order < ActiveRecord::Base
  
  # -------------------------------------- Associations
  belongs_to :user
  has_and_belongs_to_many :items
  
  # -------------------------------------- Validations
  validates_presence_of :user_id
  validate :minimum_order_size
  
end
