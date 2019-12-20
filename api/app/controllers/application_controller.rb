class ApplicationController < ActionController::API
  def success_response(message, status = :ok)
    render json: ResponseHelper.success(message), status: status
  end

  def error_response(message, status = :bad_request)
    render json: ResponseHelper.error(message), status: status
  end

  def authenticate_request
    if request.headers['Authorization']
      @current_user = AuthHelper.current_user(
        request.headers['Authorization'].split(' ').last
      )
    end
    error_response('Not Authorized', 404) unless @current_user
  end
end
