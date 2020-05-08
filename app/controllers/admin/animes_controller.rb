class Admin::AnimesController < Admin::Base
  def index
    @animes = Anime.all
    @animes = @animes.page(params[:page])
    @newAnime = Anime.new
  end

  def search
    @animes = Anime.search(params[:search])
    @animes = @animes.page(params[:page])
    render "index"
  end

  def create
    @anime = Anime.new(anime_params)
    @anime.save
    redirect_to :admin_animes, notice: "アニメを追加しました。"
  end

  def destroy
    @anime = Anime.find(params[:id])
    @anime.destroy
    redirect_to :admin_animes, notice: "アニメを削除しました。"
  end

  private def anime_params
    params.require(:anime).permit(:anime_title, :new_anime_picture)
  end
end