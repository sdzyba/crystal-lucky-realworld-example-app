module UserFromToken
  def user_from_token(token : String)
    payload, _header = JWT.decode(token, Lucky::Server.settings.secret_key_base, "HS256")
    UserQuery.new.find(payload["id"].to_s)
  end
end
