class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_order
  before_action :configure_permitted_parameters, if: :devise_controller?

  before_action :authenticate_user!

  def configure_permitted_parameters
    # For additional fields in app/views/devise/registrations/new.html.erb
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :phone_number])

    # For additional in app/views/devise/registrations/edit.html.erb
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :phone_number])
  end

  def after_sign_in_path_for(resource)
    products_path
  end

  private

  def current_order
    current_user.orders.find_or_create_by(week_number: current_week)
  end

  def current_day
    DateTime.current.strftime("%A")
  end

  def current_week
    DateTime.current.strftime("%U")
  end

  def current_year
    DateTime.current.strftime("%U")
  end
end
