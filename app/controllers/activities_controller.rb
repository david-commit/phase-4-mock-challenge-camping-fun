class ActivitiesController < ApplicationController

 def index
  act = Activity.all
  render json: act, status: :ok
 end

 def destroy
  act = Activity.find(params[:id])
  act.destroy
  head :no_content
  rescue ActiveRecord::RecordNotFound => e
   render json: { error: "Activity not found" }, status: :not_found
 end

end
