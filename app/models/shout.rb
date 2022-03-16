class Shout < ApplicationRecord
  belongs_to :user
  belongs_to :content, polymorphic: true
  validates :user, presence: true
  validates_associated :content
  delegate :username, to: :user
  delegate :body, to: :content 
end
