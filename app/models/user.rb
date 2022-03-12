class User < ApplicationRecord
  include Clearance::User
  has_many :shouts, dependent: :destroy
  validates :username, presence: true, uniqueness: true
end
