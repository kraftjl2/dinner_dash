module ItemCalculation
  extend ActiveSupport::Concern
  
  def calculate_earliest_pickup_at
    @calculate_earliest_pickup_at ||=begin
    time = Time.zone.now
    # Each item in the store has a preparation time, defaulting to 12 minutes. Items can be edited to take longer.
    # The kitchen can prepare only one item at a time.
    time += items.sum(&:prep_time).minutes
    # If an order has more than six items, add 10 minutes for every additional six items.
    time += ((items.count / 6) * 10).minutes
    # Each already "paid" order in the system which is not "complete" delays the production start of this new order by 4 minutes.
    time += (Order.with_status('paid').count * 4).minutes
    time
    end
  end
  
end