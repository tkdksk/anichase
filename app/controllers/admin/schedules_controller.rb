class Admin::SchedulesController < Admin::Base
  def create
    @schedule = Schedule.new(schedule_params)
    @schedule.save
    redirect_to admin_anime_path(params[:schedule][:anime_id])
  end
  
  def destroy
    @schedule = Schedule.find(params[:id])
    @schedule.destroy
    redirect_to :admin_anime
  end

  private def schedule_params
    params.require(:schedule).
      permit(:anime_id, :start_time, :broadcaster)
  end
end