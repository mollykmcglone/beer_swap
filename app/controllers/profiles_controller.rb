class ProfilesController < ApplicationController
  def show
    @user = User.find(params[:id])
    @profile = Profile.find(@user.id)
  end

  def new
    @profile= Profile.new
  end

  def create
    @user = User.find(current_user)
    @profile = Profile.new(@user)
    @profile.save
  end

  def edit
    @profile = Profile.find_by(user_id: current_user.id)
  end

  def update
    @profile = Profile.find_by(user_id: current_user.id)
    if @profile.update(profile_params)
      flash[:notice] = "Profile successfully updated."
      redirect_to profile_path(@profile)
    else
      flash[:alert] = "Oops, something went wrong!"
      render :edit
    end
  end

private
  def profile_params
    params.require(:profile).permit(:about, :homebrewer, :kegerator, :favorites, :address, :city, :state, :zipcode, :avatar)
  end
end
