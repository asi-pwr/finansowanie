# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  validates :email, presence: true, uniqueness: true, case_sensitive: false,
    format: {with: Devise::email_regexp }
  validates :phone_number, format: {with: /\A[+]*[(]{0,1}[0-9]{1,4}[)]{0,1}[-\s\.\/0-9]*\z/}, allow_blank: true
  validates :full_name, presence: true
  has_many :user_applications, dependent: :destroy
  has_many :user_organizations, dependent: :destroy
  has_many :applications, through: :user_applications, inverse_of: :users, dependent: :destroy
  has_many :organizations, -> { distinct }, through: :user_organizations, inverse_of: :users, dependent: :destroy
end
