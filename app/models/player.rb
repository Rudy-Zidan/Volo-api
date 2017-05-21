class Player < ApplicationRecord
  validates :name, presence: true
  validates :facebook_id, uniqueness: true

  has_many  :friends

  def update_friends players
    friends.destroy_all
    players.each do |player|
      add_friend(find_by_facebook(player[:id]))
    end
  end

  def add_friend player
    friends << Friend.new({friend_id: player.id})
  end

  def self.find_by_facebook id
    Player.where(facebook_id: id).first
  end

  def find_by_facebook id
    Player.where(facebook_id: id).first
  end

  def get_rank
    players_id = friends.pluck(:friend_id)
    players_id << id
    Player.where('id in (?)', players_id).order(score:'desc')
  end
end
