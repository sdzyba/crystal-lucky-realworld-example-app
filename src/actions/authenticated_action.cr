abstract class AuthenticatedAction < ApiAction
  include UserFromToken

  before require_current_user

  getter current_user : User? = nil

  private def require_current_user
    token = context.request.headers["Authorization"]?

    if token.nil?
      head 401
    else
      # TODO: handle error when token invalid
      @current_user = user_from_token(token.split("Token ")[1])
    end

    if @current_user.nil?
      head 401
    else
      continue
    end
  rescue JWT::ExpiredSignatureError | JWT::VerificationError
    head 401
  end

  def current_user
    @current_user.not_nil!
  end
end
