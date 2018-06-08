class Picture < ApplicationRecord
  validates :image, :comment, presence: true
  validates :comment, length: { maximum: 140 }
  belongs_to :user
  has_many :favorites, dependent: :destroy
  has_many :favorite_users, through: :favorites, source: :user
  mount_uploader :image, ImageUploader
  validates :image, \
    file_size: { \
      in: 5.kilobyte..250.kilobyte,
        message: 'ファイルのサイズは %{min} 以上 %{max} 以下にしてください' }
      # message: 'must be within %{min} and %{max}' }
end
