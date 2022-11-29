class SignupsController < ApplicationController
rescue_from ActiveRecord::RecordInvalid, with: :rere

 def create
  new = Signup.create!(signup_params)
  render json: Signup.last.activity, status: :created
 end

 private

 def signup_params
  params.permit(:camper_id, :activity_id, :time) 
 end

 def rere(e)
  render json: { errors: e.record.errors.full_messages }, status: :unprocessable_entity
 end

end
