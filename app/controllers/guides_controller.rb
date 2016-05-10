class GuidesController < ApplicationController
  before_action :authenticate_guide!

  def index
    # languageGuide = Language.find(params[:language]).guides
    # @guides = languageGuide.where("Lower(city)LIKE LOWER(?)","%#{params[:city]}%")


  end

  def new
    @guide = Guide.new
  end

  def show
    @guide = Guide.find(params[:id])
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
    if @guide.update_attribute(guide_params)
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
      params.require(:guide).permit(:name, :email, :password, :password_confirmation, :photo, :rate, :city)
  end

end
