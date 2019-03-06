class UserController < ApplicationController
  def index
    @users = User.all
    @movies = Movie.all
  end
end
