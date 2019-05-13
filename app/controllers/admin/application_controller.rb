module Admin
  class ApplicationController < ::ApplicationController
    before_action :authenticate_admin!
    before_action :set_post

    layout 'admin'

    def authenticate_admin!
      redirect_to root_path unless current_user.admin?
    end

    def set_post
      @post = Post.last
    end
  end
end
