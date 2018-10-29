class StaticPagesController < ApplicationController
  def index
    @categories = Category.all
    @newest_posts = Post._on params[:context], Settings.post.per_page
  end

  private
end
