class CreateImages < ActiveRecord::Migration[5.0]
  def change
    create_table :images do |t|
      t.string :path
      t.integer :post_id

      t.timestamps null: false
    end
  end
end
