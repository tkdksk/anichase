class ContactsController < ApplicationController

  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_params)
    if @contact.save
      ContactMailer.contact_mail(@contact).deliver
      redirect_to :root, success: "メッセージを送信しました。"
    else
      redirect_to :new_contact, warning: "情報が正しく入力されていません。"
    end
  end

  private
  def contact_params
    params.require(:contact).permit(:name, :email, :content)
  end
end
