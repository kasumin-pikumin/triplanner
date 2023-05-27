class Plan < ApplicationRecord
  has_many :plan_days, dependent: :destroy
  has_many :plan_details, through: :plan_details
  belongs_to :user, optional: true
  accepts_nested_attributes_for :plan_days
end
