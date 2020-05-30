class AnimesController < ApplicationController
  def index
    @animes = Anime.all
    @animes = @animes.page(params[:page])
  end

  def search
    @animes = Anime.search(params[:search])
    @animes = @animes.page(params[:page])
    render "index"
  end

  def show
    @anime = Anime.find(params[:id])
    @newpost = Post.new(anime_id: params[:id],
      member_id: current_member&.id, name: current_member&.name)
    @posts = Post.where(anime_id: params[:id])
    @schedules = Schedule.where(anime_id: params[:id])
  end
end