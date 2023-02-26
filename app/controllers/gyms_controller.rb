class GymsController < ApplicationController
rescue_from ActiveRecord::RecordNotFound, with: :render_record_not_found

  def show
    gym = find_gym
    render json: gym
  end

  def destroy
    gym = find_gym
    gym.destroy
    head :no_content
  end

  private
  def find_gym
    Gym.find_by!(id: params[:id])
  end

  def render_record_not_found
    render json: {error: "gym not found"}
  end
end
