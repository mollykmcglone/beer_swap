class BeersController < ApplicationController
  before_action :authenticate_user!
  before_action :require_permission, only: [ :edit, :destroy ]

  def new
      @profile = Profile.find(params[:profile_id])
      @beer = @profile.beers.new
      @styles = Style.all
    end

    def create
      @profile = Profile.find(params[:profile_id])
      @beer = @profile.beers.new(beer_params)
      @user = User.find(@profile.user_id)
      @styles = Style.all
      if @beer.save
        flash[:notice] = "Beer successfully posted!"
        respond_to do |format|
          format.html {redirect_to profile_path(@beer.profile_id)}
          format.js
        end
      else
        flash[:alert] = "Oops, something went wrong!"
        redirect_to profile_path(@beer.profile_id)
      end
    end

    def edit
      @profile = Profile.find(params[:profile_id])
      @beer = Beer.find(params[:id])
      @styles = Style.all
    end

    def update
      @profile = Profile.find(params[:profile_id])
      @beer = @profile.beers.find(params[:id])
      @styles = Style.all
      if @beer.update(beer_params)
        flash[:notice] = "Beer successfully updated!"
        redirect_to profile_path(@beer.profile_id)
      else
        flash[:alert] = "Oops, something went wrong!"
        render :edit
      end
    end

    def destroy
      @beer = Beer.find(params[:id])
      @beer.destroy
      redirect_to profile_path(@beer.profile_id)
    end

  private
    def beer_params
      params.require(:beer).permit(:name, :description, :abv, :container_type, :brew_date, :homebrew, :brewery_name, :profile_id, :style_id)
    end

    def require_permission
      if current_user != Profile.find(params[:profile_id]).user
        flash[:alert] = "Whoops! Only the beer's author can edit or delete a beer."
        redirect_to profile_path(Profile.find(params[:profile_id]))
      end
    end
end
