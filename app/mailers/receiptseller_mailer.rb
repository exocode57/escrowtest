class ReceiptsellerMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.receiptseller_mailer.post_created.subject
  #
  def post_created
    #@greeting = "Hi"
    @payment = params[:payment]
    @stuff = Stuff.find(@payment.stuff_id)
    #@stuff = params[:stuff]

    mail to: @payment.payer_email
  end
end
