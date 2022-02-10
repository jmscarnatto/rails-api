# frozen_string_literal: true

module Api
  module V1
    # Employees Endpoints
    class EmployeesController < ApplicationController
      before_action :check_login

      def index
        @employees = Employee.order(:name).page(params[:page]).per(params[:per])
      end

      def create
        new_employee = Employee.build_with_role_and_country(params)
        return render status: 400, json: new_employee if new_employee.key?(:error)

        @employee = Employee.create!(new_employee)
        render json: @employee
      end

      def show
        @employee = Employee.find_by_id(params[:id])
        return render json: @employee if @employee.present?

        render status: 404, json: { error: 'Employee not found' }
      end

      def update
        @employee = Employee.update_normalized(params)
        return render json: @employee if @client.present?

        render status: 404, json: { error: 'Employee not found' }
      end

      def destroy
        @employee = Employee.find_by_id(params[:id])
        if @employeet.present?
          @employee.destroy
          return render json: { success: 'Employee deleted successfully' }

        end
        render status: 404, json: { error: 'Employee not found' }
      end
    end
  end
end
