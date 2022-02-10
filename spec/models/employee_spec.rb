require 'rails_helper'

RSpec.describe Employee, type: :model do
  describe Employee do
    it { should validate_presence_of(:name) }
  end
end
