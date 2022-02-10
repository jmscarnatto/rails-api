require 'spec_helper'

RSpec.shared_examples 'creation' do
  let(:model) { described_class }
  it '...' do
    name = 'Jose'
    expect(model.create_normalized(name)).to be_valid
  end
end
