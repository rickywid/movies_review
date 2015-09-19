class MoviesController < ApplicationController

	def index
		@movie = Movie.all
	end

	def new
		@movie = current_user.movies.build
	end

	def create
		@movie = current_user.movies.build(movie_params)
		if @movie.save
			flash[:success] = "Movie Added"
			redirect_to @movie
		else
			render 'new'
		end
	end

	def edit
		@movie = Movie.find(params[:id])
	end

	def update
		@movie = Movie.find(params[:id])
		@movie.update(movie_params)
		flash[:success] = "Movie Updated"
		redirect_to @movie
	end

	def show
		@movie = Movie.find(params[:id])
		@comment = Comment.new
		@movies = Movie.all
		@comments = Comment.where(movie_id: @movie.id)
		if @comments.blank?
			@avg = 0
		else
			@avg = @comments.average(:rating).round(2)
		end
	end

	def destroy
		@movie = Movie.find(params[:id])
		@movie.destroy
		flash[:success] = "Movie Deleted"
		redirect_to root_url
	end

	private
		def movie_params
			params.require(:movie).permit(:title, :description, :image)
		end


end
