class FavoritePicturesController < ApplicationController
  def index
    @favorite_pictures = []
    @user = User.find(params[:user_id])
    favorites = @user.favorites.order(:created_at)
    favorites.each do |f|
      @favorite_pictures.push(Picture.find_by(id: f.picture_id))
    end
  end
end
