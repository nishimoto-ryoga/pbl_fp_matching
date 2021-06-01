class ClientsController < ApplicationController
  # Clientでログインしていなければsign_inページにリダイレクトされる
  before_action :authenticate_client!

  def mypage
    @client = current_client
    @reservations = @client.reservations.eager_load(:reservation_frame).order(:date)
  end

  def edit
    @client = current_client
  end

  def update
    @client = current_client
    if @client.update!(client_params)
      flash[:success] = '編集しました。'
      redirect_to mypage_clients_path
    else
      flash.now[:danger] = '編集に失敗しました。'
      render :edit
    end
  end

  private

    def client_params
      params.require(:client).permit(:name)
    end
end
