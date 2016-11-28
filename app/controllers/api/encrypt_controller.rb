require 'crypto'
require 'securerandom'

class Api::EncryptController < Api::BaseController
  def encrypt
    encrypt = Crypto.encrypt(params[:text], SecureRandom.urlsafe_base64)
    render status: 200, json: { data: encrypt }
  end
end
