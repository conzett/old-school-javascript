class Poster < ApplicationRecord
  has_many :playlist_items, as: :playlistable

  before_save :parameterize_name

  private

  def parameterize_name
    self.name_parameterized = self.name.parameterize
  end
end
