require 'crypto'

class Document < ActiveRecord::Base

  def self.encrypt(text)
    document = Document.create!(data: Crypto.encrypt(text, self.generate_key), key: key)

    document.key
  end
  
  def self.decrypt(key)
    document = Document.find_by(key: key)

    return false unless document

    Crypto.decrypt(document.data, key)
  end

  public

  def generate_key
    loop do
      key = SecureRandom.urlsafe_base64
      break key unless Document.where(key: key).first
    end
  end
end