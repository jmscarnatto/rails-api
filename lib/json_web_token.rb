# frozen_string_literal: true

# Json Web Token Class
class JsonWebToken
  SECRET_KEY = ENV['DEVISE_JWT_SECRET_KEY']

  def self.encode(payload, exp = 4.minutes.from_now)
    payload[:exp] = exp.to_i
    JWT.encode(payload, SECRET_KEY)
  end

  def self.decode(token)
    decoded = JWT.decode(token, SECRET_KEY).first
    HashWithIndifferentAccess.new decoded
  end
end
