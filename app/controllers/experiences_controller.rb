class ExperiencesController < ApplicationController
  def index
    @experiences = Experience.all
  end

  def new
    @experience = Experience.new  end

  def create
    @experience = Experience.new(experience_params)
    @guide = Guide.find(1)
    if @experience.save
      flash[:notice] = "Experience created!"
      redirect_to guide_experience_path(@experience)
    else
      render :new
    end

  end

  def destroy
    @experience = Experience.find(params[:id])
    @experience.destroy

    redirect_to root_path
  end

  def update
    @experience = Experience.find(params[:id])

    if @experience.update_attributes(experience_params)
      flash[:notice] = "Experience updated!"
      redirect_to experience_path(@experience)
    else
      render :edit
    end
  end

  def edit
    @experience = Experience.find(params[:id])
  end

  def show
    @experience = Experience.find(params[:id])
  end

  private
  def experience_params
    params.require(:experience).permit(:date, :description)
  end
end
