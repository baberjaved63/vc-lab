class Company < ApplicationRecord
  has_many :people, dependent: :delete_all

  validates :name, presence: true, uniqueness: true
end
