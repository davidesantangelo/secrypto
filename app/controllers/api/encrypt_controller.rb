require 'crypto'
require 'securerandom'

class Api::EncryptController < Api::BaseController
  def encrypt
    key = SecureRandom.urlsafe_base64
    encrypt = Crypto.encrypt(params[:text], key)
    
    render status: 200, json: { data: encrypt, key: key }
  end
end
