require "jwt"

class Users::ShowSerializer < Lucky::Serializer
  getter user : User

  def initialize(@user : User)
  end

  def render
    {
      user: {
        username: user.username,
        email:    user.email,
        bio:      user.bio,
        image:    user.image,
        token:    generate_token(user),
      },
    }
  end


  # TODO: where to place this method?
  private def generate_token(user)
    exp = Time.now.to_unix + 14 * 24 * 60 * 60 # 14 days
    payload = { "id" => user.id, "exp" => exp }

    JWT.encode(payload, Lucky::Server.settings.secret_key_base, "HS256")
  end
end
