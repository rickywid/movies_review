class CommentsController < ApplicationController
	def create 
		@movie = Movie.find(params[:movie_id])
		@comment = @movie.comments.new(comment_params)
		@comment.user = current_user
		if @comment.save
			redirect_to @comment.movie
		else 
			flash[:warning] = "Error"
			redirect_to @movie
		end
	end

	private 
		def comment_params
			params.require(:comment).permit(:body, :movie_id, :user_id, :rating)
		end
end
