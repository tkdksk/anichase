class Contact < ApplicationRecord
  include StringNormalizer

  before_validation do
    self.name = normalize_as_text(name)
    self.email = normalize_as_email(email)
    self.content = normalize_as_text(content)
  end

  validates :name, presence: true
  validates :email, presence: true, "valid_email_2/email": true
  validates :content, presence: true
end
