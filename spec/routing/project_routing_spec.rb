require 'rails_helper'

RSpec.describe 'project routing', :aggregate_failures, type: :routing do
  it 'routes projects' do
    expect(get: '/api/v1/projects').to route_to(
      controller: 'api/v1/projects',
      action: 'index',
      format: 'json'
    )
    expect(post: '/api/v1/projects').to route_to(
      controller: 'api/v1/projects',
      action: 'create',
      format: 'json'
    )
    expect(get: '/api/v1/projects/1').to route_to(
      controller: 'api/v1/projects',
      action: 'show',
      id: '1',
      format: 'json'
    )
    expect(patch: '/api/v1//projects/1').to route_to(
      controller: 'api/v1/projects',
      action: 'update',
      id: '1',
      format: 'json'
    )
    expect(delete: '/api/v1//projects/1').to route_to(
      controller: 'api/v1/projects',
      action: 'destroy',
      id: '1',
      format: 'json'
    )
  end
end
