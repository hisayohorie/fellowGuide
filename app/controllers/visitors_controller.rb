class VisitorsController < ApplicationController
  before_action :authenticate_visitor!, except: [:index, :show]
  def new
    @visitor = Visitor.new
  end

  def edit
    @guide = Guide.find(params[:id])
  end

  def show
    @visitor = Visitor.find(params[:id])

  end

  def update
    @visitor = Visitor.find(params[:id])
    if @guide.update_attribute(visitor_params)
      flash[:notice] = "Your profile is updated!"
      redirect_to visitor_path(@visitor)
    end
      render :edit
    end
  end

  def delete
    @visitor = Visitor.find(params[:id])
    @guide.destroy
    redirect_to root_path
  end

  private
  def guide_params
    params.require(:visitor).permit(:name, :email, :password, :password_confirmation, :photo, :rate, :city)
end

end
