class ChargesController < ApplicationController

  def new
  end

  def create
    # Amount in cents
    @amount  = 500
    @booking = Booking.find(params[:booking_id])

    customer = Stripe::Customer.create(
      :email => params[:stripeEmail],
      :source  => params[:stripeToken]
    )

    charge = Stripe::Charge.create(
      :customer    => customer.id,
      :amount      => @amount,
      :description => 'Rails Stripe customer',
      :currency    => 'usd'
    )

    if charge.status = :succeeded
      @booking.paid = true
      if @booking.save
          redirect_to root_path
        end
      end
  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to new_charge_path
  end

end
