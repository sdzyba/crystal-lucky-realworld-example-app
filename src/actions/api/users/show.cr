class Api::Users::Show < AuthenticatedAction
  get "/api/user" do
    json ::Users::ShowSerializer.new(current_user)
  end
end
