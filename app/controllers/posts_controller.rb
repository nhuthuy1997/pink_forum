class PostsController < ApplicationController
  def index
    @posts = Post._on(params[:context]).page(params[:page])
  end
end