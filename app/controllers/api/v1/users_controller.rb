module Api
    module V1
      class UsersController < ApplicationController
        def index
        users = User.all
        render json: users
      end
        def create
          user = User.new(user_params)
          if user.save
            render json: user, status: :created
          else
            render json: { errors: user.errors.full_messages }, status: :unprocessable_entity
          end
        end

        def login
            puts "Received email: #{params[:user][:email]}, password: #{params[:user][:password]}"
            user = User.find_by(email: params[:user][:email])
          
            if user && user.valid_password?(params[:user][:password])
              render json: { message: 'Login successful', user: user }
            else
              render json: { error: 'Invalid email or password' }, status: :unauthorized
            end
        end
          
  
        private
  
        def user_params
          params.require(:user).permit(:email, :password)
        end
      end
    end
  end
  