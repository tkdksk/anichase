require "rails_helper"

describe "アカウント更新" do
  before do
    post session_url,
      params: {
        login_form: {
          email: member.email,
          password: "pw"
        }
      }
  end

  describe "更新" do
    let(:params_hash) { attributes_for(:member) }
    let(:member) { create(:member) }

    example "email属性を変更する" do
      params_hash.merge!(email: "test@example.com")
      patch account_url,
        params: { id: member.id, member: params_hash }
      member.reload
      expect(member.email).to eq("test@example.com")
    end

    example "例外ActionController::ParameterMissingが発生" do
      expect { patch account_url, params: { id: member.id } }.
        to raise_error(ActionController::ParameterMissing)
    end
  end
end