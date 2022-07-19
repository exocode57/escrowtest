class RedirectpageController < ApplicationController
  skip_before_action :verify_authenticity_token, :only=>[:statuspayment]

  def statuspayment
    Rails.logger.debug("Fucking Twat piece of shit")
    @payment = Payment.find_by(payer_email: params[:buyer_email], payer_name: params[:buyer_name])
    #@stuff = Stuff.find(@payment.stuff_id)
    #@stuff = @stuff.payments.find_by(stuff_code: params [:order_number])
    ReceiptsellerMailer.with(payment: @payment, stuff: @stuff).post_created.deliver_now
    redirect_to pages_about_path
  end
end
