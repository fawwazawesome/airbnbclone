class CreateListings < ActiveRecord::Migration[5.2]
  def change
    create_table :listings do |t|
      t.belongs_to  :user
      t.string      :property
      t.string      :name
      t.string      :country
      t.integer     :rooms
      t.integer     :toilets
      t.integer     :price
      t.text        :description
      t.boolean     :verification
      


      t.timestamps
    end
  end
end
