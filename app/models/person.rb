class Person < ApplicationRecord
  belongs_to :company, optional: true

  validates :first_name, :last_name, :email, presence: true
  validates :email, uniqueness: true

  enum stage: %w[Lead Diligence Contacted Closed Rejected]
end
