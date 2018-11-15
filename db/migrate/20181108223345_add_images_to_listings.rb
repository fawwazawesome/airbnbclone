class AddImagesToListings < ActiveRecord::Migration[5.2]
  def change
    add_column :listings, :images, :json 
  end
end
