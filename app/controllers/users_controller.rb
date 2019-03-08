class UsersController < ApplicationController
  before_action :top_commenters

  def index
    @users = User.all
    @movies = Movie.all
  end

  def top_commenters
   @top_commenters = User.joins(:comments).group("users.name").limit(10).order("count(comments.id) desc").where(comments: { created_at: 7.days.ago..Time.now })
  end
end
