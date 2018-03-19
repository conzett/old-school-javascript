class DestroyedPlaylistItemsController < ApplicationController
  before_action :set_playlist_item, only: :update

  def update
    @playlist_item.update playlist_item_params
  end

  private

  def set_playlist_item
    @playlist_item = PlaylistItem.unscoped
      .where.not(destroyed_at: nil).find params[:id]
  end

  def playlist_item_params
    params.require(:playlist_item).permit :destroyed_at
  end
end
