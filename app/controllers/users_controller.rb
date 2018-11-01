class UsersController < ApplicationController
  def show
    @user = User.find_by id: params[:id]
    return if user
  end

  attr_reader :user
end
