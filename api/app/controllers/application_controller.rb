class ApplicationController < ActionController::API
  def success_response(message, status = :ok)
    render json: ResponseHelper.success(message), status: status
  end

  def error_response(message, status = :bad_request)
    render json: ResponseHelper.error(message), status: status
  end
end
