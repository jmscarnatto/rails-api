# frozen_string_literal: true

module Api
  module V1
    # Projects endpoints
    class ProjectsController < ApplicationController
      before_action :check_login

      def index
        @projects = Project.order(:name).page(params[:page]).per(params[:per])
      end

      def create
        @project = Project.create_normalized(params)
        return render json: @project if @project.present?

        render status: 400, json: { error: 'Bad request' }
      end

      def show
        @project = Project.find_by_id(params[:id])
        return render json: @project if @project.present?

        render status: 404, json: { error: 'Project not found' }
      end

      def update
        @project = Project.update_normalized(params)
        return render json: @project if @project.present?

        render status: 404, json: { error: 'Project not found' }
      end

      def destroy
        render status: 400, json: { error: 'This object cannot be deleted | Only if the owner client is deleted' }
      end
    end
  end
end
