class StaticPagesController < ApplicationController
  def index
    @categories = Category.all.includes(:topics)
  end

  private

  attr_reader :category
end