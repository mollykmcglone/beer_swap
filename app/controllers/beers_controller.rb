class BeersController < ApplicationController
  before_action :authenticate_user!, only: [ :new, :create, :edit, :update, :destroy ]
  before_action :require_permission, only: [ :edit, :destroy ]

  def index
    @beers = Beer.where(nil)
    @recent_beers = Beer.first(4)
    @styled_beers = Beer.style_id(params[:style_id]) if params[:style_id].present?
    @near_beers = []
    @near_profiles = []
    @near_profiles = Profile.where("neighborhood = ?", params[:neighborhood]) if params[:neighborhood].present?
    if @near_profiles.any?
      @near_profiles.each do |profile|
        if profile.user.beers.any?
          profile.user.beers.each do |beer|
          @near_beers << beer
          end
        end
      end
    end
    @hash = Gmaps4rails.build_markers(@beers) do |beer, marker|
      marker.lat beer.user.profile.latitude
      marker.lng beer.user.profile.longitude
    end
  end

  def new
    @user = User.find(params[:user_id])
    @beer = @user.beers.new
    @styles = Style.all
  end

  def create
    @user = User.find(params[:user_id])
    @beer = @user.beers.new(beer_params)
    @styles = Style.all
    if @beer.save
      respond_to do |format|
        format.html {redirect_to profile_path(@user)}
        format.js
      end
    else
      flash[:alert] = "Oops, something went wrong!"
      redirect_to profile_path(@user)
    end
  end

  def edit
    @user = User.find(params[:user_id])
    @beer = @user.beers.find(params[:id])
    @styles = Style.all
  end

  def update
    @user = User.find(params[:user_id])
    @beer = @user.beers.find(params[:id])
    @styles = Style.all
    if @beer.update(beer_params)
      flash[:notice] = "Beer successfully updated!"
      redirect_to profile_path(@user)
    else
      flash[:alert] = "Oops, something went wrong!"
      render :edit
    end
  end

  def destroy
    @user = User.find(params[:user_id])
    @beer = @user.beers.find(params[:id])
    @beer.destroy
    redirect_to profile_path(@user)
  end

private
  def beer_params
    params.require(:beer).permit(:name, :description, :abv, :container_type, :brew_date, :homebrew, :brewery_name, :user_id, :style_id)
  end

  def require_permission
    if current_user != User.find(params[:user_id])
      flash[:alert] = "Whoops! Only the beer's author can edit or delete a beer."
      redirect_to profile_path(Profile.find(params[:profile_id]))
    end
  end

  def filtering_params(params)
    params.slice(:style_id)
    params.slice(:neighborhood)
  end
end
