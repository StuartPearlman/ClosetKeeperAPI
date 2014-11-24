class CreateOutfitItems < ActiveRecord::Migration
  def change
    create_table :outfit_items do |t|
    	t.integer :outfit_id, null: false
    	t.integer :item_id, null: false
      t.timestamps null: false
    end
  end
end
