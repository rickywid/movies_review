class UsersController < ApplicationController
before_action :authenticate_user!

  def show
  	@user = User.find(params[:id])
  	@user_movies = @user.movies
  end
end
