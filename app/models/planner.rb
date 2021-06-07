class Planner < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :reservation_frames, dependent: :restrict_with_exception
  validates :name, presence: true, length: { maximum: 10, message: '10文字以内です' }
end
