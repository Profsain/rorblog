class UsersController < ApplicationController
  # get all users
  def index
    @users = User.all
  end

  # get a specific user
  def show
    @user = User.find(params[:id])
  end
end
