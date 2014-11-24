class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
    	t.string :type
    	t.string :brand
    	t.string :size
    	t.string :color
    	t.text :description
    	t.integer :user_id, null: false, index: true
      t.timestamps null: false

    end
  end
end
