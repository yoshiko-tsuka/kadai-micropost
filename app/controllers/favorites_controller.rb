class FavoritesController < ApplicationController
  before_action :require_user_logged_in
  
  def create
    @micropost = Micropost.find_by(id: params[:micropost_id])
    current_user.favorite(@micropost)
    flash[:success] = 'like'
    @user = current_user
    redirect_to @user
  end

  def destroy
    @micropost = Micropost.find_by(id: params[:micropost_id])
    current_user.unfavorite(@micropost)
    flash[:success] = 'nomal'
    @user = current_user
    redirect_to @user
  end
end
