class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.integer   :soundcloud_user_id
      t.string    :soundcloud_username
      t.string    :soundcloud_access_token
      t.string    :soundcloud_refresh_token
      t.datetime  :soundcloud_expires_at
      t.text      :description
      t.string    :zipcode
      t.integer   :soundcloud_id

      t.timestamps null: false
    end
  end
end
