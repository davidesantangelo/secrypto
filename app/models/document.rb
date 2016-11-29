require 'crypto'

class Document < ActiveRecord::Base
  def self.encrypt(text)
    key = SecureRandom.urlsafe_base64
    Document.create!(data: Crypto.encrypt(text, key), key: key)

    key
  end
  
  def self.decrypt(key)
    document = Document.find_by(key: key)

    return false unless document

    Crypto.decrypt(document.data, key)
  end
end