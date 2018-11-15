class CreateConfirmation < ActiveRecord::Migration[5.2]
  def change
    create_table :confirmations do |t|
   
      


      t.timestamps
    end
  end
end
