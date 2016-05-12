class Picking < ActiveRecord::Base
  belongs_to  :sender, class_name: "User"
  belongs_to  :receiver, class_name: "User"

  validates :receiver_id, presence: true
  validates :sender_id, presence: true
  validates :sender, uniqueness: {scope: [:sender, :receiver]}
  vaidates :receiver, uniqueness: {scope: :sender}

end
