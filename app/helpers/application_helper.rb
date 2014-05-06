module ApplicationHelper
  
  def active_class (url = '')
    'active' if current_page?(url)
  end
end
