class Department < ApplicationRecord
  has_many :courses
  # validates_length_of :name, :minimum => 1, :allow_nil => false
end
