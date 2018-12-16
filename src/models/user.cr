class User < BaseModel
  include Authentic::PasswordAuthenticatable

  table :users do
    column email : String
    column encrypted_password : String
  end
end
