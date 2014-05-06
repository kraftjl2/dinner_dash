class User < ActiveRecord::Base
  
  # -------------------------------------- Validations

  has_many :orders
  
end
