class Plan < ApplicationRecord
  has_many :plan_days, dependent: :destroy
  belongs_to :user, optional: true
  accepts_nested_attributes_for :plan_days
end
