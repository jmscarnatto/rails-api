class ApplicationController < ActionController::API
  include Authenticable

  def route_failure
    render status: 400, json: { errors: 'Bad request'}
  end

  rescue_from ActionDispatch::Http::Parameters::ParseError do # |exception|
    render status: 400, json: { errors: 'Something is wrong with your json. Please check it out' } # [ exception.cause.message ] }
  end
end
