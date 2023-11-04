class Api::V1::Users::SessionsController < Devise::SessionsController
  respond_to :json

  def create
    resource = User.find_for_database_authentication(email: params[:user][:email])
    return invalid_login_attempt unless resource

    if resource.valid_password?(params[:user][:password])
      sign_in :user, resource
      render json: {
        message: "Signed in successfully.",
        user: resource
      }
    else
      invalid_login_attempt
    end
  end

  def destroy
    signed_out = (Devise.sign_out_all_scopes ? sign_out : sign_out(resource_name))
    render json: {
      message: "Signed out successfully."
    } if signed_out
  end

  private

  def invalid_login_attempt
    render json: { error: "Invalid email or password." }, status: :unauthorized
  end
end
