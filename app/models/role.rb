class Role < ActiveRecord::Base

  has_many  :artist_roles
  has_many  :users, through: :artist_roles

  has_many  :searched_roles
  has_many  :s_users, through: :searched_roles, source: :user

  def friends
    friends = []
    Relationship.where(sender: self, status: true).each do |rel|
      friends << rel.receiver
    end
    Relationship.where(receiver: self, status: true).each do |rel|
      friends << rel.sender
    end
    friends.uniq
  end







end
