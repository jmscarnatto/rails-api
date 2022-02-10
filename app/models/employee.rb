# frozen_string_literal: true

# Employee Model
class Employee < ApplicationRecord
  validates :name, presence: true
  belongs_to :country
  belongs_to :project
  belongs_to :role

  def self.build_with_role_and_country(params)
    unless params.key?(:name)
      return {
        error: 'Lack of parameters | ' \
               'The employee must have at least a name, country and role | ' \
               'A project_id is optional'
      }
    end
    check_the_project = Project.find_by_id(params[:project_id])
    return { error: 'The project_id is wrong | Verify its existence' } unless check_the_project.present?

    already_exists = where('name = ? AND project_id = ?', params[:name], params[:project_id])
    if already_exists.present?
      return { error: 'This name is already associated with this project | ' \
                      'Please verify if you are duplicating or give the employee another name' }
    end

    unless params.key?(:country) && params.key?(:role)
      return { error: 'Lack of parameters - country and role are required' }
    end

    country = Country.create_normalized(params[:country])
    role = Role.create_normalized(params[:role])
    { name: params[:name].titlecase,
      project_id: params[:project_id] || 1,
      country_id: country.id, role_id: role.id }
  end

  def self.update_normalized(params)
    employee = find_by_id(params[:id])
    return { error: 'Object not found' } if employee.blank?

    new_params = {}
    new_params[:name] = params[:name] unless params[:name].blank?
    new_params[:project_id] = params[:project_id] unless params[:project_id].blank?
    if params.key?(:country)
      country = Country.create_normalized(params[:country])
      new_params[:country_id] = country.id
    end

    if params.key?(:role)
      role = Role.create_normalized(params[:role])
      new_params[:role_id] = role.id
    end
    employee.update(new_params)
  end
end
