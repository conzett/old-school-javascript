class PlaylistItemsController < ApplicationController
  before_action :set_playlist, only: %i[create update destroy]
  before_action :set_playlist_item, only: %i[update destroy]

  def create
    @playlist_item = @playlist.playlist_items.new playlist_item_params

    if @playlist_item.save
      respond_to do |format|
        format.js
        format.html do
          redirect_to request.referrer
          flash[:notice] = :Created
        end
      end
    else
      # TODO: Add some failure handling 👍
    end
  end

  def update
    @playlist_item.update playlist_item_params
  end

  def destroy
    if @playlist_item.destroy
      respond_to do |format|
        format.js
        format.html do
          redirect_to request.referrer
          flash[:notice] = :Destroyed
        end
      end
    else
      # TODO: Add some failure handling 👍
    end
  end

  private

  def set_playlist_item
    @playlist_item = @playlist.playlist_items.find params[:id]
  end

  def set_playlist
    @playlist = Playlist.find params[:playlist_id]
  end

  def playlist_item_params
    params.require(:playlist_item)
      .permit :duration, :poster_id, :position, :poster_name
  end
end
