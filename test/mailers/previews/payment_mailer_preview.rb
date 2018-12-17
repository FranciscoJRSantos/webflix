# Preview all emails at http://localhost:3000/rails/mailers/payment_mailer
class PaymentMailerPreview < ActionMailer::Preview
  def payment_email
    PaymentMailer.with(user: User.first).payment_email
  end
end
