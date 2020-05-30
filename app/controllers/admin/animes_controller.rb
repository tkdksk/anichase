class Admin::AnimesController < Admin::Base
  def index
    @animes = Anime.all
    @animes = @animes.page(params[:page])
    @newAnime = Anime.new
  end

  def show
    @anime = Anime.find(params[:id])
    @new_schedule = Schedule.new(:anime_id => params[:id])
    @schedules = Schedule.where(anime_id: params[:id])
  end

  def search
    @animes = Anime.search(params[:search])
    @animes = @animes.page(params[:page])
    render "index"
  end

  def create
    @anime = Anime.new(anime_params)
    @anime.save
    redirect_to :admin_animes, success: "アニメを追加しました。"
  end

  def destroy
    @anime = Anime.find(params[:id])
    @anime.destroy
    redirect_to :admin_animes, success: "アニメを削除しました。"
  end

  private def anime_params
    params.require(:anime).permit(:title, :official, :new_anime_picture)
  end
end