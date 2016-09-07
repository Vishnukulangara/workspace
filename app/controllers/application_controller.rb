class ApplicationController < ActionController::Base

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_employee
  your_api_token = 'efc0dfeb-6f9c-41b4-8789-f2794c71e93f'
  mailer = Postmark::ApiClient.new(your_api_token, http_open_timeout: 15)

  def logged
    if current_user
      redirect_to admins_path
    elsif current_employee      
      redirect_to employee_dashboard_index_path
    end
  end


  def current_employee
    @current_employee ||= Client.find(session[:client_id]) if session[:client_id]
  end

  # def after_sign_out_path_for(user)
  # 	render 'devise/sessions#new' 
  # end

  def after_sign_in_path_for(user)
  	'/admins'
  end

  def admin?
    unless current_user
      flash[:error] = "Access denied. Please login as admin to view this page"
      redirect_to root_path
  
    end
  end

  def check_employee
    unless current_employee
      flash[:error] = "Access denied. Please login as employee to view this page"
      redirect_to root_path
  
    end
  end

  
  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, :alert => exception.message
  end
end
