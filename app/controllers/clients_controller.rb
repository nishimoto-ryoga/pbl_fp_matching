class ClientsController < ApplicationController
  # Clientでログインしていなければsign_inページにリダイレクトされる
  before_action :authenticate_client!
  
  def show
    @client = current_client
    redirect_to client_path(current_client) if @client.id != params[:id].to_i
  end
  
  def edit
  end
  
end
