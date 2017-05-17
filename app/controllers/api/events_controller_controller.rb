class API::EventsControllerController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_filter :set_access_control_headers
  
  def set_access_control_headers
    headers['Access-Control-Allow-Origin'] = '*'
    headers['Access-Control-Allow-Method'] = 'POST, GET, OPTIONS'
    headers['Access-Control-Allow-Headers'] = 'Content-Type'
  end
  
  def create
    registered_app = RegisteredApp.find_by(url: request.env['HTTP_ORIGIN'])

    unless registered_app
      render json: "Unregistered Application", status: :unprocessable_entity
    end

    @event = registered_app.events.new(event_params)
    if @event.save
      render json: @event, status: :created
    else
      render json: {errors: @event.errors}, status: :unprocessable_entity
    end
  end
  
  def preflight
    head 200
  end
  
  private
  
  def event_params
    params.require(:event).permit(:name)
  end
end
