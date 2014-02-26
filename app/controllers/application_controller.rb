class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
	layout :layout_by_resource

  protected

  def layout_by_resource

  	puts params[:controller]
  	puts params.to_s

    if devise_controller?
      'devise_layout'
   	else 
   		if params[:controller] == 'products' || params[:controller] == 'countries' || params[:controller] == 'inflations'
   			'application_logged_in'
   		else
   			'application'
   		end
  	end
  end


end
