class CategogiesController < Application
  before :find_category
  def show
    category.topics.includes(:posts)
  end

  attr_reader :category

  def find_category
    @category = Caegory.find_by id: params[:id]
  end
end