# frozen_string_literal: true

module Api
  module V1
    # Countries endpoints
    class CountriesController < ApplicationController
      include Responses
      before_action :check_login

      def index
        @countries = Country.order(:name).page(params[:page]).per(params[:per])
      end

      def create
        create_and_render_entity(:Country, params)
      end

      def show
        find_and_render_entity(:Country, params)
      end

      def update
        update_and_render_entity(:Country, params)
      end

      def destroy
        this_cannot_be_deleted
      end
    end
  end
end
