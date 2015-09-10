class ReviewsController < ApplicationController
	
	def create
		@tour = Tour.find(params[:tour_id])
		@review = @tour.reviews.create(params[:review].permit(:body).merge(:username => current_user.username))
		redirect_to tour_path(@tour)
	end

	def destroy
		if current_user.admin?
	    @tour = Tour.find(params[:tour_id])
	    @review = @tour.reviews.find(params[:id])
	    @review.destroy
	       redirect_to tour_path(@tour)
	       else
 		redirect_to tour_path(@tour), :flash => { :success => "Anda tidak diperkenankan menghapus informasi" }
		end
	end
end

