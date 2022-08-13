class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

has_many :books, dependent: :destroy
has_one_attached :user_image

def get_user_image
  unless user_image.attached?
    file_path = Rails.root.join('app/assets/images/no_image.jpg')
    user_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
  end
    user_image
end


end
