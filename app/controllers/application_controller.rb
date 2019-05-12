class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_order
  helper_method :current_selling_range
  before_action :configure_permitted_parameters, if: :devise_controller?

  before_action :authenticate_user!

  def configure_permitted_parameters
    # For additional fields in app/views/devise/registrations/new.html.erb
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :phone_number])

    # For additional in app/views/devise/registrations/edit.html.erb
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :phone_number])
  end

  def after_sign_in_path_for(resource)
    if sales_period?
      products_path
    else
      wait_path
    end
  end

  def sales_period?
    current_selling_range
  end

  private

  def current_order
    @order ||= current_user.orders.find_or_create_by(selling_range: current_selling_range)
  end

  def current_selling_range
    SellingRange.find_by('starts_at <= ? AND ends_at >= ?', DateTime.current, DateTime.current)
  end

  def current_day
    DateTime.current.strftime("%A")
  end

end
