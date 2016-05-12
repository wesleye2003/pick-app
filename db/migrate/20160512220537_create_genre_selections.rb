class CreateGenreSelections < ActiveRecord::Migration
  def change
    create_table :genre_selections do |t|
      t.integer   :genre_id
      t.integer   :user_id

      t.timestamps null: false
    end
  end
end
