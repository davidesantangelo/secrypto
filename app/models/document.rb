require 'crypto'

class Document < ActiveRecord::Base

  def self.encrypt(text)
    key = self.generate_key
    data = Crypto.encrypt(text, key)
    document = Document.create!(data: data, key: key)
    document.key
  end
  
  def self.decrypt(key)
    document = Document.find_by(key: key)
    Crypto.decrypt(document.data, key)
  end

  def self.generate_key
    loop do
      key = SecureRandom.urlsafe_base64(32)
      break key unless Document.where(key: key).first
    end
  end
end