namespace :webflix do
  desc 'TODO'
  task payment: :environment do
    users = User.where('next_payment <= ?', Time.now)
    users.each do |user|
      PaymentMailer.with(user: user).payment_email.deliver_now
      user.update_attribute(:next_payment, user.next_payment.next_month.to_s)
    end
  end
end
