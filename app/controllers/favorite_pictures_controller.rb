class FavoritePicturesController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @favorite_pictures = @user.favorite_pictures
  end
end
