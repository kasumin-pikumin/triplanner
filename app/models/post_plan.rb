class PostPlan < ApplicationRecord
  belongs_to :post
  belongs_to :plan
end
