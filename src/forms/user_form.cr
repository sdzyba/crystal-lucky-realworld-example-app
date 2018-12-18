class UserForm < User::BaseForm
  fillable email, username, image, bio
  virtual password : String

  def prepare
    Authentic.copy_and_encrypt password, to: encrypted_password unless password.value.nil?
  end
end
