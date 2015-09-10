class ToursController < ApplicationController
	before_action :authenticate_user!, except: [:index, :show]
	def index
		if params[:category].blank?
			@tours = Tour.all.order("created_at DESC")
		else
			@category_id = Category.find_by(name: params[:category]).id
				@tours = Tour.where(category_id: @category_id).order("created_at DESC")
		end
	end
	def new
		if current_user.admin?
 		 @tour = current_user.tours.build
 		else
 		redirect_to root_path(@user), :flash => { :success => "Anda tidak diperkenankan membuat lokasi baru" }
		end
		
	end

	def create
		@tour = current_user.tours.build(tour_params)
		@tour.save
		if @tour.save
			redirect_to @tour
		else
			render 'new'
		end
	end
	def show
		@tour = Tour.find(params[:id])
	end

	def edit
		if current_user.admin?
 		@tour = Tour.find(params[:id])
 		else
 		redirect_to root_path(@user), :flash => { :success => "Anda tidak diperkenankan mengubah informasi" }
		end
		
	end
 
	def update
		@tour = Tour.find(params[:id])
		if @tour.update(params[:tour].permit(:judul,:latitude,:longitude,:konten, :category_id, :gambar))
			redirect_to @tour
		else
			render 'edit'
		end
	end

	def destroy
		if current_user.admin?
	    @tour = Tour.find(params[:id])
	    @tour.destroy
	       redirect_to tours_path
	       else
 		redirect_to root_path(@user), :flash => { :success => "Anda tidak diperkenankan menghapus informasi" }
		end
	end

	private
	def tour_params
		params.require(:tour).permit(:judul,:latitude,:longitude,:konten, :category_id, :gambar)
	end
end
