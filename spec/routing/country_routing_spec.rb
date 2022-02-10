require 'rails_helper'

RSpec.describe 'country routing', :aggregate_failures, type: :routing do
  it 'routes countries' do
    expect(get: '/api/v1/countries').to route_to(
      controller: 'api/v1/countries',
      action: 'index',
      format: 'json'
    )
    expect(post: '/api/v1/countries').to route_to(
      controller: 'api/v1/countries',
      action: 'create',
      format: 'json'
    )
    expect(get: '/api/v1/countries/1').to route_to(
      controller: 'api/v1/countries',
      action: 'show',
      id: '1',
      format: 'json'
    )
    expect(patch: '/api/v1//countries/1').to route_to(
      controller: 'api/v1/countries',
      action: 'update',
      id: '1',
      format: 'json'
    )
    expect(delete: '/api/v1//countries/1').to route_to(
      controller: 'api/v1/countries',
      action: 'destroy',
      id: '1',
      format: 'json'
    )
  end
end
