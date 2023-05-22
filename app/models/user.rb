class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def self.guest
    find_or_create_by!(email: 'guest@example.com') do |user|
      user.password = SecureRandom.urlsafe_base64

      # 例えば name を入力必須としているならば， user.name = "ゲスト" なども必要
    end
  end

  has_many :plans,dependent: :destroy

  has_many :posts, dependent: :destroy

  has_many :post_comments, dependent: :destroy

  has_one_attached :profile_image

  has_many :favorites, dependent: :destroy

  has_many :relationships, foreign_key: :following_id
  has_many :followings, through: :relationships, source: :follower


  has_many :reverse_of_relationships, class_name: 'Relationship', foreign_key: :follower_id
  has_many :followers, through: :reverse_of_relationships, source: :following


  def get_profile_image
    unless profile_image.attached?
      file_path = Rails.root.join('app/assets/images/default-image.jpg')
      profile_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    profile_image.variant(resize_to_limit: [100, 100]).processed
  end

  def is_followed_by?(user)
    reverse_of_relationships.find_by(following_id: user.id).present?
  end


  def active_for_authentication?
    super && (is_deleted == false)
  end

end
