require 'crypto'

class Document < ActiveRecord::Base

  def uniq_key
    generate_key
  end

  def self.encrypt(text)
    document = Document.create!(data: Crypto.encrypt(text, uniq_key), key: key)

    document.key
  end
  
  def self.decrypt(key)
    document = Document.find_by(key: key)

    return false unless document

    Crypto.decrypt(document.data, key)
  end

  private

  def generate_key
    loop do
      key = SecureRandom.urlsafe_base64
      break key unless Document.where(key: key).first
    end
  end
end