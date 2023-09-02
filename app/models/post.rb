class Post < ApplicationRecord

  has_one_attached :image

  belongs_to :user

  has_many :favorites, dependent: :destroy

  has_many :post_comments, dependent: :destroy

  has_many :post_plans, dependent: :destroy

  has_many :plans, through: :post_plans

  accepts_nested_attributes_for :plans


  def get_image
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/no_image_square.jpg')
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    image.variant(resize_to_limit: [300, 200]).processed
  end

  def favorited_by?(user)
    favorites.exists?(user_id: user.id)
  end

end
