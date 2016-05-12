class Genre < ActiveRecord::Base

  has_many  :genre_selections
  has_many  :users, through: :genre_selections

end
