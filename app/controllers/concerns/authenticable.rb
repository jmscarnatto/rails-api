# frozen_string_literal: true

# Responses Concern for Controllers
module Authenticable
  extend ActiveSupport::Concern

  def current_user
    return @current_user if @current_user

    header = request.headers['Authorization']
    return nil if header.nil?

    bearer = header.match(/^Bearer\s(.*)$/)

    begin
      decoded = JsonWebToken.decode(bearer[1])
      @current_user = User.find_by_id(decoded[:user_id])
    rescue
      nil
    end
  end

  protected

  def check_login
    head :forbidden unless current_user.present?
  end
end
