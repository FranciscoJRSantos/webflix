class PaymentMailer < ApplicationMailer
  def payment_email
    @user = params[:user]
    @payment_status = %w[successful unsuccessful].sample
    mail(to: @user.email, subject: "Payment Status: #{@payment_status}")
  end
end
