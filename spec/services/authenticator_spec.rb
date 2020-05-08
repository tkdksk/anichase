require "rails_helper"

describe Authenticator do
  describe "#authenticate" do
    example "正しいパスワードならtrueを返す" do
      m = build(:member)
      expect(Authenticator.new(m).authenticate("pw")).to be_truthy
    end

    example "誤ったパスワードならfalseを返す" do
      m = build(:member)
      expect(Authenticator.new(m).authenticate("xy")).to be_falsey
    end

    example "パスワード未設定ならfalseを返す" do
      m = build(:member, password: nil)
      expect(Authenticator.new(m).authenticate(nil)).to be_falsey
    end
  end
end