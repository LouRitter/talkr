class Shout < ApplicationRecord
  belongs_to :user
  belongs_to :content, polymorphic: true
  validates :user, presence: true
  validates_associated :content

  default_scope { order(created_at: :desc)}

  delegate :username, to: :user
  delegate :body, to: :content 
end
