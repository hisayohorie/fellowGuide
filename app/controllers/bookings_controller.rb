class BookingsController < ApplicationController
  def index
    @bookings = Booking.all
  end

  def create
    @guide = Guide.find(params[:guide_id])
    @booking = Booking.new(booking_params)
    @booking.guide_id = @guide.id
    @booking.visitor_id = current_visitor.id
    @booking.accepted = false
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
    @experience_id = experience_params[:experience_id]
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy

    redirect_to root_path
  end

  def show
    @booking = Booking.find(params[:id])
    @guide = Guide.find(params[:guide_id])
  end

  def edit
    @guide = Guide.find(params[:guide_id])

    @booking = Booking.find(params[:id])
  end

  def update
    @booking = Booking.find(params[:id])
    @guide = Guide.find(params[:guide_id])
    if @booking.update_attributes(booking_params)
      flash[:notice] = "Booking updated!"
      redirect_to guide_path(@guide)
    else
      render :edit
    end

  end

  private
  def booking_params
    params.require(:booking).permit(:duration, :accepted, :experience_id)
  end

  def experience_params
    params.permit(:experience_id)
  end

end
