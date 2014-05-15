class MenusController < ApplicationController
  
  def index
    session[:request_controller] = params[:controller]
  end
  
  
end
