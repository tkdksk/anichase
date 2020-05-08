class PasswordsController < ApplicationController
  before_action :login_required

  def show
    redirect_to :edit_password
  end

  def edit
    @change_password_form = ChangePasswordForm.new(object: current_member)
  end

  def update
    @change_password_form = ChangePasswordForm.new(member_params)
    @change_password_form.object = current_member
    if @change_password_form.save
      flash.notice = "パスワードを変更しました。"
     redirect_to :account
    else
      flash.now.alert = "入力に誤りがあります。"
      render action: "edit"
    end
  end
  
  private def member_params
    params.require(:change_password_form).permit(
      :current_password, :new_password, :new_password_confirmation
    )
  end
end
