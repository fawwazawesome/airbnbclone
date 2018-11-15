class BraintreeController < ApplicationController
  def new
      @reservation = Reservation.find(params[:reservation_id])
      @client_token = Braintree::ClientToken.generate
  end

  def checkout

      reservation = Reservation.find(params[:reservation_id])

      nonce_from_the_client = params[:checkout_form][:payment_method_nonce]

      result = Braintree::Transaction.sale(
      :amount => reservation.total_price, #this is currently hardcoded
      :payment_method_nonce => nonce_from_the_client,
      :options => {
          :submit_for_settlement => true
        }
      )

      if result.success?
        reservation.confirmation = true
        reservation.save

        redirect_to :root, :flash => { :success => "Transaction successful!" }
      else
        redirect_to :root, :flash => { :alert => "Transaction failed. Please try again." }
      end
  end


end
