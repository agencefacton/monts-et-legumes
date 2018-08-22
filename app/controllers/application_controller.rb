class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception
    helper_method :current_order
  # before_action :authenticate_user!
  # include Pundit
  # before_action :configure_permitted_parameters, if: :devise_controller?

  # after_action :verify_authorized, except: :index, unless: :skip_pundit?
  # after_action :verify_policy_scoped, only: :index, unless: :skip_pundit?

  # rescue_from Pundit: :NotAuthorizedError, with: :user_not_authorized

  # def configure_permitted_parameters
  #   # For additional fields in app/views/devise/registrations/new.html.erb
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name])

  #   # For additional in app/views/devise/registrations/edit.html.erb
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:username])
  # end


  private

  def skip_pundit?
    devise_controller? || params[:controller] =~ /(^(rails_)?admin)|(^pages$)/
  end

  def current_order
    if session[:order_id]
      Order.find(session[:order_id])
    else
      Order.new(user: current_user, status: 0)
    end
  end



end
