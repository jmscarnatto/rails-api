require 'rails_helper'

RSpec.describe 'client routing', :aggregate_failures, type: :routing do
  it 'routes clients' do
    expect(get: '/api/v1/clients').to route_to(
      controller: 'api/v1/clients',
      action: 'index',
      format: 'json'
    )
    expect(post: '/api/v1/clients').to route_to(
      controller: 'api/v1/clients',
      action: 'create',
      format: 'json'
    )
    expect(get: '/api/v1/clients/1').to route_to(
      controller: 'api/v1/clients',
      action: 'show',
      id: '1',
      format: 'json'
    )
    expect(patch: '/api/v1//clients/1').to route_to(
      controller: 'api/v1/clients',
      action: 'update',
      id: '1',
      format: 'json'
    )
    expect(delete: '/api/v1//clients/1').to route_to(
      controller: 'api/v1/clients',
      action: 'destroy',
      id: '1',
      format: 'json'
    )
  end
end
