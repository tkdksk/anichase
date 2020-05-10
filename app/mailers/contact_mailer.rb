class ContactMailer < ApplicationMailer
  def contact_mail(contact)
    @contact = contact
    mail to:"anichaser@gmail.com",subject: "confirmation"
  end
end
