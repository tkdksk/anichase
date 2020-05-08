class Authenticator
  def initialize(member)
    @member = member
  end

  def authenticate(raw_password)
    @member &&
      @member.hashed_password &&
      BCrypt::Password.new(@member.hashed_password) == raw_password
  end
end