require 'securerandom'

class Api::EncryptController < Api::BaseController
  def encrypt
    unless params[:text].present?
      render status: 403, json: { message: 'required param text not found' } and return
    end
    
    render status: 200, json: { key: Document.encrypt(params[:text]) }
  end
end
