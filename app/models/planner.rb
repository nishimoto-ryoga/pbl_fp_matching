class Planner < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  # 予約枠を辿るときにPlannerがわからないという状況を防ぐ
  has_many :reservation_frames, dependent: :restrict_with_exception
end
