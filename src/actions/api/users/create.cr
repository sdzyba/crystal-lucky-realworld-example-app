class Api::Users::Create < ApiAction
  post "/api/users" do
    SignUpForm.create(params.nested?(:user)) do |form, user|
      if user
        json ::Users::ShowSerializer.new(user)
      else
        # TODO: list errors
        head 422
      end
    end
  end
end
