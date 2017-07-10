class AppearancesController < ApplicationController

  def new
    @appearance = Appearance.new
  end

  def create
    @appearance = Appearance.create(appearance_params)
    byebug
    redirect_to episodes_path
  end

  def show
    @appearance = Appearance.find(params[:id])
  end

private

  def appearance_params
    params.require(:appearance).permit(:episode_id => [], :guest_id => [], :rating)
    # But I'm not done yet!
    #Sample = {"rating"=>"3", "episode_id"=>["", "20"], "guest_id"=>["", "132"]}
  end
end
