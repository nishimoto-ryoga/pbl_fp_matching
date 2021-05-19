class ClientsController < ApplicationController
  # Clientでログインしていなければsign_inページにリダイレクトされる
  before_action :authenticate_client!
  
  def mypage
    @client = current_client
  end
  
  def edit
  end
  
end
