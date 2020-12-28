defmodule ChaApiWeb.Guardian do
  use Guardian, otp_app: :cha_api

  def subject_for_token(resource, _claims) do
    sub = to_string(resource.id)
    {:ok, sub}
  end

  def resource_from_claims(claims) do
    id = claims["sub"]
    resource = ChaApi.UserRepo.get_user!(id)
    {:ok,  resource}
  end
end
