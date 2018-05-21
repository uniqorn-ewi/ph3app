class PicturesController < ApplicationController
  before_action :set_picture, only: [:show, :edit, :update, :destroy]
  before_action :logged_in_user, only: [:new, :edit, :show, :destroy]

  def top
    render 'top'
  end

  def index
    @pictures = Picture.order(:created_at)
  end

  def new
    if params[:back]
      @picture = Picture.new(picture_params)
      unless params[:cache][:image].empty?
        @picture.image.retrieve_from_cache! params[:cache][:image]
      end
    else
      @picture = Picture.new
      @picture.user_id = current_user.id
    end
  end

  def confirm
    @picture = Picture.new(picture_params)
    render 'new' if @picture.invalid?
  end

  def create
    @picture = Picture.new(picture_params)
    unless params[:cache][:image].empty?
      @picture.image.retrieve_from_cache! params[:cache][:image]
    end
    if @picture.save
      NotifyMailer.notify_mail(current_user).deliver
      redirect_to pictures_path, notice: "ブログを作成しました！"
    else
      render 'new'
    end
  end

  def show
    @favorite = current_user.favorites.find_by(picture_id: @picture.id)
  end

  def edit
  end

  def update
    if @picture.update(picture_params)
      redirect_to pictures_path, notice: "ブログを編集しました！"
    else
      render 'edit'
    end
  end

  def destroy
    @picture.destroy
    redirect_to pictures_path, notice: "ブログを削除しました！"
  end

  private
  def picture_params
    params.require(:picture).permit(:user_id, :comment, :image, :image_cache)
  end

  def set_picture
    @picture = Picture.find(params[:id])
  end

  def logged_in_user
    redirect_to new_session_path unless logged_in?
  end
end
