class AccountsController < ApplicationController
  before_action :login_required
  
  def show
    @member = current_member
    @favorites = Favorite.where(member_id: current_member.id)
  end

  def edit
    @member = current_member
  end

  def update
    @member = current_member
    @member.assign_attributes(member_params)
    if @member.save
      flash.notice = 
      redirect_to :account, success: "アカウント情報を更新しました。"
    else
      redirect_to :edit_account, warning: "情報が正しく入力されていません。"
    end
  end

  private def member_params
    params.require(:member).permit(:name, :email)
  end
end
