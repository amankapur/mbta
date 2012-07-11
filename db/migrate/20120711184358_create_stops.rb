class CreateStops < ActiveRecord::Migration
  def change
    create_table :stops do |t|
      t.string :stop_tag
      t.string :stupid_tag
      t.string :title
      t.string :lat
      t.string :lon
      t.integer :stop_id

      t.timestamps
    end
  end
end
