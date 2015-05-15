class User < ActiveRecord::Base
  
  has_many :posts

  has_secure_password

  def correct_password?(input_password)
    password_digest == MD5.hexdigest(input_password)
  end
  #emailのdowncaseは何のため？

=begin
  def self.new_remember_token
    SecureRandom.urlsafe_base64
  end

  def self.encrypt(token)
    Digest::SHA1.hexdigest(token.to_s)
  end
=end

end
