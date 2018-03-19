class SlidesController < ApplicationController
  def show
    render params[:view], layout: 'slides'
  end
end
