require 'rails_helper'

RSpec.describe User, type: :model do
  it 'validate email format' do
    user = FactoryBot.create(:user)
    expect(user.email).to match(/\w{3,}@\w{3,}+\.\w+/)
  end
  it { should have_secure_password }
end
