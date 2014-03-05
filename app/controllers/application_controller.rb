class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
	layout :layout_by_resource

  before_filter :configure_devise_params, if: :devise_controller?


  def configure_devise_params

    devise_parameter_sanitizer.for(:sign_up) do |u|
      u.permit(:first_name, :last_name, :username, :gender, :email, :password, :password_confirmation)
    end

    devise_parameter_sanitizer.for(:sign_in) { |u|
      u.permit(:login, :username, :email, :password, :remember_me)
    }

    devise_parameter_sanitizer.for(:account_update) { |u|
      u.permit(:first_name, :last_name, :username, :email, :password, :password_confirmation, :current_password)
    }

  end

  protected

  after_filter :store_location

  def store_location
    # store last url - this is needed for post-login redirect to whatever the user last visited.
    if request.fullpath != "/users/sign_in" &&
        request.fullpath != "/users/sign_up" &&
        request.fullpath != "/users/password" &&
        request.fullpath != "/users/sign_out" &&
        !request.xhr? # don't store ajax calls
      session[:previous_url] = request.fullpath
    end
  end

  def after_sign_in_path_for(resource)
    session[:previous_url] || root_path
  end

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
