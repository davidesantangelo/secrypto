class Api::DecryptController < Api::BaseController
  def decrypt
    unless params[:key].present?
      render status: 403, json: { message: 'required param key not found' } and return
    end

    unless Document.find_by(key: params[:key])
      render status: 403, json: { message: 'key not found' } and return
    end

    render status: 200, json: { text: Document.decrypt(params[:key])}
  end
end