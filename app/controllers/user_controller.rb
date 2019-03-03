class UsersController < ApplicationController
  def index
    @users = User.all
    @movie = Movie.all
  end
    
  def edit
    @user = current_user
  end
end

