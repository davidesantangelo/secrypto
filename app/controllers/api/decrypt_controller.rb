class Api::DecryptController < Api::BaseController
  def decrypt
    decrypt = Crypto.decrypt(params[:data], params[:key])
    
    render status: 200, json: { text: decrypt}
  end
end