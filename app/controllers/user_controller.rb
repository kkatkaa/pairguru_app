class UserController < ApplicationController
  def index
    @users = User.all
    @movies = Movie.all
  end
    
  def edit
    @user = current_user
  end
end
