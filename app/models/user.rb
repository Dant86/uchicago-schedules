class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # validates_length_of :full_name, :minimum => 1, :allow_nil => false

  has_many :user_sections
  has_many :sections, through: :user_section
end
