class ClientsController < ApplicationController
  # Clientでログインしていなければsign_inページにリダイレクトされる
  before_action :authenticate_client!
  before_action :client_check, only: [:show, :edit]
  
  def show
    @client = Client.find(params[:id])
  end
  
  def edit
  end
  
  private
  
  def client_check
    @client = Client.find(params[:id])
    redirect_to client_path(current_client.id) unless @client.id == current_client.id
  end
  
end
