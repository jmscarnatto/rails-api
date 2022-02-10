require 'rails_helper'

RSpec.describe 'role routing', :aggregate_failures, type: :routing do
  it 'routes roles' do
    expect(get: '/api/v1/roles').to route_to(
      controller: 'api/v1/roles',
      action: 'index',
      format: 'json'
    )
    expect(post: '/api/v1/roles').to route_to(
      controller: 'api/v1/roles',
      action: 'create',
      format: 'json'
    )
    expect(get: '/api/v1/roles/1').to route_to(
      controller: 'api/v1/roles',
      action: 'show',
      id: '1',
      format: 'json'
    )
    expect(patch: '/api/v1//roles/1').to route_to(
      controller: 'api/v1/roles',
      action: 'update',
      id: '1',
      format: 'json'
    )
    expect(delete: '/api/v1//roles/1').to route_to(
      controller: 'api/v1/roles',
      action: 'destroy',
      id: '1',
      format: 'json'
    )
  end
end
