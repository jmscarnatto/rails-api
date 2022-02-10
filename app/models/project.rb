# frozen_string_literal: true

# Project Model
class Project < ApplicationRecord
  belongs_to :client
  has_many :employees

  def self.create_normalized(params) 
    unless params.key?(:name)
      return { error: 'Lack of parameters | The project must have at least a name and a client_id associated' }
    end

    unless params.key?(:client_id)
      return { error: 'Lack of parameters | The project must have at least a client_id associated' }
    end

    check_the_client = Client.find_by_id(params[:client_id])
    unless check_the_client.present?
      return { error: 'The client_id is wrong | This client seems not to have been created' }
    end

    already_exists = where('name = ? AND client_id = ?', params[:name], params[:client_id])
    if already_exists.present?
      return { error: 'This project name is already associated with this client | ' \
                      'Please verify if you are duplicating or give the project another name' }
    end

    create(name: params[:name].titlecase, client_id: params[:client_id])
  end

  def self.update_normalized(params)
    project = find_by_id(params[:id])
    return { 'error': 'No object found' } if project.blank?

    unless params.key?(:name) && params.key?(:client_id)
      return { error: 'Project name and client_id must be supplied | Change the project owner is not allowed' }
    end

    check_the_client = Client.find_by_id(params[:client_id])
    unless check_the_client.present?
      return { error: 'The client_id is wrong | This client seems not to have been created' }
    end

    # Verifiy the ownership
    unless project.client_id == params[:client_id]
      return { error: 'The client_id is wrong | Remember you can not change the owner client' }
    end

    already_exists = where('name = ? AND client_id = ?', params[:name], params[:client_id])
    if already_exists.present?
      return { error: 'There is another project with this same name associated to this client | ' \
                      'Please verify if you are duplicating or give the project another name' }
    end

    project.update(name: params[:name].titlecase) unless params[:name].blank?
    { success: 'Project name changed successfuly | Remember you can not change the owner client', project: project }
  end
end
