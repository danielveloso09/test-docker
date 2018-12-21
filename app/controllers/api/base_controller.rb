# frozen_string_literal: true

module Api
  class BaseController < ActionController::Base
    include Response
    include ExceptionHandler

    protect_from_forgery with: :exception

    # TODO
    # acts_as_token_authentication_handler_for User, fallback: :none

    before_action :authenticate_user!
  end
end
