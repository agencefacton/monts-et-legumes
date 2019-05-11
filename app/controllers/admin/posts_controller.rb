module Admin
  class PostsController < Admin::ApplicationController
    def edit
      @post = Post.find(params[:id])
    end

    def update
      @post = Post.find(params[:id])
      @post.update(post_params)
      if @post.save
        redirect_to admin_root_path
      else
        render :edit
      end
    end

    private

    def post_params
      params.require(:post).permit(:content)
    end
  end
end
