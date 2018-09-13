class Course < ApplicationRecord
  belongs_to :department
  has_many :sections
  # validates_length_of :name, :minimum => 1, :allow_nil => false
end
