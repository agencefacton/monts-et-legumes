class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception
    helper_method :current_order
    before_action :configure_permitted_parameters, if: :devise_controller?

    # before_action :authenticate_user!
    # include Pundit

    # after_action :verify_authorized, except: :index, unless: :devise_controller?
    # after_action :verify_policy_scoped, only: :index, unless: :devise_controller?

  # rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  # def user_not_authorized
  #   flash[:alert] = "Connectez-vous pour continuer"
  #   redirect_to(root_path)
  # end

  def configure_permitted_parameters
    # For additional fields in app/views/devise/registrations/new.html.erb
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :phone_number])

    # For additional in app/views/devise/registrations/edit.html.erb
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :phone_number])
  end



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
