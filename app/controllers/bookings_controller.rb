class BookingsController < ApplicationController
  before_action :authenticate_user!
  before_filter :set_user, only: [:index, :new, :create]
  
  def index
    @bookings = Booking.where(user_id: @user)
  end

  def new
    @booking ||= Booking.new
    render
  end

  def create
    @booking = @user.bookings.new(booking_params)
    if @booking.save
      redirect_to bookings_path, notice: "Awesome! New booking has been save!"
    else
      render 'new'
    end
  end

  private

    def set_user
      @user = current_user
    end

    def booking_params
      params.require(:booking).permit(:item_id, :quantity, :startdate, :enddate)
    end
end