require 'rails_helper'

RSpec.describe Country, type: :model do
  it_should_behave_like 'creation'
  describe 'associations' do
    it { should have_many(:employees) }
  end
  describe 'validations' do
    it { should have_db_index(:name) }
  end
end
