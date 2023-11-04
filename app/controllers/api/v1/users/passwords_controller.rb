# app/controllers/api/v1/users/passwords_controller.rb
class Api::V1::Users::PasswordsController < Devise::PasswordsController
  respond_to :json
end
