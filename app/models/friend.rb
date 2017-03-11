class Friend < ApplicationRecord
  belongs_to :player, class_name: 'Player', foreign_key: 'player_id'
  belongs_to :friend, class_name: 'Player', foreign_key: 'friend_id'

  validates :player, :friend, presence: true
  validates_uniqueness_of :player, scope: :friend
end
