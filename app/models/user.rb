class User < ApplicationRecord
  has_many :visit_histories
  has_many :areas
  mount_uploader :image, ImageUploader
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  validates :username, presence: true, uniqueness: true

  def user_iamge(user)
    if user.image.blank? 
      "https://placehold.jp/e4e4ed/e4e4ed/200x200.png"
    else 
      user.image
    end
  end
end
