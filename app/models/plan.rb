class Plan < ApplicationRecord
  has_many :plan_details, dependent: :destroy
  belongs_to :user
end
