# frozen_string_literal: true

# Role Model
class Role < ApplicationRecord
  include CreationConcern
  has_many :employees
end
