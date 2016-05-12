class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.text    :description
      t.string  :zipcode
      t.integer :soundcloud_id

      t.timestamps null: false
    end
  end
end
