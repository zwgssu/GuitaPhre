class ContactMailer < ApplicationMailer
  def send_mail(contact)
    @contact = contact
    mail(
      from: 'system@example.com',
      to: Rails.application.credentials.hotmail[:email],
      subject: 'お問い合わせ通知'
    )
  end
end