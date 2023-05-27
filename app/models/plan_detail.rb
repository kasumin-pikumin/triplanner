class PlanDetail < ApplicationRecord
  belongs_to :plan_day
  has_one :master, through: :plan_day
end
