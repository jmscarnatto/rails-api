# frozen_string_literal: true

module Api
  module V1
    # Roles endpoints
    class RolesController < ApplicationController
      before_action :check_login

      include Responses

      def index
        @roles = Role.order(:name).page(params[:page]).per(params[:per])
      end

      def create
        create_and_render_entity(:Role, params)
      end

      def show
        find_and_render_entity(:Role, params)
      end

      def update
        update_and_render_entity(:Role, params)
      end

      def destroy
        this_cannot_be_deleted
      end
    end
  end
end
