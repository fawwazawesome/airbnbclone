class ListingsController < ApplicationController

	def index
    	@listings = Listing.all
	end

	def show
    	@listing = Listing.find(params[:id])

	end

  	def new
  		@listing = Listing.new
	end

	def edit
  		@listing = Listing.find(params[:id])
	end

	def create
		@listing = Listing.new(listing_params)
 		@listing.user_id = current_user.id

  		if @listing.save
    		redirect_to @listing
  		else
    		render 'new'
  		end
	end
	  
	def update
  		@listing = Listing.find(params[:id])
 
  		if @listing.update(listing_params)
    	redirect_to @listing
  		else
    	render 'edit'
  		end
	end

	def destroy
 		 	@listing = Listing.find(params[:id])
  			@listing.destroy

  			redirect_to listings_path
	end

  def search
      @listings = Listing.all

      @listings = @listings.property(params[:property]) if params[:property].present?
      @listings = @listings.country(params[:country]) if params[:country].present?
      @listings = @listings.rooms(params[:rooms]) if params[:rooms].present?
      render "index"
  end


  private
  	def listing_params
   	 	params.require(:listing).permit(:bookings, :property, :name, :country, :rooms, :toilets, :price ,images: [])
  	end

end
