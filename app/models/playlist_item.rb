class PlaylistItem < ApplicationRecord
  include Reorderable

  default_scope { where destroyed_at: nil }

  belongs_to :playlist, touch: true
  belongs_to :poster

  has_many :siblings, through: :playlist, source: :playlist_items

  def playlistable
    poster
  end

  def poster_name=(value)
    poster = Poster.find_by name_parameterized: value.parameterize
    self.poster = poster if poster
  end

  def copy_attrs
    { duration: self.duration, poster_id: self.poster_id }
  end

  # TODO: If destroyed, only allow `destroyed_at` to be set to `nil`

  def destroy
    raise ReadOnlyRecord, "#{self.class} is marked as readonly" if readonly?
    # TODO: destroy_associations
    touch(:destroyed_at) if persisted?
    @destroyed = true
    freeze
  end
end
