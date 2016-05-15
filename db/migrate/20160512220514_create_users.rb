class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
    	t.string  :username
      t.string  :password_digest
    	t.string  :permalink
    	t.string  :avatar_url
    	t.string  :soundcloud_access_token
      t.integer :soundcloud_id
      t.text    :description
      t.string  :zipcode
      
      t.timestamps null: false
    end
  end
end
