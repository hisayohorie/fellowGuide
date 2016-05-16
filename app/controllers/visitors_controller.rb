class VisitorsController < ApplicationController
  def new
  end

  def edit

  end

  def show
    @visitor = Visitor.find(params[:id])

  end

  def update
    @visitor = Vistor.find(params[:id])
    if @visitor.update_attributes(guide_params)
      flash[:notice] = "your profile is updated."
      redirect_to guide_path(@visitor)
    else
      render :edit
    end
  end

  def destroy
  end
end
