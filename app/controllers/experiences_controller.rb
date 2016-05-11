class ExperiencesController < ApplicationController
  def index
    @experiences = Experience.all
  end

  def new
    @guide = Guide.find(params[:guide_id])
    @experience= @guide.experiences.build
    # binding.pry
  end

  def create
    @guide = Guide.find(params[:guide_id])
    @experience = Experience.new(experience_params)
    @experience.guide_id = @guide.id
    if @experience.save
      flash[:notice] = "Experience created!"
      redirect_to root_url
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
      redirect_to root_url
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
    params.require(:experience).permit(:description)
  end
end
