class ProfilesController < ApplicationController
  def show
    @profile = Profile.find(current_user.id)
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
    @profile = Profile.find(current_user.id)
  end

  def update
    @profile = Profile.find(current_user.id)
    if @profile.update(profile_params)
      flash[:notice] = "Profile successfully updated."
      redirect_to profile_path(@profile)
    else
      flash[:alert] = "Oops, something went wrong!"
      render :edit
    end
  end
end
