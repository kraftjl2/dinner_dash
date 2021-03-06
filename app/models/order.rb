class Order < ActiveRecord::Base
  
  include ItemCalculation
  
  attr_accessible :pickup_at, :user, :items, :order_status
  
  # -------------------------------------- Associations
  
  belongs_to :user
  has_and_belongs_to_many :items
  
  # -------------------------------------- Validations
  
  validates_presence_of :user_id
  validate :minimum_order_size
  validate :earliest_pickup_at, on: :create
  validate :open_for_business, on: :create
  
  # -------------------------------------- Callbacks
  
  # When a new order is saved, automatically set 
  # the default order status
  before_validation(on: :create) do
    self.pickup_at  ||= Time.zone.now + 15.minutes
    self.order_status = Order.order_statuses.first
  end
  
  # -------------------------------------- Instance Methods
  
  
  def minimum_order_size
    errors.add(:items, 'must contain at least one') if items.none?
  end
  
   def earliest_pickup_at
    errors.add(:pickup_at, 'must be further in the future') if pickup_at < calculate_earliest_pickup_at
  end
  
   def open_for_business
    unless (9..17).include?(pickup_at.hour)
      errors.add(:pickup_at, 'is while the kitchen is closed, please select a time between 9am and 5pm')
    end
  end
  

 
  
  # -------------------------------------- Class Methods
  
  def self.order_statuses
    ['ordered', 'paid', 'cancelled', 'completed']
  end
  
  def self.order_statuses_for_select
    order_statuses.collect { |o| [o.humanize, o] }.unshift(['Show All', ''])
  end

  

  # -------------------------------------- Scopes
  
  scope :with_status, -> (status) { where(order_status: status) }
  
end