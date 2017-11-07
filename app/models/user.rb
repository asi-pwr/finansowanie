class User < ApplicationRecord
  # Include default devise modules. Others available are:
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable
  validates :email, presence: true, uniqueness: true
  validates :full_name, presence: true
  validates :has_training, presence: true
  has_many :applications, through: :users_applications
  belongs_to :organization
end
