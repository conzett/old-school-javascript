class PresentationController < ApplicationController
  SLIDES = %w[
    slides/title
    slides/repo
    slides/storytime
    slides/orange_barrel
    slides/kiosk
    slides/admin_framework
    slides/yay_rails
    slides/rails_list
    slides/old_school
    default/playlists/1
    slides/controller
    slides/create-1
    slides/create-2
    create/playlists/1
    slides/destroy-1
    slides/destroy-2
    destroy/playlists/1
    slides/render-flash
    slides/update-1
    update/playlists/1
    slides/update-2
    slides/undo-1
    slides/undo-2
    undo/playlists/1
    slides/undo-3
    slides/copy-1
    slides/copy-2
    copy/playlists/1
    slides/reorder-1
    reorder/playlists/1
    slides/reorder-2
    slides/reorder-3
    final/playlists/1
    slides/latency
    final/playlists/1
    slides/what-we-didnt-do
    slides/thanks
  ]

  def index
    @src = SLIDES[params[:index].to_i || 0]
    render layout: 'presentation'
  end
end
