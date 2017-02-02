class DecryptController < ApplicationController
	def decrypt
    unless params[:key].present?
      raise ActionController::RoutingError.new('Not Found')
    end

    unless Document.find_by(key: params[:key])
      raise ActionController::RoutingError.new('Not Found')
    end

    @text = Document.decrypt(params[:key])
	end
end
