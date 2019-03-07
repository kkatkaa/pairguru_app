class UsersController < ApplicationController
  def index
    @users = User.all
    @movies = Movie.all
    @top_commenters = User.joins(:comments).group("users.name").limit(10).order("count(comments.id) desc")
  end
end
