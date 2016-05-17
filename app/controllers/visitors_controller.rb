class VisitorsController < ApplicationController
  before_action :authenticate_visitor!


  def show
    if visitor_signed_in?
    @visitor = Visitor.find(current_visitor.id)
  else
    redirect_to root_path
  end
end

  private
  def visitor_params
    params.require(:visitor).permit(:first_name, :last_name, :email, :password, :password_confirmation, :photo)
  end
end
