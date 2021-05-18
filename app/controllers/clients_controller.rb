class ClientsController < ApplicationController
  # Clientでログインしていなければsign_inページにリダイレクトされる
  before_action :authenticate_client!
  
  def show
    @client = Client.find(params[:id])
  end

  def edit
  end
end
