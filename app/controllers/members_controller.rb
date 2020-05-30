class MembersController < ApplicationController
  def new
    @member = Member.new
  end

  def create
    @member = Member.new(member_params)
    if @member.save
      session[:member_id] = @member.id
      redirect_to :root, success: "新規登録しました。"
    else
      redirect_to :new_member, warning: "情報が正しく入力されていません。"
    end
  end

  private def member_params
    params.require(:member).permit(:name, :email, :password)
  end
end
