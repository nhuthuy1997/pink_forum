class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  before_action :all_category

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

  def all_category
    @categories = Category.all
  end
end
