class PlanDay < ApplicationRecord
  has_many :plan_details, dependent: :destroy
  belongs_to :plan
  accepts_nested_attributes_for :plan_details
end
