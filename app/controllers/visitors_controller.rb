class VisitorsController < ApplicationController
  def new
  end

  def edit
  end

  def show
    @visitor = Visitor.find(params[:id])
  end

  def update
  end

  def destroy
  end
end
