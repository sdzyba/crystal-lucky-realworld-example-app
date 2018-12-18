class Api::Users::Login < ApiAction
  post "/api/users/login" do
    # TODO: pull request ensure_paramable from form.cr to virtual_form.cr
    user_params = LuckyRecord::Params.new(params.nested?(:user))
    SignInForm.new(user_params).submit do |form, user|
      if user
        json ::Users::ShowSerializer.new(user)
      else
        head 401
      end
    end
  end
end
