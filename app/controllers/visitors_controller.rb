class VisitorsController < ApplicationController
  before_action :authenticate_visitor!
  def new
    @visitor = Visitor.new
  end

  def show
    if visitor_signed_in?
    @visitor = Visitor.find(current_visitor.id)
  else
    redirect_to root_path
  end

  def create
    @visitor = Visitor.new(visitor_params)
    if @visitor.save
      flash[:notice]= "Your visitor account has been created!"
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
      flash[:notice] = "Your profile is updated!"
      redirect_to visitor_path(@visitor)
    end
      render :edit
    end
  end

  def delete
    @visitor = Visitor.find(params[:id])
    @visitor.destroy
    redirect_to root_path
  end

  private
  def visitor_params
    params.require(:visitor).permit(:name, :email, :password, :password_confirmation, :photo)
  end
end
