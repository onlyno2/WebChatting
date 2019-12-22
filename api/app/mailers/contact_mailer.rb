class ContactMailer < ApplicationMailer
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.contact_mailer.contact_mail.subject
  #
  def contact_mail(params)
    @greeting = 'Hi Admin'
    @content = params[:content]

    mail to: 'dohuybach714@gmail.com', from: params[:email], subject: params[:name]
  end
end
