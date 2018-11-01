class CategoriesController < ApplicationController
  before_action :find_category

  def show
    @posts = Post.where(topic: category.topics).cal_vote.page(params[:page])
  end

  attr_reader :category

  def find_category
    @category = Category.find_by id: params[:id]
  end
end