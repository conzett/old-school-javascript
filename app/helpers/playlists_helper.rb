module PlaylistsHelper
  def poster_choices
    Poster.order(name: :asc).collect { |p| [p.name, p.id] }
  end
end
