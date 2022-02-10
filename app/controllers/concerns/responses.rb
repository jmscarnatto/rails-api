# frozen_string_literal: true

# Responses Concern for Controllers
module Responses
  extend ActiveSupport::Concern

  def create_and_render_entity(model_name, params = {})
    item = Object.const_get(model_name).create_normalized(params[:name])
    return render json: item if item.present?

    render status: 400, json: { error: 'Bad request' }
  end

  def find_and_render_entity(model_name, params)
    item = Object.const_get(model_name).find_by_id(params[:id])
    return render json: item if item.present?

    render status: 404, json: { error: 'Bad request' }
  end

  def update_and_render_entity(model_name, params)
    item = Object.const_get(model_name).update_normalized(params)
    return render json: item if item.present?

    render status: 400, json: { error: 'Bad request' }
  end

  def this_cannot_be_deleted
    render status: 400, json: { error: 'This object cannot be deleted' }
  end
end
