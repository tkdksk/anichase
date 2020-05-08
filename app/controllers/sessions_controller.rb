class SessionsController < ApplicationController
  def new
    if current_member
      redirect_to :root
    else
      @form = LoginForm.new
      render action: "new"
    end
  end

  def create
    @form = LoginForm.new(login_form_params)
    if @form.email.present?
      member =
        Member.find_by("LOWER(email) = ?", @form.email.downcase)
    end
    if Authenticator.new(member).authenticate(@form.password)
      session[:member_id] = member.id
      flash.notice = "ログインしました。"
      redirect_to :root
    else
      flash.now.alert = "メールアドレスまたはパスワードが正しくありません。"
      render action: "new"
    end
  end

  private def login_form_params
    params.require(:login_form).permit(:email, :password)
  end

  def destroy
    session.delete(:member_id)
    flash.notice = "ログアウトしました。"
    redirect_to :root
  end
end
