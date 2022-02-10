require 'rails_helper'

RSpec.describe Project, type: :model do
  describe 'associations' do
    it { should have_many(:employees) }
  end
  describe 'validations' do
    it { should belong_to(:client) }
  end
  describe 'should return success' do
    it 'returns a new project' do
      project = build(:project, name: 'Comic Page')
      expect(project.name).to eq('Comic Page')
    end
    it 'returns a new project' do
      project = build(:project, client_id: nil)
      expect(project).to_not be_valid
    end
    it 'new project with client' do
      params = { name: 'New Project', client_id: '3' }
      expect(Project.create_normalized(params)).to eq(params[:client_id])
    end
    it 'edit project with client' do
      params = { id: '3', name: 'New Project Name' }
      expect(Project.update_normalized(params)).to eq(params[:client_id])
    end
  end
end
