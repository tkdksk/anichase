class Admin::SchedulesController < Admin::Base
  def create
    @schedule = Schedule.new(schedule_params)
    @schedule.save
    if @schedule.attribute_present?(:number_of_broadcasts)
      1.upto(@schedule.number_of_broadcasts - 1) do |a|
        Schedule.create(
          start_time: @schedule.start_time.since((a * 7).days),
          broadcaster: @schedule.broadcaster,
          anime_id: @schedule.anime_id
        )
      end
    end
    redirect_to admin_anime_path(params[:schedule][:anime_id])
  end
  
  def destroy
    @schedule = Schedule.find(params[:id])
    @schedule.destroy
    redirect_to :admin_animes
  end

  private def schedule_params
    params.require(:schedule).
      permit(:anime_id, :start_time, :broadcaster, :number_of_broadcasts)
  end
end