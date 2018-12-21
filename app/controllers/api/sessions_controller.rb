# frozen_string_literal: true

module Api
  class SessionsController < BaseController
    before_action :authenticate_user!, except: [:create]

    def create
      user = User.where(email: params[:email]).first
      if user&.valid_password?(params[:password])
        render json: user.as_json(only: %i[email authentication_token]), status: :created
      else
        head(:unauthorized)
      end
    end

    def destroy
      current_user&.authentication_token = nil
      if current_user.save
        head(:ok)
      else
        head(:unauthorized)
      end
    end
  end
end
