class Admin::MembersController < Admin::Base
  def index
    @members = Member.all
    @members = @members.page(params[:page])
  end

  def search
    @members = Member.search(params[:search])
    @members = @members.page(params[:page])
    render "index"
  end

  def destroy
    @member = Member.find(params[:id])
    @member.destroy
    redirect_to :admin_members, success: "会員を削除しました。"
  end
end