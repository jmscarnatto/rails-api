require 'rails_helper'

RSpec.describe Client, type: :model do
  describe 'associations' do
    it { should have_many(:name) }
  end
  describe 'validations' do
    it { should have_db_index(:name) }
  end
end

