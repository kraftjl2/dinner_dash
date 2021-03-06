module ApplicationHelper
  
  def totalPrice
    @total=0
    @order.items.each do |item|
    @total=@total+item[:price]     
    end
   number_to_currency @total
  end
  
  
  def active_class(url = '')
    'active' if current_page?(url)
  end
  
  def active_section_class(section = '')
    'active' if params[:controller].include?(section)
  end
  
  def bootstrap_class_for(flash_type)
    case flash_type
      when :success
        'alert-success'
      when :error
        'alert-danger'
      when :alert
        'alert-warning'
      when :notice
        'alert-info'
      else
        flash_type.to_s
    end
  end
  
end