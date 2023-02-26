class Membership < ApplicationRecord
  belongs_to :gym
  belongs_to :client

  validates :client, uniqueness: {scope: :gym, message: "a member should only have 1 membership per gym"}
  validates :gym_id, presence: true
  validates :client_id, presence: true
  validates :charge, presence: true

end
