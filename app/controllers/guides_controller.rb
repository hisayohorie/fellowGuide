class GuidesController < ApplicationController
  before_action :authenticate_guide!, except: [:index, :show]


  def index
    if params[:language].present?
      languageGuide = Language.find(params[:language]).guides
      @guides = languageGuide.where("Lower(city)LIKE LOWER(?)","%#{params[:city]}%")

    else
      @guides = []
    end

  end

  def new
    @guide = Guide.new
  end

  def show
    if guide_signed_in?
      @guide = Guide.find(current_guide.id)
    elsif visitor_signed_in?
      @booking= Booking.new
      @guide = Guide.find(params[:id])
    else
      @guide = Guide.find(params[:id])
    end
  end

  def create
    @guide = Guide.new(guide_params)
    if @guide.save
      flash[:notice]= "you are a guide now"
      redirect_to guide_path(@guide)
    else
      render :new
    end
  end

  def edit
      @guide = Guide.find(params[:id])
  end

  def update
    @guide = Guide.find(params[:id])
    if @guide.update_attributes(guide_params)
      flash[:notice] = "your profile is updated."
      redirect_to guide_path(@guide)
    else
      render :edit
    end
  end

  def delete
    @guide = Guide.find(params[:id])
    @guide.destroy
    redirect_to root_path
  end

  private
  def guide_params
      params.require(:guide).permit(:id, :first_name, :last_name, :email, :password, :password_confirmation, :photo, :rate, :city, :transportation)
  end

end
