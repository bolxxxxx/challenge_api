defmodule ChaApiWeb.AuthAccessPipeline do
  use Guardian.Plug.Pipeline, otp_app: :cha_api


  plug Guardian.Plug.VerifyHeader
  plug Guardian.Plug.EnsureAuthenticated
  plug Guardian.Plug.LoadResource
end
