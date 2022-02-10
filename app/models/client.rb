class Client < ApplicationRecord
  validates :name, presence: true 
  has_many :projects, dependent: :destroy
  has_many :employees, through: :projects

  def self.create_normalized(params)
    unless params.key?(:name)
      return { error: 'Lack of parameters | The client must have at least a name and one project (name)' }
    end

    already_exists = find_by_name(params[:name]).present?
    if already_exists
      return { error: 'This client name already exists | Please verify if you are duplicating or give it another name' }
    end

    unless params.key?(:project)
      return { error: 'Lack of parameters | This client must have at least one project (name)' }
    end

    client = create(name: params[:name])
    Project.create(name: params[:project], client_id: client.id)

    { id: client.id, name: client.name, projects: client.projects }
  end

  def self.update_normalized(params)
    client = find_by_id(params[:id])
    return { 'error': 'Client not found' } if client.blank?

    client.update(name: params[:name]) unless params[:name].blank?
    if params.key?(:project)
      already_exists = Project.find_by_name(params[:project]).present?
      if already_exists
        return { error: 'This client already has a project with exactly name | ' \
                        'Please give the project another name or ensure you are not duplicating' }

      end

      Project.create(name: params[:project].titlecase, client_id: client.id)
    end
    { id: client.id, name: client.name, projects: client.projects }
  end
end