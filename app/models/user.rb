class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one_attached :avatar
  attribute :new_avatar

  has_many :posts, dependent: :destroy
  validates :nick_name, presence: true


  before_save do
    self.image = new_avatar if new_avatar
  end
end
