class Role < ActiveRecord::Base

  has_many  :artist_roles
  has_many  :users, through: :artist_roles

  has_many  :searched_roles
  has_many  :s_users, through: :searched_roles, source: :user

end
