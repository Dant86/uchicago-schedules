class Section < ApplicationRecord
  belongs_to :course

  has_many :user_sections
  has_many :users, through: :user_sections
end
