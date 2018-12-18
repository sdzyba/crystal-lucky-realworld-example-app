class Api::Users::Update < AuthenticatedAction
  put "/api/user" do
    UserForm.update(current_user, params.nested?(:user)) do |form, updated_user|
      if form.saved?
        json ::Users::ShowSerializer.new(updated_user)
      else
        # TODO: list errors
        head 422
      end
    end
  end
end
