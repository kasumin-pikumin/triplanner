class Plan < ApplicationRecord


  belongs_to :user

  has_many :plan_days, dependent: :destroy
  has_many :plan_details, through: :plan_details
  
  has_many :post_plans, dependent: :destroy
  has_many :posts, through: :post_plans

  accepts_nested_attributes_for :plan_days
end
