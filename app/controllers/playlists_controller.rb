class PlaylistsController < ApplicationController
  before_action :set_playlist, only: %i[show]

  def show
  end

  private

  def set_playlist
    @playlist = Playlist.find params[:id]
  end
end
