class CampersController < ApplicationController
 
 def index
  camp = Camper.all
  render json: camp, include: :activities, status: :ok
 end
 
 def show
  camp = Camper.find(params[:id])
  render json: camp, status: :ok
 rescue ActiveRecord::RecordNotFound => e
  render json: { error: "Camper not found" }, status: :not_found
 end
 
 def create
  camp = Camper.create!(camper_params)
  render json: Camper.last, status: :created
  rescue ActiveRecord::RecordInvalid => e
   render json: { errors: e.record.errors.full_messages }, status: :unprocessable_entity
 end

 private

 def camper_params
  params.permit(:name, :age)
 end
 
end
