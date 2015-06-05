class ManagesController < ApplicationController
  before_action :authenticate_user!
  before_filter :admin_only

  def index
    @manages = Booking.all
  end

  def show
    @manage = Booking.find(params[:id])
    if @manage
      render
    else
      redirect_to manages_path, notice: "Oopss! Booking not found!"
    end
  end
end
