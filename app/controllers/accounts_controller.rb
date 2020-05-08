class AccountsController < ApplicationController
  before_action :login_required
  
  def show
    @member = current_member
  end

  def edit
    @member = current_member
  end

  def update
    @member = current_member
    @member.assign_attributes(member_params)
    if @member.save
      flash.notice = "アカウント情報を更新しました。"
      redirect_to :account
    else
      render action: "edit"
    end
  end

  private def member_params
    params.require(:member).permit(:name, :email)
  end
end
