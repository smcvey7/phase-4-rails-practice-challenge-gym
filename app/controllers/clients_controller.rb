class ClientsController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :render_record_not_found

  def show
    client = find_client
    render json: client
  end

  private
  def find_client
    Client.find_by!(id: params[:id])
  end

  def render_record_not_found
    render json: {error: "client not found"}
  end
end
