require 'rails_helper'

RSpec.describe 'employee routing', :aggregate_failures, type: :routing do
  it 'routes employees' do
    expect(get: '/api/v1/employees').to route_to(
      controller: 'api/v1/employees',
      action: 'index',
      format: 'json'
    )
    expect(post: '/api/v1/employees').to route_to(
      controller: 'api/v1/employees',
      action: 'create',
      format: 'json'
    )
    expect(get: '/api/v1/employees/1').to route_to(
      controller: 'api/v1/employees',
      action: 'show',
      id: '1',
      format: 'json'
    )
    expect(patch: '/api/v1//employees/1').to route_to(
      controller: 'api/v1/employees',
      action: 'update',
      id: '1',
      format: 'json'
    )
    expect(delete: '/api/v1//employees/1').to route_to(
      controller: 'api/v1/employees',
      action: 'destroy',
      id: '1',
      format: 'json'
    )
  end
end
