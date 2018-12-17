class SignUpForm < User::BaseForm
  fillable email, username
  virtual password : String

  def prepare
    validate_required email
    validate_required password
    validate_required username

    Authentic.copy_and_encrypt password, to: encrypted_password
  end
end
