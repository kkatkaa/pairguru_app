class CommentsController < ApplicationController
  before_action :find_movie

  def show
    @comment = Comment.new
  end

  def edit
    @comment = Comment.find(params[:id])
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.movie = @movie
    @comment.user = current_user
    if @comment.save
      flash[:notice] = "The comment has been added"
      redirect_to movie_path(@movie)
    else
      render 'movies/show'
    end
  end

  def update
    @comment = Comment.find(params[:id])
    if @comment.update(comment_params)
      flash[:notice] = "The comment has been updated"
      redirect_to movie_path(@movie)
    else
      render 'edit'
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    flash[:notice] = "The comment has been deleted"
    redirect_to movie_path(@movie)
  end

  private

  def find_movie
    @movie = Movie.find(params[:movie_id])
  end
 
  def comment_params
    params.require(:comment).permit(:user, :body)
  end
end