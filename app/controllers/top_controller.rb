class TopController < ApplicationController
  def index
    @today_animes = [] 
    schedules = Schedule.all
    schedules.each do |schedule|
      if (schedule[:start_time].to_s.match(/#{Time.zone.today.to_s}.+/))
        @today_animes << schedule
      end
    end
  end
end
