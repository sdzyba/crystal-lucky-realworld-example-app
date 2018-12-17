class Api::Users::Create < ApiAction
  post "/api/users" do
    SignUpForm.create(params.nested?(:user)) do |form, user|
      if user
        json ::Users::ShowSerializer.new(user)
      else
        head 401
      end
    end
  end
end
