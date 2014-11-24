class CreateOutfits < ActiveRecord::Migration
  def change
    create_table :outfits do |t|
    	t.string :name, null: false
    	t.integer :user_id, null: false, index: true
    	t.datetime :date_worn
      t.timestamps null: false
    end
  end
end
