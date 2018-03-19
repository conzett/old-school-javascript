class PostersController < ApplicationController
  def index
    Poster.all
  end
end
