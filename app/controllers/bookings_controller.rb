class BookingsController < ApplicationController
  def index
    @bookings = Booking.all
  end

  def create
    @guide = Guide.find(params[:guide_id])
    @booking = Booking.new(booking_params)
    @booking.guide_id = @guide.id
    if @booking.save
      flash[:notice] = "Booking requested!"
      redirect_to root_url
    else
      render :new
    end
  end

  def new
    @booking = Booking.new
    @guide = Guide.find(params[:guide_id])
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy

    redirect_to root_path
  end

  def show
    @booking = Booking.find(params[:id])
  end

  def edit
    @booking = Booking.find(params[:id])
  end

  def update
    @booking = Booking.find(params[:id])

    if @booking.update_attributes(booking_params)
      flash[:notice] = "Booking updated!"
      redirect_to booking_path(@booking)
    else
      render :edit
    end

  end

  private
  def booking_params
    params.require(:booking).permit(:duration, :accepted)
  end

end
