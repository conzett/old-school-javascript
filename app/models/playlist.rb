class Playlist < ApplicationRecord
  has_many :playlist_items, dependent: :destroy
end
