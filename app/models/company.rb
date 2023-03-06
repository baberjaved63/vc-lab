class Company < ApplicationRecord
  has_many :people, dependent: :delete_all

  validates :name, presence: true, uniqueness: true

  def self.ransackable_attributes(auth_object = nil)
    %w[name]
  end
end
