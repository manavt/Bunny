module Encrypt
  extend ActiveSupport::Concern
  def  encrypt_password
     unless self.provider == "facebook"
       self.password = Digest::MD5.hexdigest(password)
       self.confirm_password = Digest::MD5.hexdigest(confirm_password)
     end
  end
end
