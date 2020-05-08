class MembersController < ApplicationController
  def new
    @member = Member.new
  end

  def create
    @member = Member.new(member_params)
    if @member.save
      session[:member_id] = @member.id
      flash.notice = "新規登録しました。"
      redirect_to :root
    else
      flash.now.alert = "情報が正しく入力されていません。"
      render action: "new"
    end
  end

  private def member_params
    params.require(:member).permit(:name, :email, :password)
  end
end
