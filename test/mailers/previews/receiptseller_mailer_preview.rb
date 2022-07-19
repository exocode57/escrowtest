# Preview all emails at http://localhost:3000/rails/mailers/receiptseller_mailer
class ReceiptsellerMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/receiptseller_mailer/post_created
  def post_created
    ReceiptsellerMailer.post_created
  end

end
