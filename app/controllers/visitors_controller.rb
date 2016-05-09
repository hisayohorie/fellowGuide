class VisitorsController < ApplicationController
before_action :authenticate_visitor!
  def new
    @visitor = Visitor.new
  end

  def show
    @visitor = Visitor.find(params[:id])
  end

  def create
    @visitor = Visitor.new(visitor_params)
    if @visitor.save
      flash[:notice] = "Your account has been created"
      redirect_to visitor_path(@visitor)
    else
      render :new
    end
  end

  def edit
    @visitor = Visitor.find(params[:id])
  end

  def update
    @visitor = Visitor.find(params[:id])
    if @visitor.update_attributes(visitor_params)
      flash[:notice] = "Your account is updated!"
      redirect_to visitor_path(@visitor)
    else
      render :edit
    end
  end


  def destroy
    @visitor = Visitor.find(params[:id])
    @visitor.destroy
    flash[:notice] = "Your account has been deleted!"
    redirect_to root_path
  end

  private
  def visitor_params
    params.require(:visitor).permit(:name, :email, :password, :password_confirmation)
  end

end
