class FavoritesController < ApplicationController
  def create
    @favorite = current_member.favorites.build(anime_id: params[:anime_id])
    @favorite.save!
    redirect_to anime_path(params[:anime_id])
  end

  def destroy
    current_member.favorites.find_by(anime_id: params[:anime_id]).destroy!
    redirect_to anime_path(params[:anime_id])
  end
end
