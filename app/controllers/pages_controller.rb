class PagesController < ApplicationController


	def peta
		@tours = Tour.all
		@hash = Gmaps4rails.build_markers(@tours) do |tour, marker|

  		marker.lat tour.latitude
  		marker.lng tour.longitude
      marker.infowindow render_to_string(:partial => "info", :locals => { :object => tour})
      marker.json({:id => tour.id})


      if tour.category_id == 1
  		marker.picture({
      		"url"=> "http://localhost:3000/assets/alam.png",
      		"width" => 36,
      		"height" => 36
      	})
  		elsif tour.category_id == 2
		marker.picture({
      		"url"=> "http://localhost:3000/assets/museum.png",
      		"width" => 36,
      		"height" => 36
      	})
		elsif tour.category_id == 3
		marker.picture({
      		"url"=> "http://localhost:3000/assets/book.png",
      		"width" => 36,
      		"height" => 36
      	})
		elsif tour.category_id == 4
		marker.picture({
      		"url"=> "http://localhost:3000/assets/market.png",
      		"width" => 36,
      		"height" => 36
      	})
		else
		marker.picture({
      		"url"=> "http://localhost:3000/assets/star.png",
      		"width" => 36,
      		"height" => 36
      	})

  		end

		end
	end
  def info
  @tour = Tour.find(params[:id])
  end
end
