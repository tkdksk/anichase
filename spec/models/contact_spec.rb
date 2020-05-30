require 'rails_helper'

RSpec.describe Contact, type: :model do

  describe "値の正規化" do
    example "email前後の空白を除去" do
      contact = create(:contact, email: " test@example.com")
      expect(contact.email).to eq("test@example.com")
    end

    example "emailに含まれる全角英数字記号を半角に変換" do
      contact = create(:contact, email: "ｔｅｓｔ＠ｅｘａｍｐｌｅ．ｃｏｍ")
      expect(contact.email).to eq("test@example.com")
    end

    example "email前後の全角スペースを除去" do
      contact = create(:contact, email: "\u{3000}test@example.com\u{3000}")
      expect(contact.email).to eq("test@example.com")
    end
  end

  describe "バリデーション" do
    example "@を2個含むemailは無効" do
      contact = build(:contact, email: "test@@example.com")
      expect(contact).not_to be_valid
    end
  end
end