class BookingsController < ApplicationController
  def index


    @guide = Guide.find(params[:guide_id])
    @bookings = @guide.bookings

    # render :json => items.to_json(:only => [:id, :name]),

        respond_to do |format|
          format.html
          format.json do
            # this is in answer to bookings page to display availablity
            render json: @bookings.to_json(only: [:date, :duration])
          end

        end
  end

  def create
    @guide = Guide.find(params[:guide_id])
    @booking = Booking.new(booking_params)
    @booking.guide_id = @guide.id
    @booking.visitor_id = current_visitor.id
    @booking.accepted = false
    respond_to do |format|
      if @booking.save
        format.html
        format.js{}
      else
        format.html
      end
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
    params.require(:booking).permit(:duration, :accepted, :experience_id,:date)
  end

  def experience_params
    params.permit(:experience_id)
  end

end
