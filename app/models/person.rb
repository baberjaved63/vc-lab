class Person < ApplicationRecord
  STAGES = %w[Lead Diligence Contacted Closed Rejected].freeze

  belongs_to :company, optional: true

  validates :first_name, :last_name, :email, presence: true
  validates :email, uniqueness: true
  validates :stage, inclusion: {in: STAGES}

  enum stage: STAGES

  def company_name
    company&.name
  end
end
