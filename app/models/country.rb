# frozen_string_literal: true

# Role Model
class Country < ApplicationRecord
  include CreationConcern
  has_many :employees
end
