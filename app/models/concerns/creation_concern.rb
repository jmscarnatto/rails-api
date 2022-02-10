# frozen_string_literal: true

# Creation Common Methods
module CreationConcern
  extend ActiveSupport::Concern

  class_methods do
    def create_normalized(name)
      return unless name.present?

      item = find_by_name(name)
      return item if item.present?

      create(name: styled(name))
    end

    def update_normalized(params)
      item = find_by_id(params[:id]) # Prefered over find(id) because of friendly handling
      return { error: 'Object not found' } if item.blank?

      already_exists = find_by_name(params[:name])
      if already_exists.present?
        return { error: "Operation aborted. This #{object_name} already exists", id: already_exists.id }
      end

      item.update(name: styled(params[:name]))
    end

    private

    # Brings the name of the class into string lowercased
    def object_name
      polymorphic_name.downcase
    end

    ## Similar to 'titlecase' but slightly better
    def styled(name)
      name.split.map(&:capitalize).join(' ')
    end
  end
end
