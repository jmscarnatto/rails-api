# frozen_string_literal: true

module Api
  module V1
    # Clients Endpoints
    class ClientsController < ApplicationController
      before_action :check_login

      def index
        # @clients = Client.all
        @clients = Client.order(:name).page(params[:page]).per(params[:per])
      end

      def create
        # @client = Client.create_normalized(params)
        @client = current_user.clients.create_normalized(params)
        return render json: @client if @client.present?

        render status: 400, json: { error: 'Bad request' }
      end

      def show
        @client = Client.find_by_id(params[:id])
        return render json: @client if @client.present?

        render status: 404, json: { error: 'Client not found' }
      end

      def update
        @client = Client.update_normalized(params)
        return render json: @client if @client.present?

        render status: 404, json: { error: 'Client not found' }
      end

      def destroy
        @client = Client.find_by_id(params[:id])
        if @client.present?
          @client.destroy
          return render json: { success: 'Client deleted successfully' }

        end
        render status: 404, json: { error: 'Client not found' }
      end
    end
  end
end
