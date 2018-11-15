class AddColumnConfirmation < ActiveRecord::Migration[5.2]
  def change
  	add_column :reservations, :confirmation, :boolean
  end
end
