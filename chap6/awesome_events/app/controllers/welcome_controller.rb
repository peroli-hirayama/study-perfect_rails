class WelcomeController < ApplicationController
  PER = 5

  def index
      # search_params 例：
      # {"name_cont"=>"ランチ", "start_time_gteq(1i)"=>"2015", "start_time_gteq(2i)"=>"12", "start_time_gteq(3i)"=>"25"}
      # .search()のところで、Ransack内の命名規則に従ってSQLのwhere句に変換されるっぽい
      @q = Event.page(params[:page]).per(PER).order(:start_time).search(search_params)
      @events = @q.result(distinct: true)
  end

  private

  def search_params
      params.require(:q).permit(:name_cont, :start_time_gteq) # Strong parameter
  rescue
      { start_time_gteq: Time.zone.now }
  end
end
