# frozen_string_literal: true

module Api
  module V1
    # Users Endpoints
    class UsersController < ApplicationController
      before_action :check_owner, only: %i[update destroy]

      def create
        @user = User.new(user_params)

        if @user.save
          render status: 201, json: @user.as_json(only: %i[id email]) # :create
        else
          head(:unprocessable_entity)
        end
      end

      private

      def user_params
        params.require(:user).permit(:email, :password, :password_confirmation)
      end

      def check_owner
        head :forbidden unless @user.id == current_user&.id
      end
    end
  end
end
