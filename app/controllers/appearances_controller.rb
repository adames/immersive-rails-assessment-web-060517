class AppearancesController < ApplicationController

  def new
    @appearance = Appearance.new
  end

  def create

    @episode = Episode.find(appearance_params[:episode_id][1])
    @guest = Guest.find(appearance_params[:guest_id][1])

    @appearance = Appearance.new()
    @appearance.rating = appearance_params[:rating]
    @appearance.episode = @episode
    @appearance.guest = @guest
    @appearance.save

    if @appearance.persisted?
      redirect_to appearance_path(@appearance)
    else
      render :new
      #This is so we can show validation errors, when I eventually make validation.
    end
  end

  def show
    @appearance = Appearance.find(params[:id])
  end

private

  def appearance_params
    params.require(:appearance).permit(:rating, :episode_id => [], :guest_id => [])
    # But I'm not done yet!
    #Sample = {"rating"=>"3", "episode_id"=>["", "20"], "guest_id"=>["", "132"]}
  end
end
