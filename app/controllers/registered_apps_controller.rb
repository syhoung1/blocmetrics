class RegisteredAppsController < ApplicationController
  def index
    @registered_apps = current_user.registered_apps
  end

  def new
    @registered_app = RegisteredApp.new
  end

  def create
    @registered_app = current_user.registered_apps.new(app_params)
    
    if @registered_app.save
      redirect_to @registered_app, notice: "Your app has been registered!"
    else
      flash[:alert] = "There was an error saving your app!"
      render :new
    end
  end

  def show
    @registered_app = current_user.registered_apps.find(params[:id])
    @events = @registered_app.events.group_by(&:name)
  end

  def edit
    @registered_app = RegisteredApp.find(params[:id])
  end

  def update
    @registered_app = RegisteredApp.find(params[:id])
    @registered_app.assign_attributes(app_params)
    
    if @registered_app.save
      redirect_to @registered_app, notice: "Your changes have been saved!"
    else
      flash[:alert] = "There was an error saving your changes, please try again"
      render :edit
    end
  end

  def app_params
    params.require(:registered_app).permit(:name, :url)
  end
end
