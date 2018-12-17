class User < BaseModel
  include Authentic::PasswordAuthenticatable

  table :users do
    column email : String
    column encrypted_password : String
    column username : String?
    column image : String?
    column bio : String?
  end
end
