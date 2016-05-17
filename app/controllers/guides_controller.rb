class GuidesController < ApplicationController
  before_action :authenticate_guide!, except: [:index, :show]


  def index
    if params[:language_id].present?
      languageGuide = Language.find(params[:language_id]).guides
      @guides = languageGuide.where("Lower(city)LIKE LOWER(?) and rate < ?","%#{params[:city]}%", params[:rate])


    else
      @guides = []
    end

  end

  # def new
  #   @guide = Guide.new
  # end

  def show
    if guide_signed_in?
      @guide = Guide.find(current_guide.id)
    elsif visitor_signed_in?
      @booking= Booking.new
      @guide = Guide.find(params[:id])
    else
      @guide = Guide.find(params[:id])
<<<<<<< HEAD
    end
  end

  def create
    @guide = Guide.new(guide_params)
    if @guide.save
      flash[:notice]= "you are a guide now"
      redirect_to guide_path(@guide)
    else
      render :new
=======
>>>>>>> a6967ff2b375f64556583e1104688a911997edef
    end
  end

  # def create
  #   @guide = Guide.new(guide_params)
  #   if @guide.save
  #     flash[:notice]= "you are a guide now"
  #     redirect_to guide_path(@guide)
  #   else
  #     render :new
  #   end
  # end
  #
  # def edit
  #     @guide = Guide.find(params[:id])
  # end
  #
  # def update
  #   @guide = Guide.find(params[:id])
  #   if @guide.update_attributes(guide_params)
  #     flash[:notice] = "your profile is updated."
  #     redirect_to guide_path(@guide)
  #   else
  #     render :edit
  #   end
  # end
  #
  # def delete
  #   @guide = Guide.find(params[:id])
  #   @guide.destroy
  #   redirect_to root_path
  # end

  # def create
  #   @guide = Guide.new(guide_params)
  #   if @guide.save
  #     flash[:notice]= "you are a guide now"
  #     redirect_to guide_path(@guide)
  #   else
  #     render :new
  #   end
  # end
  #
  # def edit
  #     @guide = Guide.find(params[:id])
  # end
  #
  # def update
  #   @guide = Guide.find(params[:id])
  #   if @guide.update_attributes(guide_params)
  #     flash[:notice] = "your profile is updated."
  #     redirect_to guide_path(@guide)
  #   else
  #     render :edit
  #   end
  # end
  #
  # def delete
  #   @guide = Guide.find(params[:id])
  #   @guide.destroy
  #   redirect_to root_path
  # end


  private
  def guide_params
      params.require(:guide).permit(:id, :first_name, :last_name, :email, :password, :password_confirmation, :photo, :rate, :city, :transportation)
  end

end
